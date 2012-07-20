;;; :FILE-CREATED <Timestamp: #{2012-07-19T21:25:25-04:00Z}#{12294} - by MON>
;;; :FILE cl-etsy/authorize.lisp
;;; ==============================

#|

 Following gets us a token but doesn't work on the sandbox API which AFAICT is
 broken w/r/t return value of (url-decode-login-url). I have the impression that
 this is a problem on the Etsy end... Someone with Etsy should verify the flow
 for obtaining (and USING) an auth token with the sandbox endpoint. The forums
 are full of devs reporting hassles when attempting to access privately scoped
 fields on the sandbox.

 - Set the endpoint-type to :production.
   (when (eql (nth-value 1 (etsy-environment)) :sandbox)
     (set-etsy-environment :endpoint-type :production))

 - generate a new request-token
   (set-api-request-token)

 - obtain a verification code by accessing the URL returned from:
   (url-decode-login-url)

 - set the *api-request-token* verification-code slot to the code we recieved.
   doing so has the effect that when we go to obtain the access code the
   authorization headers will contain the following key/value pair:
   oauth_verifier="<VERIFICATION-CODE>"
   (setf (cl-oauth:request-token-verification-code *api-request-token*) "<VERIFICATION-CODE>")

 - set the authorized-p slot to T
   (cl-oauth:authorize-request-token *api-request-token*)

 - obtain an access-token
 (let ((drakma:*header-stream* *standard-output*))
   (setf *api-access-token* (cl-oauth:obtain-access-token (get-access-token-endpoint) *api-request-token*)))

 Holding onto our existing tokens:
  (defparameter *api-production-access-token* *api-access-token*)
  (defparameter *api-production-request-token* *api-request-token*)

---
 What the user sees when asked to grant an app permission to the user account:

 | An application would like to connect to your account.
 | You are signed in as <USER-NAME>
 | 
 | Not you? Sign in as someone else.
 | 
 | The application <APP-NAME> is trying to connect to your account.
 | 
 | You should be seeing this message because you're using an Etsy App. If you
 | didn't come to this page through an Etsy App, or if you followed a link in an
 | email or chat, close this window now.
 | 
 | If you proceed, <APP-NAME> will have permission to do the following on
 | your behalf:
 | 
 |     Connect to your account and know your member name
 |     Know your email address
 |     See your inactive and expired listings
 |     Create and edit listings in your shop
 |     Delete listings in your shop
 |     See your sales and purchases
 |     Update your sales and purchase info
 |     See your Etsy bill charges and payments
 |     See your Etsy profile data
 |     Edit your Etsy profile data, including avatar
 |     See your shipping addresses
 |     Update your shipping addresses
 |     See, add to and remove from your favorite listings and shops
 |     See your private shop data and Edit your shop, including description, policies, sections and banner
 |     See, add to and remove from the listings in your cart
 |     See your recommended listings
 |     See your feedback
 |     Create and update your Treasuries, and post Treasury comments
 | 
 | You can revoke this access at any time by visiting Your Account. 
 | Note: when using Etsy Apps, all the normal fees for creating and changing
 | listings on Etsy apply.
 | 
 | If you close this browser window, no access will be granted.

---
 What the user sees after granting an app permission to the user account:

 | Success!
 | 
 | You've granted <APP-NAME> permission to connect to your account.
 | 
 | Please return to the application and enter the following verification code:
 | <VERIFICATION-CODE>
 | 
 | You can revoke this access at any time by visiting Your Account.

|#

(in-package #:cl-etsy)

(defvar *api-random-state* (make-random-state))

(defun get-access-token-endpoint ()
  (concatenate 'string *base-url* "/oauth/access_token"))

;; A request token is the "temporary token"
(defun get-request-token-endpoint ()
  (concatenate 'string *base-url* "/oauth/request_token"))

;; (make-api-request-token)
(defun make-api-request-token (&key (permission-parameters *api-default-permission-scope*))
  (when (null *api-consumer-token*)
    (error ":FUNCTION `make-api-request-token' -- value of *api-consumer-token* must not be null"))
  (assert (typep *api-consumer-token* 'cl-oauth:consumer-token))
  (cl-oauth:obtain-request-token 
   (get-request-token-endpoint) ;URI
   *api-consumer-token* ; CONSUMER-TOKEN
   :user-parameters (list (get-default-permission-scope-parameter :permission-parameters permission-parameters))))

;; (set-api-request-token)
(defun set-api-request-token (&key (permission-parameters *api-default-permission-scope*))
  (setf *api-request-token*  (make-api-request-token :permission-parameters permission-parameters)))

;; (make-api-access-token :consumer *api-consumer-token* :key "<KEY>" :secret "<SECRET>")
(defun make-api-access-token (&key consumer key secret)
  (declare (cl:type cl-oauth:consumer-token consumer) ; cl:type is shadowed.
           (string key secret))
  (cl-oauth:make-access-token
   :consumer consumer
   :key key
   :secret secret
   ;; As of 2012-07-20 we can't get the sandbox to return a valid access token.
   ;; Until we can assume the token orignated from production URI.
   :origin-uri "http://openapi.etsy.com/v2/oauth/access_token"))

(defun get-default-permission-scope-parameter (&key (permission-parameters *api-default-permission-scope*))
  "Return a permission-scope parameters as a consed pair.
The car is \"scope\".
The cdr is a a whitespace separated string of permission-scope parmeters.
PERMISSION-PARAMETERS is a list of permission-scope parameters. Default is value of
`*api-default-permission-scope*'.
An error is signalled if PARAMETERS is null.
:EXAMPLE
 (get-default-permission-scope-parameter)
 (get-default-permission-scope-parameter :parameters '\(\"profile_w\" \"listings_d\"\)\)
 Following errors succesfully:
 (get-default-permission-scope-parameter :parameters nil)"
  (if (null permission-parameters)
      (error ":FUNCTION `get-default-permission-scope-parameter' -- value of PERMISSION-PARAMETERS should not be null")
      (cons "scope"
            (format nil "~{~A~^ ~}" permission-parameters))))

;; (extract-oauth-token-from-login-url)
(defun extract-oauth-token-from-login-url ()
  "Extract the \"oauth_token\" parameter from the \"login_url\" component of the
  user-data slot of `*api-request-token*'.
Signal an error if `*api-request-token*' is not an instance of class `cl-oauth:request-token'.
When retrun value is true it is a cons of the form:
 \(\"oauth_token\" . \"<OAUTH-TOKEN-VALUE>\"\)
such that its cdr should be cl:equal the `cl-oauth::key' slot-value of `*api-request-token*'.
:EXAMPLE
 (extract-oauth-token-from-login-url)
 (and (equal (cdr (extract-oauth-token-from-login-url))
             (cl-oauth:token-key *api-request-token*))
      (cl-oauth:token-key *api-request-token*))"
  (assert (typep *api-request-token* 'cl-oauth:request-token))
  (let ((maybe-oauth-token 
          (assoc "oauth_token" 
                 (map 'list #'(lambda (seq) (split-sequence:split-sequence #\= seq))
                      (cl-ppcre:split "&\|\\?"
                                      (cl-oauth::url-decode (cdr (assoc "login_url" (cl-oauth:token-user-data *api-request-token*) :test #'equal)))))
                 :test #'equal)))
    (and maybe-oauth-token
         (cons (car maybe-oauth-token) (cadr maybe-oauth-token)))))

(defun url-decode-login-url ()
  (assert (typep *api-request-token* 'cl-oauth:request-token))
  (let ((maybe-login-url
          (cdr (assoc "login_url" (cl-oauth:token-user-data *api-request-token*) :test #'equal))))
    (when maybe-login-url
      (cl-oauth::url-decode maybe-login-url))))

;;; ==============================
;;; EOF
