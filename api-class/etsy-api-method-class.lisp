;;; :FILE-CREATED <Timestamp: #{2012-07-12T15:17:44-04:00Z}#{12284} - by MON>
;;; :FILE cl-etsy/api-class/etsy-api-method-class.lisp
;;; ==============================


#|

 (URL `http://www.etsy.com/developers/documentation/reference/apimethod')

:NOTE Each successfully parsed Etsy API method call returns the following keys:
 :results, :count, :type, :params, :pagination

----
API-METHODS

 "getMethodTable"

----
 (closer-mop:class-finalized-p (find-class 'api-method))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'api-method)

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
    :documentation "The Etsy API method's descriptive name.")

   (uri
    :initarg :uri
    :accessor uri
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The Etsy API method's URI pattern.
Embedded parameters are marked with a leading colon.")

   (params
    :initarg :params
    :accessor params
    ;; :visibility public
    ;; :perm-scope none
    ;; :type ParamList
    :documentation "An associative array of Etsy API method parameters and their types.")

   (defaults
    :initarg :defaults
    :accessor defaults
    ;; :visibility public
    ;; :perm-scope none
    ;; :type ParamList
    :documentation "An associative array of defaulting values (if any) for the parameters of an Etsy API method.
Parameters that lack a default are required.
:NOTE Although, the docs claim non-defaulted parameters are required this does
not appear to hold for the \"standard parameters\" ``limit'', ``offset'', and ``page''.
 (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_standard_parameters')
 (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')")


   (type
    :initarg :type
    :accessor type
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The resource type returned by the Etsy API method call.")

   (visibility
    :initarg :visibility
    :accessor visibility
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The Etsy API method's visibility level. Either public or private.
This is presented as \"Requires Oauth\" in the \"Methods\" section of the web documentation of a resource.
Methods marked \"private\" may be entailed by a permission-scope and require Oauth-1 authentication.")

   ;; http_method
   (http-method
    :initarg :http-method
    :accessor http-method
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The HTTP method used when making an Etsy API method call.

RESTful APIs use standard HTTP methods to denote actions against a resource:

    GET    - Read a resource. Returns HTTP 200 on success.
    POST   - Create a new resource. Returns HTTP 201 on success.
    PUT    - Update a resource. Returns HTTP 200 on success.
    DELETE - Delete a resource. Returns HTTP 200 on success.

Of these four standard HTTP methods, the Etsy API only exposes GET API methods with public visibility.
As of 2012-07-21 following are counts of public and private Etsy API methods:
 public    private    
 -------   -------    
 GET 72    GET    37  
           POST   17  
           PUT    11  
           DELETE 15  

 (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_http_methods')"))
 
  ;; (:default-initargs 
  ;; :name nil :uri nil :params nil :defaults nil :type nil :visibility nil :http-method nil)

  (:documentation "A method call from the Etsy API.
 (URL `http://www.etsy.com/developers/documentation/reference/apimethod')"))

;; 
(defun get-method-table (&key
                         (return-values t)
                         (object-as :alist)
                         (object-key-fn #'api-response-string-to-symbol-lookup)
                         (json-arrays-as-vectors   yason:*parse-json-arrays-as-vectors*)
                         (json-booleans-as-symbols yason:*parse-json-booleans-as-symbols*)
                         )
  "Return a yason:parsed object representing all Etsy API methods currently exposed.
:API-METHOD \"getMethodTable\""
  (declare (api-request-parse-object-as object-as)
           (boolean return-values))
  ;; (yason:parse 
  ;;  (api-call (concatenate 'string *base-url* "/"))
  ;;  :object-as object-as
  ;;  :object-key-fn object-key-fn)
  (parsed-api-call (concatenate 'string *base-url* "/")
                   :return-values return-values
                   :object-as object-as
                   :object-key-fn object-key-fn
                   :json-arrays-as-vectors json-arrays-as-vectors
                   :json-booleans-as-symbols json-booleans-as-symbols
                   ))

#|

 ((:NAME        . "getMethodTable")
  (:DESCRIPTION . "Get a list of all methods available.")
  (:URI         . "/")
  (:PARAMS)
  (:DEFAULTS)
  (:TYPE         . "ApiMethod")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD  . "GET"))

|#

;;; ==============================
;;; EOF
