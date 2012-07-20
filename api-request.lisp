;;; :FILE-CREATED <Timestamp: #{2012-07-12T17:37:24-04:00Z}#{12284} - by MON>
;;; :FILE cl-etsy/api-request.lisp
;;; ==============================

;;; ==============================
;; http-request => body-or-stream, status-code, headers, uri, stream, must-close, reason-phrase
;;
;; http-request (uri &rest args 
;;                   &key (protocol :http/1.1)
;;                        (method :get)
;;                        force-ssl
;;                        certificate
;;                        key
;;                        certificate-password
;;                        verify
;;                        max-depth
;;                        ca-file
;;                        ca-directory
;;                        parameters
;;                        content
;;                        (content-type "application/x-www-form-urlencoded")
;;                        content-length
;;                        form-data
;;                        cookie-jar
;;                        basic-authorization
;;                        (user-agent :drakma)
;;                        (accept "*/*")
;;                        range
;;                        proxy
;;                        proxy-basic-authorization
;;                        additional-headers 
;;                        (redirect 5)
;;                        (redirect-methods '(:get :head))
;;                        auto-referer
;;                        keep-alive
;;                        (close t)
;;                        (external-format-out drakma:*drakma-default-external-format*)
;;                        (external-format-in drakma:*drakma-default-external-format*)
;;                        force-binary
;;                        want-stream
;;                        stream
;;                        preserve-uri
;;                        (connection-timeout 20))
;;
;; (URL `http://weitz.de/drakma/')
;;
;;; ==============================

(in-package #:cl-etsy)

(deftype api-request-offset-range ()
  "The valid integer range for the OFFSET parameter of an Etsy API call.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')"
  '(mod 50001))

(deftype api-request-limit-range ()
"The valid integer range for the LIMIT parameter of an Etsy API call.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')"
  '(integer 1 100))

(deftype api-request-page-range ()
"The valid integer range for the PAGE parameter of an Etsy API call.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')"
  '(integer 1 2001))

(deftype parsed-object-type ()
  "The valid parameter values for yason :object-as keywords 
`yason:*parse-object-as*'"
  '(member :hash-table :plist :alist))

;; :TODO api-call should leverage cl-oauth:access-protected-resource when accessing :private resources
(defun api-call (url &key (parameters nil)
                          (method :get)
                          (content-type "application/json"))
  "Perform an http-request with URL 
PARAMETERS is an alist of key value pairs
When LIMIT is a parameter it's value should be in the range [1,100].
When OFFSET is a parameter it's value should be in the range [0,50000].
When PAGE is a parameter it's value should be in the range [1,2001].
Return as seven cl:values as if by `drakma:http-request'.
:EXAMPLE

 \(api-call *base-url* :parameters '\(\(\"entered_login\"    . \"test\"\)
                                    \(\"entered_password\" . \"test\"\)\)\)

 \(api-call \(concatenate 'string *base-url* \"/\" \"users\" \"/\" \)
           :parameters `\(\(\"api_key\"  . ,cl-etsy::*api-key*\)
                         \(\"keywords\" . \"\"\)
                         \(\"page\" . \"3\"\)\)\)

Following errors successfully:
 \(api-call \(concatenate 'string *base-url* \"/\" \"users\" \"/\" \)
           :parameters `\(\(\"api_key\"  . ,cl-etsy::*api-key*\)
                         \(\"keywords\" . \"\"\)
                         \(\"page\" . \"0\"\)\)\)
"
  (multiple-value-bind (response-body response-code response-headers resonse-uri response-stream response-stream-closed response-reason)
      ;; (declare (ignore response-headers resonse-uri response-stream response-stream-closed response-reason))
      ;; (with-interval-timer (*etsy-api-request-timer*)
      ;;   (drakma:http-request url :parameters parameters))
      (drakma:http-request url 
                           :parameters (acons "api_key" *api-key* parameters)
                           :method method
                           :content-type content-type
                           :force-binary t
                           ;; :accept "*/*")
                           ;; :accept "application/json")
                           )
    (process-response response-body
                      response-code response-headers 
                      resonse-uri
                      response-stream
                      response-stream-closed
                      response-reason)))

;; :TODO We need better error handling for the vavious standard response codes:
;; (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_standard_response_codes')
(defun process-response (response-body response-code response-headers 
                         resonse-uri response-stream response-stream-closed
                         response-reason) ; &key (method :get))
  (if (or (eql response-code 200) ; GET PUT DELETE
          (eql response-code 201)) ; POST only
      (values
       ;; (sb-ext:octets-to-string response-body :external-format external-format)
       (flexi-streams:octets-to-string response-body) ;:external-format external-format
       response-code
       response-headers
       resonse-uri
       response-stream
       response-stream-closed
       response-reason)
      ;; :NOTE (assoc :X-ERROR-DETAIL response-headers) should be similar or
      ;; identitical to RESPONSE-BODY when we've errored.
      (error "Failed etsy API call~% :reason  ~D - ~A~% :message ~S~%"
             response-code
             response-reason
             (clean-html-escapes
              (or (and (stringp response-body)
                       response-body)
                  (flexi-streams:octets-to-string response-body))))))

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


#|


 (etsy-environment)

 (set-etsy-environment :endpoint-type :sandbox)

 (set-etsy-environment :endpoint-type :production)


 ---

 (defmacro with-api-call ((&rest url-bits) &rest optional-parameters)
   `(let ((cgi-args (list (cons "api_key" cl-etsy:*api-key*))))
      ,@(loop
          for (name type) in optional-parameters
          collect `(when ,name
                     (parameter-type-check ,type ,name)
                     (push (cons ,(lisp-to-cgi name) (marshall-type ,type ,name))
                           cgi-args)))
      (api-call (concatenate 'string *base-url* ,@url-bits) cgi-args)))



 (defun parsed-api-call (url &key (parameters nil) 
                                  (method :get)
                                  (content-type "application/json")
                                  (object-key-fn yason:*parse-object-key-fn*)
                                  (object-as yason:*parse-object-as*)
                                  (json-arrays-as-vectors yason:*parse-json-arrays-as-vectors*)
                                  (json-booleans-as-symbols yason:*parse-json-booleans-as-symbols*))
   "keyword OBJECT-AS is one of :hash-table :plist :alist. Default is dynamic value of `yason:*parse-object-as*'.
 getUser
 \(parsed-api-call \(concatenate 'string *base-url* \"/\" \"users\" \"/\" \"12981664\"\)
                  :object-as :alist\)

 \(parsed-api-call \(concatenate 'string *base-url* \"/\" \"users\" \"/\" \"12981664\"\)
                  :parameters '\(\(\"includes\" . \"Profile\"\)\)
                  :object-as :plist\)

 \(parsed-api-call \(concatenate 'string *base-url* \"/\" \"users\" \"/\" \"12981664\"\)
                  :parameters '\(\(\"includes\" . \"Profile\"\)\)
                  :object-as :alist\)

 \(parsed-api-call \(concatenate 'string *base-url* \"/\" \"users\" \"/\" \"12981664\"\)
                  :parameters '\(\(\"includes\" . \"Shops\"\)\)
                  :object-as :alist\)

 \(parsed-api-call \(concatenate 'string *base-url* \"/\" \"users\" \"/\" \"12981664\"\)
                  :parameters '\(\(\"includes\" . \"Profile\(bio\),Shops\(shop_id\)\"\)\)
                  :object-as :alist :json-booleans-as-symbols t\)

 \(parsed-api-call \(concatenate 'string *base-url* \"/\" \"shops\" \"/\" \"6402246\"\)
                 :parameters '\(\(\"includes\" . \"Listings:1:0/Images\"\)\)
                 :object-as :alist\)

"
   (declare (parsed-object-type object-as)
            (boolean json-arrays-as-vectors json-booleans-as-symbols))
   (yason::parse
    (api-call url
              :parameters parameters 
              :method  method 
              :content-type content-type)
    :object-key-fn object-key-fn
    :object-as object-as
    :json-arrays-as-vectors json-arrays-as-vectors
    :json-booleans-as-symbols json-booleans-as-symbols) )

|#

;;; ==============================
;;; EOF
