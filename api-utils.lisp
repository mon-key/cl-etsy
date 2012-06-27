;; -*- mode: lisp; syntax: common-lisp; -*-

(in-package "ETSY")

(defun api-type-to-our-type (type-string)
  (cond
    ((string= type-string "enum(low, medium, high)")
     'detail-level)
    ((string= type-string "enum(up, down)")
     'sort-order)
    ((string= type-string "enum(created, ending)")
     'sort-on-a)
    ((string= type-string "enum(created, price)")
     'sort-on-b)
    ((string= type-string "enum(true, false)")
     'boolean)
    ((string= type-string "array(string)")
     'array-of-strings)
    ((string= type-string "array(int)")
     'array-of-ints)
    (t 
     (underscore-to-dash type-string))))

(defun build-methods ()
  (flet ((url-builder (url-template parameters)
           (let* ((required-args)
                  (url-bits
                   (loop 
                     for bit in (cl-ppcre:split "[{}]" url-template)
                     as var = nil then (not var)
                     collect (cond
                               (var
                                (let* ((v (underscore-to-dash bit))
                                       (p (find v parameters :key #'car)))
                                  (push p required-args)
                                  `(marshall-type ,(second p) ,v)))
                               (t
                                bit))))
                  (optional-args 
                   (set-difference parameters required-args :test #'equal)))
             (values url-bits required-args optional-args))))
    (let ((json
           (json:decode-json-from-string
            (flexi-streams:octets-to-string
             (drakma:http-request (concatenate 'string *base-url* "/")
                                    :parameters `(("api_key" . ,*api-key*)))))))
      (with-json-bindings (results) json
        (let ((*package* (symbol-package 'build-methods)))
          (with-open-file  (*standard-output* "methods.lisp"
                                              :direction :output
                                              :if-exists :rename-and-delete)
            (let ((*print-case* :downcase))
              (format t "~&;; -*- mode: lisp; syntax: common-lisp; -*-")
              (format t "~&;;; Generated by build-methods in base.lisp (so don't edit)")
              (format t "~&(in-package \"ETSY\")")
              (loop for method in results
                    do (with-json-bindings (name description uri params type) method
                         (let ((parameters (loop for (key . type1) in params
                                                 as type = (api-type-to-our-type type1)
                                                 collect (list (underscore-to-dash (symbol-name key))
                                                               type))))
                           (multiple-value-bind (url-bits required-parameters optional-parameters) 
                               (url-builder uri parameters)
                             (format t "~&")
                             (pprint
                              `(defun ,(camel-to-lisp name) (,@(mapcar #'car required-parameters)
                                                             ,@(when optional-parameters '(&key))
                                                             ,@(mapcar #'car optional-parameters))
                                 ,description
                                 ,@(loop for (name type) in required-parameters
                                         collect `(parameter-type-check ,type ,name))
                                 (demarshall-results 
                                  (with-api-call ,url-bits ,@optional-parameters)
                                  ,type
                                  ',(build-symbol "DEMARSHALL" type)))))))))))))))




(defmacro with-api-call ((&rest url-bits) &rest optional-parameters)
  `(let ((cgi-args (list (cons "api_key" etsy::*api-key*))))
     ,@(loop for (name type) in optional-parameters
          collect `(when ,name
                     (parameter-type-check ,type ,name)
                     (push (cons ,(lisp-to-cgi name) (marshall-type ,type ,name))
                           cgi-args)))
      (api-call (concatenate 'string *base-url* ,@url-bits) cgi-args)))


(defun api-call (url cgi-args)
  (json:decode-json-from-string
   (flexi-streams:octets-to-string
    (multiple-value-bind (doc code)
        (with-interval-timer (*etsy-api-request-timer*)
          (drakma:http-request url :parameters cgi-args))
      (unless (eq 200 code)
        (error "Failed API call ~D ~A" code doc))
      doc))))

(defmacro parameter-type-check (type value)
  (declare (ignore type))
  `,value)

(defmacro with-result-type-check ((type) &body body)
  (declare (ignore type))
  `(progn ,@body))

(defmacro marshall-type (type value)
  `(,(build-symbol "MARSHALL" type) ,value))

(defmacro demarshall-type (type value)
  `(,(build-symbol "DEMARSHALL" type) ,value))



(defun demarshall-results (json element-type element-demarshall)
  (with-json-bindings (count type results) json
    (assert (string= type element-type) () "Type ~S returned was expecting ~S" type element-type)
    (values (mapcar element-demarshall results) count)))

;;;; Meta data about the API

(defclass etsy-object ()
  ((functions-for-demarshall :allocation :class :initform (make-hash-table))))

(defmethod fill-out-etsy-object-from-json ((x etsy-object) json)
  (with-slots (functions-for-demarshall) x
    (loop
       for (key . value) in json
       as slot-name = (keyword-to-lisp-symbol key)
       as func = (gethash slot-name functions-for-demarshall)
       do
         (setf (slot-value x slot-name) (funcall func value))))
  x)

(defclass api-slot-description ()
  ((class :type api-class-description :initarg :class)
   (plist :initform nil)
   (name :type symbol :initarg :name)
   (documentation :type string :initarg :documentation)
   (detail-level :type symbol :initarg :detail-level)
   (type :type symbol :initarg :type))
  (:documentation "Holds declarative information about a slot in a result, as gleaned from the API spec."))

(defclass api-class-description ()
  ((name :type symbol)
   (plist :initform nil)
   (superclass :type symbol)
   (documentation :type string)
   (slot-descriptions :type list))
  (:documentation "Holds declarative info about each result type, as gleaned from the API spec."))

(defmacro api-class-info (class-name)
  `(get ,class-name :api-class-info))

(defmethod slot-description ((x api-class-description) slot-name)
  (with-slots (slot-descriptions) x
    (find slot-name slot-descriptions :key #'(lambda (sd) (slot-value sd 'name)))))

(defmacro def-api-class (name (&optional (superclass 'etsy-object)) doc fields)
  (loop
    with stms = ()
    with functions-for-demarshall = ()
    with build-api-slot-descriptions = ()
    with class-fields
    finally
 (return
   `(progn
      (let ((api-class-info (make-instance 'api-class-description)))
        (with-slots (name documentation superclass slot-descriptions) api-class-info
          (setf name ',name)
          (setf superclass ',superclass)
          (setf documentation ,doc)
          (setf slot-descriptions (list ,@(nreverse build-api-slot-descriptions))))
        (setf (api-class-info ',name) api-class-info))
      (defclass ,name (,superclass)
        ((functions-for-demarshall
          :initform (let ((x (copy-hash-table (slot-value (make-instance ',superclass)
                                                          'functions-for-demarshall))))
                      ,@functions-for-demarshall
                      x))
         ,@(nreverse class-fields))
        (:documentation ,doc))
      ,@stms
      (defun ,(build-symbol "DEMARSHALL" name) (x)
        (fill-out-etsy-object-from-json (make-instance ',name) x))))

    for field in fields
    do
 (destructuring-bind (name &key level type doc json-key) field
   (unless json-key (setf json-key (lisp-to-json-keyword name)))
   (push `(make-instance 'api-slot-description
                         :class api-class-info
                         :name ',name
                         :type ',type
                         :detail-level ',level) build-api-slot-descriptions)
   (push `(,name :documentation ,doc) class-fields)
   (push `(setf (gethash ',name x) ',(build-symbol "DEMARSHALL" type)) functions-for-demarshall)
   (push `(establish-list-keyword-mapping ',name ,json-key) stms))))
