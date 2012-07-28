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

;; :TODO api-call should leverage cl-oauth:access-protected-resource when accessing :private resources
;; :NOTE When making authenticated reqeuest we may substitute "__SELF__" for any embedded parameter
;; referencing the authenticated account e.g. ":user_id"
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
                           ;; :force-binary t
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

;; :NOTE potentially we might use this for returning nested response objects. 
;; But as it is right now we're prob. fine with just `%parsed-api-call-values'
;; Also, it isn't clear how/whether to accomodate situations where
;; :json-arrays-as-vectors is T
;;
;; (defun parsed-api-get-keyed-value-for-object-as (key keyed-value-object object-as &key (test #'eql))
;;   ;; KEY is a key 
;;   ;; TEST only relevant if OBJECT-AS is :alist
;;   ;; :NOTE Yason's hash-table objects have `cl:hash-table-test' cl:equal see `yason::create-container'.
;;   (declare 
;;    ;; (api-request-parsed-object-type keyed-value-object)
;;    ((or list hash-table) keyed-value-object)
;;    (api-request-parse-object-as object-as))
;;   (ecase object-as
;;     (:alist
;;      (cdr (assoc key keyed-value-object :test test)))
;;     (:plist 
;;      (getf keyed-value-object key))
;;     (:hash-table
;;      (and (hash-table-p keyed-value-object)
;;           (gethash key keyed-value-object)))))

(defun %parsed-api-call-values (parsed-response object-as)
"Return the keys of a succesfully parsed Etsy API method call as as cl:values.
Values are returned in the following order for these keys:
 :results :count :type :params :pagination"
  (declare (api-request-parse-object-as object-as))
  (ecase object-as
    (:alist 
     (values
      (cdr (assoc :results    parsed-response))
      (cdr (assoc :count      parsed-response))
      (cdr (assoc :type       parsed-response))
      (cdr (assoc :params     parsed-response))
      (cdr (assoc :pagination parsed-response))))
    (:plist
     (values
      (getf parsed-response :results)   
      (getf parsed-response :count)
      (getf parsed-response :type)   
      (getf parsed-response :params)  
      (getf parsed-response :pagination)))
    (:hash-table
     (values
      (gethash :results    parsed-response)
      (gethash :count      parsed-response)
      (gethash :type       parsed-response)
      (gethash :params     parsed-response)
      (gethash :pagination parsed-response)))))

;; :NOTE when yason:*parse-json-arrays-as-vectors* is T the vectors returned may
;; have values of cl:array-total-size larger than their length. 
;; :SEE `yason::+initial-array-size+' in `yason::parse-array' for details.
;; Also, note that changing value of +initial-array-size+ to 0 results in a
;; larger cl:array-total-size for the returned vector.
(defun parsed-api-call (url &key (parameters nil) 
                                 (method :get)
                                 (content-type "application/json")
                                 (return-values t)
                                 (object-as                yason:*parse-object-as*)
                                 (object-key-fn            'api-string/symbol-lookup) ;yason:*parse-object-key-fn*
                                 (json-arrays-as-vectors   yason:*parse-json-arrays-as-vectors*)
                                 (json-booleans-as-symbols yason:*parse-json-booleans-as-symbols*))
  "Request JSON data from resource at URL returning results as if by `yason:parse'.
URL is a URL to request a resource from. 
Keyword PARAMETERS is a list conses for `api-call'.
Keyword METHOD is a REST method one of: :get :put :post :delete
Keyword OBJECT-AS is one of :hash-table :plist :alist. Default is dynamic value of `yason:*parse-object-as*'.
Keyword RETURN-VALUES is a boolean indicating whether to return the parsed response object as cl:values. 
When T (the default) return 5 values forms as follows:
 nth-value 0 is :results portion of response
 nth-value 1 is :count portion of response
 nth-value 2 is :type portion of response
 nth-value 3 is :params portion of response
 nth-value 4 is :pagination portion of response
When null return a single value as a list.
keyword object-key-fn is a function is as per `yason:parse'. Default is dynamic value of `yason:*parse-object-key-fn*'.

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
  (declare (api-request-parse-object-as object-as)
           (cl:boolean return-values json-arrays-as-vectors json-booleans-as-symbols))
  (let ((parsed-response
          (yason::parse
           (api-call url
                     :parameters parameters
                     :method  method
                     :content-type content-type)
           :object-key-fn object-key-fn
           :object-as object-as
           :json-arrays-as-vectors json-arrays-as-vectors
           :json-booleans-as-symbols json-booleans-as-symbols)))
    (if (null return-values)
        parsed-response
        (%parsed-api-call-values parsed-response object-as))))

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



 

|#

;;; ==============================
;;; EOF
