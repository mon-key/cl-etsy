
(in-package #:cl-etsy)

;; some :PARAM types
;; "int", "string", "boolean", "float", "text"
;;
;; "latitude", "longitude", "category"
;; "epoch", "color_triplet", "color_wiggle", "forum_post",
;; "image", "language", "region",  
;; 
;; "user_id_or_name", "shop_id_or_name", "cart_id"
;; "treasury_id", "treasury_search_string", "treasury_title", "treasury_description"
;; 
;;
;; "string (length >= 3)" 
;;
;; arrays
;; "array(int)"
;; "array(string)"
;; "array(shop_id_or_name)" ; "getShop" 
;; "array(team_id_or_name)" ; "findTeams"
;; "array(user_id_or_name)" ; "getUser"
;;
;; enums
;; "enum(active, draft)"                                       ; "createListing"
;; "enum(active, inactive, draft)"                             ; "updateListing"
;; "enum(i_did, collective, someone_else)"                     ; "createListing", "updateListing", 
;; "enum(active, invited, pending)"                            ; "findAllUsersForTeam"
;; "enum(hotness, created)"                                    ; "findAllTreasuries", "findAllUserTreasuries"
;; "enum(up, down)"                                            ; "findAllListingActive", "findAllShopListingsActive", "findAllShopSectionListingsActive",
;;                                                             ; "findAllTreasuries", "findAllUserTreasuries", "findAllUserCharges", "findAllUserPayments"
;; "enum(city, state, country)"                                ; "findAllListingActive"
;; "enum(created, price, score)"                               ; "findAllListingActive", "findAllShopListingsActive"
;; "enum(created, price)"                                      ; "findAllShopSectionListingsActive"
;; "enum(open, unshipped, unpaid, completed, processing, all)" ; "findAllShopReceiptsByStatus"
;;
;; "createListing", updateListing
;; "enum(made_to_order, 2010_2012, 2000_2009, 1993_1999, before_1993, 1990_1992, 1980s, 1970s, 1960s, 1950s, 1940s, 1930s, 1920s, 1910s, 1900s, 1800s, 1700s, before_1700)"
;; "enum(men, women, unisex_adults, teen_boys, teen_girls, teens, boys, girls, children, baby_boys, baby_girls, babies, birds, cats, dogs, pets)"
;; "enum(anniversary, baptism, bar_or_bat_mitzvah, birthday, canada_day, chinese_new_year, cinco_de_mayo, confirmation, christmas, day_of_the_dead, easter, eid, engagement, fathers_day, get_well, graduation, halloween, hanukkah, housewarming, kwanza, prom, july_4th, mothers_day, new_baby, new_years, quinceanera, retirement, st_patricks_day, sweet_16, sympathy, thanksgiving, valentines, wedding)"


;; :NOTE see `demarshall-enum-to-keyword' in cl-etsy/types.lisp
(defun api-type-to-our-type (type-string)
  (cond
    ;; :ADDED
    ;; "findAllListingActive", "findAllShopListingsActive"
    ;; (string= type-string "enum(created, price, score)")
    ;;  'sort-order)
    ;;
    ;; "findAllUserTreasuries"
    ;; (string= type-string "enum(hotness, created)")
    ;; 'sort-order)
    ;;
    ;; "findAllListingActive", "findAllShopListingsActive",
    ;; "findAllShopSectionListingsActive", 
    ;; "findAllTreasuries", "findAllUserTreasuries"
    ;; "findAllUserCharges", "findAllUserPayments",
    ((string= type-string "enum(up, down)") 
     'sort-order)
    ;; "findAllShopSectionListingsActive"
    ((string= type-string "enum(created, price)")
     'sort-on-b)
    ;; "findAllFeaturedTreasuriesByOwner", "getListing", "findAllListingActive",
    ;; "findAllShopListingsActive", "findAllRelatedTags", "createTreasury", "createListing", "updateListing"
    ((string= type-string "array(string)")
     'array-of-strings)
    ;; "getCountry", "getListing", "getImage_Listing", "getOrder",
    ;; "getPaymentTemplate", "getReceipt", "createReceiptOnSandbox",
    ;; "getRegion", "getShippingInfo", "getShippingTemplate",
    ;; "getShippingTemplateEntry", "getShopSection", "getTransaction",
    ;; "createTreasury", "getUserAddress"
    ((string= type-string "array(int)")
     'array-of-ints)
    ;; Not in output of getMethodTable
    ((string= type-string "enum(low, medium, high)")
     'detail-level)
    ;; Not in output of getMethodTable
    ((string= type-string "enum(created, ending)")
     'sort-on-a)
    ;; Not in output of getMethodTable
    ((string= type-string "enum(true, false)")
     'boolean)
    (t 
     (underscore-to-dash type-string))))

(defun build-methods (&key (method-output-file *build-methods-default-output-pathname*))
  (flet ((url-builder (url-template parameters)
           (let* (;; (required-args)
                  (required-args ())
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
                                    :parameters `(("api_key" . ,cl-etsy:*api-key*)))))))
      (with-json-bindings (results) json
        ;; (let ((*package* (symbol-package 'cl-etsy::build-methods)))
        (let ((*package* (symbol-package 'build-methods)))
          (with-open-file  (*standard-output* cl-etsy::*build-methods-default-output-pathname* ; :WAS "methods.lisp"
                                              :direction :output
                                              :if-exists :rename-and-delete)
            (let ((*print-case* :downcase))
              ;; (format t "~&;; -*- mode: lisp; syntax: common-lisp; -*-")
              (format t "~&;;; Generated by `build-methods' in cl-etsy/api-utils.lisp (so don't edit)")
              ;; (format t "~&(in-package \"ETSY\")")
              (format t "~&(in-package #:cl-etsy)")
              (loop
                 for method in results
                ;; do (name description uri params defaults type visibility http-method) method
                 do (with-json-bindings (name description uri params type) method
                      (let ((parameters (loop
                                          for (key . type1) in params
                                          as type = (api-type-to-our-type type1)
                                          collect (list (underscore-to-dash (symbol-name key))
                                                        type))))
                        (multiple-value-bind (url-bits required-parameters optional-parameters) (url-builder uri parameters) 
                            
                          (format t "~&")
                          (pprint
                           `(defun ,(camel-to-lisp name)
                                (,@(mapcar #'car required-parameters)
                                 ,@(when optional-parameters '(&key))
                                 ,@(mapcar #'car optional-parameters))
                              ,description
                              ,@(loop
                                   for (name type) in required-parameters
                                   collect `(parameter-type-check ,type ,name))
                              (demarshall-results 
                               (with-api-call ,url-bits ,@optional-parameters)
                               ,type
                               ',(build-symbol "DEMARSHALL" type)))))))))))))))


;; (url-builder (url-template parameters)
;;              (let* (;; (required-args)
;;                     (required-args ())
;;                     (url-bits
;;                       (loop 
;;                         for bit in (cl-ppcre:split "[{}]" url-template)
;;                         as var = nil then (not var)
;;                         collect (cond
;;                                   (var
;;                                    (let* ((v (underscore-to-dash bit))
;;                                           (p (find v parameters :key #'car)))
;;                                      (push p required-args)
;;                                      `(marshall-type ,(second p) ,v)))
;;                                   (t
;;                                    bit))))
;;                     (optional-args 
;;                       (set-difference parameters required-args :test #'equal)))
;;                (values url-bits required-args optional-args)))

(defmacro with-api-call ((&rest url-bits) &rest optional-parameters)
  `(let ((cgi-args (list (cons "api_key" cl-etsy:*api-key*))))
     ,@(loop
          for (name type) in optional-parameters
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
  ((functions-for-demarshall
    ;; :NOTE why is allocation :class?
    ;;  When/where is functions-for-demarshall slot-value mutated?
    ;;  - Apparently from within expansions of `def-api-class' there is punning
    ;;    on the loop var FUNCTIONS-FOR-DEMARSHALL which holds a sequence of
    ;;    existing class allocated slot-value of functions-for-demarshall such
    ;;    that each new `def-api-class' can update the allocation at runtime.
    ;;  - We should pay attention to this an perhaps consider using a global variable instead???
    :allocation :class
    :initform (make-hash-table))))

(defmethod fill-out-etsy-object-from-json ((x etsy-object) json)
  (with-slots (functions-for-demarshall) x
    (loop
       for (key . value) in json
       as slot-name = (keyword-to-lisp-symbol key)
       as func = (gethash slot-name functions-for-demarshall)
       do (setf (slot-value x slot-name) (funcall func value))))
  x)

(defclass api-slot-description ()
  ((class
    :type api-class-description
    :initarg :class)
   (plist
    :initform nil)
   (name
    :type symbol
    :initarg :name)
   (documentation
    :type string
    :initarg :documentation)
   (detail-level
    :type symbol
    :initarg :detail-level)
   (type
    :type symbol
    :initarg :type))
  (:documentation
   "Holds declarative information about a slot in a result, as gleaned from the API spec."))

(defclass api-class-description ()
  ((name
    :type symbol)
   (plist
    :initform nil)
   (superclass
    :type symbol)
   (documentation
    :type string)
   (slot-descriptions
    :type list))
  (:documentation
   "Holds declarative info about each result type, as gleaned from the API spec."))

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
       ;; if json-key does not map to a value in *lisp-keyword-dictionary*
       ;; ensure that it does and while doing so replace "--" with "-"
       (unless json-key
         (setf json-key (lisp-to-json-keyword name)))
       (push `(make-instance 'api-slot-description
                             :class api-class-info
                             :name ',name
                             :type ',type
                             :detail-level ',level) build-api-slot-descriptions)
       (push `(,name :documentation ,doc) class-fields)
       (push `(setf (gethash ',name x) ',(build-symbol "DEMARSHALL" type)) functions-for-demarshall)
       ;; set key/value pairs mapping in hash-table *lisp-keyword-dictionary* 
       ;;  name     -> json-key
       ;;  json-key -> name
       (push `(establish-list-keyword-mapping ',name ,json-key) stms))))