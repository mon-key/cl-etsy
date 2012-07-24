;;; :FILE-CREATED <Timestamp: #{2012-07-21T16:37:24-04:00Z}#{12296} - by MON>
;;; :FILE #P"cl-etsy/api-response.lisp"
;;; ==============================

#|

|#

(in-package #:cl-etsy)

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
