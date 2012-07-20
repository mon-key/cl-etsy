;;; :FILE-CREATED <Timestamp: #{2012-06-28T13:10:53-04:00Z}#{12264} - by MON>
;;; :FILE cl-etsy/specials.lisp
;;; ==============================

(in-package #:cl-etsy)

;; v1 "http://beta-api.etsy.com/v1"
(defvar *base-url* "http://openapi.etsy.com/v2" ; "http://sandbox.openapi.etsy.com/v2"
  
"Value should be a string referencing a URL for an Etsy API endpoint.
Valid settings are either:

 \"http://openapi.etsy.com/v2\"         - production endpoint
 \"http://sandbox.openapi.etsy.com/v2\" - sandbox endpoint

 \"The production entry point provides general access to public data using the
  standard parameter api_key for authentication, or protected access to private
  member data using OAuth for authentication. All fields and associations listed
  below as \"private\" will be unavailable without OAuth authentication.

  The sandbox entry point works similarly to the production entry point, but uses
  an isolated database with no real Etsy data. The sandbox provides developers
  with a way to test API methods that write data to Etsy, without disturbing real
  Etsy data or incurring fees for listing on Etsy.

  Developers will need to authenticate their OAuth-based apps separately against the sandbox API.
  OAuth tokens obtained from the sandbox API will not work with the production API.\"
:SEE-ALSO `set-etsy-environment', `etsy-environment'.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_entry_points')")

(defvar *api-key* "You need to set your *API-KEY*"
"This can be found at: (URL `https://www.etsy.com/developers/your-apps')
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*', `make-api-consumer-token', `set-api-consumer-token'.")

(defvar *api-shared-secret* "You need to set your *api-shared-secret*"
"This can be found at: (URL `https://www.etsy.com/developers/your-apps')
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*', `make-api-consumer-token', `set-api-consumer-token'.")


(defvar *api-consumer-token* nil
  "A `cl-auth:consumer-token' object generated with `make-api-consumer-token'.
Value should be set at runtime with `set-api-consumer-token'.
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*', `make-api-consumer-token', `set-api-consumer-token'.")

(defun make-api-consumer-token ()
  "Generate a consumer token as if by `cl-oauth:make-consumer-token'
When non-nil `*api-key*' and `*api-shared-secret*' are used as arguments for
KEY and SECRET keyword arguments of `cl-oauth:make-consumer-token'.
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`make-api-consumer-token', `set-api-consumer-token'."
  (if (or (null *api-shared-secret*)
          (equal *api-shared-secret* "You need to set your *api-shared-secret*"))
      (values nil *api-shared-secret*)
      (if (or (null *api-key*)
              (equal *api-key* "You need to set your *API-KEY*"))
          (values nil *api-key*)
          (cl-oauth:make-consumer-token :key *api-key* :secret *api-shared-secret*))))

(defun set-api-consumer-token ()
  "Set value of `*api-consumer-token*' to return value of `make-api-consumer-token'.
:EXAMPLE
 (and (set-api-consumer-token)
      (equal (slot-value  *api-consumer-token* 'cl-oauth::key) *api-key*)
      (equal (slot-value  *api-consumer-token* 'cl-oauth::secret) *api-shared-secret*))
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`make-api-consumer-token', `set-api-consumer-token'."
  (setf *api-consumer-token* (make-api-consumer-token)))
    

;;; ==============================
;;; EOF
