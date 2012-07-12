;;; :FILE-CREATED <Timestamp: #{2012-07-10T17:09:19-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-base-class.lisp
;;; ==============================

(in-package #:cl-etsy)

(defclass base-etsy ()
  ()
  ;; (:default-initargs )
  (:documentation "An abstract class from which Etsy API classes should inherit."))

#|


(defclass resource (base-etsy)
  ()
  (:documentation "An abstract class for for resources exposed by the Etsy v2 API."))


(defclass resource-association (base-etsy)
  (
   (association-name
    :reader association-name
    :documentation "A string identifying the resource-association")
   (association-visibility
    :reader association-visibility
    :documentation "An association's visibility is either public or private.
When an association's visibility is public it's asosociation-permission is null.
Public association's do not require interaction with the Oauth regime of the Etsy v2 API.
When an association's visibility private it's it's asosociation-permission is one of the following:

Public association's require interaction with the Oauth regime of the Etsy v2 API.
")

   (asosociation-permission
    :reader association-permission
    :documentation "")

   (assocation-type
    :reader assocation-type
    :documentation "")

   (assocation-description
    :reader assocation-description
    :documentation "")
   )

  ;; (:default-initargs  )

  (:documentation "An abstract class for the associations of a resource as exposed by the Etsy v2 API.

\" Each resource has one or more associations that can be included using the
 standard includes parameter:

  /v2/listings/active?includes=Images

 Multiple associations can be separated with commas:

  /v2/listings/active?includes=Images,Shop

 In addition, associations can specify limit/offset parameters.
 The following example loads only the first image (limit 1, offset 0:)

  /v2/listings/active?includes=Images:1:0

 You can also specify which fields of an association are returned:

  /v2/listings/active?includes=Images(url_75x75,hex_code)

 Finally, associations can be nested up to three levels deep, using slashes:

  /v2/listings/active?includes=Shop/User
  /v2/shops/etsystore?includes=Listings:1:0/Images\

 The complete association inclusion syntax is as follows 

  ?includes=Association[(fieldname[,fieldname...])][:scope][:limit[:offset]][,Assocation...]
 
 Elements in [square brackets] are optional.\"

 (URL `http://www.etsy.com/developers/documentation/getting_started/resources#section_associations')"))

(defclass resource-method (base-etsy)
  ()
  (:documentation "An abstract class for the api-methods of a resource as exposed by the Etsy v2 API."))


|#

;;; ==============================
;;; EOF

