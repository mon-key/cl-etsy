;;; :FILE-CREATED <Timestamp: #{2012-07-21T16:37:24-04:00Z}#{12296} - by MON>
;;; :FILE cl-etsy/api-response.lisp
;;; ==============================


(defun api-response-hash-string-list-for-object-key-fn (string-list munging-function)
  (loop 
    for api-string in string-list
    for munged = (funcall munging-function api-string)
    do (multiple-value-bind (val foundp) (gethash api-string *api-response-string-symbol-hash-for-object-key-fn*)
         (unless (and val foundp)
           (setf (gethash api-string *api-response-string-symbol-hash-for-object-key-fn*)
                 munged)))
       (multiple-value-bind (val foundp) (gethash munged *api-response-string-symbol-hash-for-object-key-fn*)
         (unless (and val foundp)
           (setf (gethash munged *api-response-string-symbol-hash-for-object-key-fn*)
                 api-string)))))

(defun api-response-string-to-symbol-lookup (string)
  (or (gethash string *api-response-string-symbol-hash-for-object-key-fn*)
      string))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (api-response-hash-string-list-for-object-key-fn
   '("pagination" ; :PAGINATION
     "type"       ; :TYPE 
     "params"     ; :PARAMS 
     "count"      ; :COUNT
     "results")   ; :RESULTS
   #'symbol-munger:underscores->keyword)
  
  (api-response-hash-string-list-for-object-key-fn
   '("http_method"
     "visibility"
     "type"
     "defaults"
     "params"
     "uri" 
     "description"
     "name")
   #'symbol-munger:underscores->keyword)
  )


;; Following may change as/when we begin incorporationg magic for converting
;; keys of responses values from string -> symbols/keywords

;; (split-uri-component-on-embedded-parameter "/shops/:shop_id/sections/:shop_section_id/listings/active")
;; (split-uri-component-on-embedded-parameter "/shops/sections/listings/active")
(defun split-uri-component-on-embedded-parameter (uri-component)
  (declare (string uri-component))
  (flet ((char-colonp (x)
           (declare (character x))
           (char= x #\:)))
    (values
     (and (some #'char-colonp uri-component)
          (loop 
            for component in (split-sequence:split-sequence  #\/ uri-component :remove-empty-subseqs t)
            collect (if (char= (char component 0) #\:)
                        (string-upcase (symbol-munger:underscores->lisp-name (subseq component 1)))
                        component)))
     uri-component)))

(defun api-method-public-p (api-method-alist)
  "
:SEE-ALSO `api-request-visibility'."
  (equal (cdr (assoc :visibility api-method-alist)) "public"))

(defun api-method-name-to-lisp-name (api-method-alist)
  (symbol-munger:camel-case->lisp-name 
   (cdr (assoc :name api-method-alist))))

(defun api-method-http-method-type (api-method-alist)
  "Return as the http-method specified in API-METHOD-ALIST as cl:values.
Return values have one of the following form:
 :GET    \"GET\"
 :PUT    \"PUT\"
 :POST   \"POST\"
 :DELETE \"DELETE\"
 NIL     NIL
:SEE-ALSO `api-request-visibility'."
  (let ((maybe-http-method (cdr (assoc :http-method api-method-alist))))
    (cond ((null maybe-http-method)
           (values nil nil))
          ((string= maybe-http-method "GET")
           (values :get maybe-http-method))
          ((string= maybe-http-method "PUT")
           (values :put maybe-http-method))
          ((string= maybe-http-method "POST")
           (values :post maybe-http-method))
          ((string= maybe-http-method "DELETE")
           (values :delete maybe-http-method)))))

(defun api-method-description-to-docstring (api-method-alist)
  (format nil "~A~&~%:EXAMPLE~2%:API-METHOD ~S~2%:VISIBILITY ~S~2%:SEE-ALSO ."
          (or (cdr (assoc :description api-method-alist)) "")
          (or (cdr (assoc :name api-method-alist)) "")
          (or (and (api-method-public-p api-method-alist) :public) :private)))




;;; ==============================
;;; EOF
