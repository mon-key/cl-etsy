;;; :FILE-CREATED <Timestamp: #{2012-07-12T15:17:44-04:00Z}#{12284} - by MON>
;;; :FILE cl-etsy/api-class/etsy-api-method-class.lisp
;;; ==============================


#|

 (URL `http://www.etsy.com/developers/documentation/reference/apimethod')

----
API-METHODS

 "getMethodTable"

|#

(in-package #:cl-etsy)

;; ApiMethod
(defclass api-method (base-etsy)
  (
   ;; (api-symbol
   ;; :initarg :api-symbol
   ;; :accessor api-symbol
   ;; :documentation "")
   
   ;; (api-name
   ;; :initarg :api-name
   ;; :accessor api-name
   ;; :documentation "")

   (name
    :initarg :name
    :accessor name

    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The method's descriptive name.")

   (uri
    :initarg :uri
    :accessor uri
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The method's URI pattern.
Parameters are marked with a leading colon.")

   (params
    :initarg :params
    :accessor params
    ;; :visibility public
    ;; :perm-scope none
    ;; :type ParamList
    :documentation "An array of method parameters and types.")

   (defaults
    :initarg :defaults
    :accessor defaults
    ;; :visibility public
    ;; :perm-scope none
    ;; :type ParamList
    :documentation "An array of default values for parameters.
Parameters that lack a default are required.")

   (type
    :initarg :type
    :accessor type
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The resource type returned by the method.")

   (visibility
    :initarg :visibility
    :accessor visibility
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The method's visibility level. Either public or private.
This is presented as \"Requires Oauth\" in the \"Methods\" section of the web documentation of a resource.
Methods marked \"private\" require Oauth-1 authentication and may be entailed by a permission-scope.")

   ;; http_method
   (http-method
    :initarg :http-method
    :accessor http-method
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The HTTP method used to call the API method.

RESTful APIs use standard HTTP methods to denote actions against a resource:

    GET    - Read a resource. Returns HTTP 200 on success.
    POST   - Create a new resource. Returns HTTP 201 on success.
    PUT    - Update a resource. Returns HTTP 200 on success.
    DELETE - Delete a resource. Returns HTTP 200 on success.

 (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_http_methods')"))
 
  ;; (:default-initargs 
  ;; :name nil :uri nil :params nil :defaults nil :type nil :visibility nil :http-method nil)

  (:documentation "A method call from the Etsy API.
 (URL `http://www.etsy.com/developers/documentation/reference/apimethod')"))


;;; ==============================
;;; EOF
