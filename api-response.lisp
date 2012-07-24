;;; :FILE-CREATED <Timestamp: #{2012-07-21T16:37:24-04:00Z}#{12296} - by MON>
;;; :FILE #P"cl-etsy/api-response.lisp"
;;; ==============================

#|

|#

(in-package #:cl-etsy)


(defun ensure-api-class-finalized (api-class)
  ;; By default cl:find-class errors when class does not exist.
  (let ((found-class (find-class api-class)))
    (if (closer-mop:class-finalized-p found-class)
        found-class
        (closer-mop:ensure-finalized found-class))))

(defun api-class-direct-slot-definition-names (api-class)
  ;; 
  (map 'list #'closer-mop:slot-definition-name
       (closer-mop:class-direct-slots (ensure-api-class-finalized api-class))))

(defun api-class-slot-names-as-lispy-strings (api-class)
  ;; (api-class-slot-names-as-lispy-strings 'api-method)
  (map 'list #'api-class-slot-name-as-lispy-string
       (api-class-direct-slot-definition-names api-class)))

;; (symbol-munger:lisp->underscores 
(defun api-class-slot-names-as-underscored-strings (api-class)
  (map 'list #'api-class-slot-name-as-underscored-string
       (api-class-direct-slot-definition-names api-class)))

(defun api-response-string-to-symbol-lookup (string)
  (or (gethash string *api-response-string-symbol-hash-for-object-key-fn*)
      string))

;; (gethash "pagination" *api-response-string-symbol-hash-for-object-key-fn*)

;; Once we start evaluating #'api-class-slot-names-as-underscored-strings
;; the following form will need to come _after_ the ASDF api-class component.
(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; standard response value
  (api-string-or-symbol-list-hash-for-object-key-fn
   (list
    "pagination" ; :PAGINATION
     "type"       ; :TYPE 
     "params"     ; :PARAMS 
     "count"      ; :COUNT
     "results")   ; :RESULTS
   #'symbol-munger:underscores->keyword
   :element-type :string)
  
  ;; api-method class
  (api-string-or-symbol-list-hash-for-object-key-fn
   (list
    "name"
     "description"
     "uri"
     "params"
     "defaults"
     "type"
     "visibility"
     "http_method")
   #'symbol-munger:underscores->keyword
   :element-type :string)

  ;; standard parameter types
  (api-string-or-symbol-list-hash-for-object-key-fn
   (list 
    "page" 
    "offset"
    "limit")
   #'symbol-munger:underscores->keyword
   :element-type :string)

  ;; AFAIK these don't appear in the car position of a response object but we
  ;; can prob. safely add them to the hash none-the-less
  ;; (api-string-or-symbol-list-hash-for-object-key-fn
  ;;  (list 
  ;;   "public"
  ;;   "private")
  ;; #'symbol-munger:underscores->keyword
  ;; :element-type :string)
         
  ;; (cadadr '(api-class-slot-names-as-underscored-strings 'avatar))

  ;; (api-class-slot-names-as-underscored-strings 'avatar)
  ;; (api-class-slot-names-as-underscored-strings 'api-method)
  ;; (api-class-slot-names-as-underscored-strings 'bill-charge)
  ;; (api-class-slot-names-as-underscored-strings 'billing-overview)
  ;; (api-class-slot-names-as-underscored-strings 'bill-payment)
  ;; (api-class-slot-names-as-underscored-strings 'cart)
  ;; (api-class-slot-names-as-underscored-strings 'cart-listing)
  ;; (api-class-slot-names-as-underscored-strings 'category)
  ;; (api-class-slot-names-as-underscored-strings 'country)
  ;; (api-class-slot-names-as-underscored-strings 'coupon)
  ;; (api-class-slot-names-as-underscored-strings 'favorite-listing)
  ;; (api-class-slot-names-as-underscored-strings 'favorite-user)
  ;; (api-class-slot-names-as-underscored-strings 'featured-treasury)
  ;; (api-class-slot-names-as-underscored-strings 'feedback)
  ;; (api-class-slot-names-as-underscored-strings 'feedback-info)
  ;; (api-class-slot-names-as-underscored-strings 'forum-post)
  ;; (api-class-slot-names-as-underscored-strings 'ledger)
  ;; (api-class-slot-names-as-underscored-strings 'ledger-entry)
  ;; (api-class-slot-names-as-underscored-strings 'listing)
  ;; (substitute "url_570xN" "url_570xn" (api-class-slot-names-as-underscored-strings 'listing-image) :test #'string=)
  ;; (api-class-slot-names-as-underscored-strings 'listing-translation)
  ;; (api-class-slot-names-as-underscored-strings 'order)
  ;; (api-class-slot-names-as-underscored-strings 'param-list)
  ;; (api-class-slot-names-as-underscored-strings 'payment)
  ;; (api-class-slot-names-as-underscored-strings 'payment-template)
  ;; (api-class-slot-names-as-underscored-strings 'receipt)
  ;; (api-class-slot-names-as-underscored-strings 'region)
  ;; (api-class-slot-names-as-underscored-strings 'shipping-info)
  ;; (api-class-slot-names-as-underscored-strings 'shipping-template)
  ;; (api-class-slot-names-as-underscored-strings 'shipping-template-entry)
  ;; (api-class-slot-names-as-underscored-strings 'shop)
  ;; (api-class-slot-names-as-underscored-strings 'shop-section)
  ;; (api-class-slot-names-as-underscored-strings 'shop-section-translation)
  ;; (api-class-slot-names-as-underscored-strings 'shop-translation)
  ;; (api-class-slot-names-as-underscored-strings 'style)
  ;; (api-class-slot-names-as-underscored-strings 'tag)
  ;; (api-class-slot-names-as-underscored-strings 'team)
  ;; (api-class-slot-names-as-underscored-strings 'transaction)
  ;; (api-class-slot-names-as-underscored-strings 'treasury)
  ;; (api-class-slot-names-as-underscored-strings 'treasury-counts)
  ;; (api-class-slot-names-as-underscored-strings 'treasury-listing)
  ;; (api-class-slot-names-as-underscored-strings 'treasury-listing-data)
  ;; (api-class-slot-names-as-underscored-strings 'user)
  ;; (api-class-slot-names-as-underscored-strings 'user-address)
  ;; (api-class-slot-names-as-underscored-strings 'user-profile)
  ;;
  ;; (api-class-slot-names-as-underscored-strings 'data-type)
  ;; :data-type-values "values"
  ;; "values" :data-type-values
  ;;
  ;; No, we should not try to map this string to/from a symbol
  ;; data-type-values "values" 
  ;; "values" 'data-type-values ' 
  )



 
;; :NOTE it looks like some of the return data is not getting html-unescaped we're getting bogus junk
;; appearing in at least the "sale_message" "bio" and "description" fields.
;; (URL `http://www.theukwebdesigncompany.com/articles/entity-escape-characters.php')
(let ((replacements (list (cons  (cl-ppcre:create-scanner "&quot;") "\\\\\"")
                          (cons  (cl-ppcre:create-scanner "&#39;") "'")
                          (cons  (cl-ppcre:create-scanner "&gt;") ">")
                          (cons  (cl-ppcre:create-scanner "&#62;") ">")
                          (cons  (cl-ppcre:create-scanner "&lt;") "<")
                          (cons  (cl-ppcre:create-scanner "&#60;") "<")
                          (cons  (cl-ppcre:create-scanner "\\\\r\\\\n") (princ-to-string #\Newline)))))
  (defun clean-html-escapes (target)
    (dolist (i replacements target)
      (setf target (cl-ppcre:regex-replace-all (car i) target (cdr i))))))

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

(defun api-method-documentation-url (api-method-alist)
  (format nil "http://www.etsy.com/developers/documentation/reference/~A#method_~A"
          (cdr (assoc :type api-method-alist))
          (cdr (assoc :name api-method-alist))))

(defun api-method-description-to-docstring (api-method-alist)
  (format nil "~A~&~%:EXAMPLE~2%:API-METHOD ~S~%:VISIBILITY ~S~%:METHOD-URL (URL `~A')~2%:SEE-ALSO ."
          (or (cdr (assoc :description api-method-alist)) "")
          (or (cdr (assoc :name api-method-alist)) "")
          (or (and (api-method-public-p api-method-alist) :public) :private)
          (api-method-documentation-url api-method-alist)))

;;; ==============================
;;; EOF
