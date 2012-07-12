;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-shipping-template-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/shippingtemplate')

----
API-ASSOCIATIONS

:association Entries
:visibility  private
:perm-scope  listings_r
:type        array(ShippingTemplateEntry)
:description "An array of shipping info entries that belong to this template."

----
API-METHODS

"createShippingTemplate"
"getShippingTemplate"
"updateShippingTemplate"
"deleteShippingTemplate"
"findAllUserShippingTemplates"

|#

(in-package #:cl-etsy)

;; ShippingTemplate
(defclass shipping-template (base-etsy)
  (;; shipping_template_id
   (shipping-template-id
    :initarg :shipping-template-id
    :accessor shipping-template-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The numeric ID of this shipping template.")

   (title
    :initarg :title
    :accessor title
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The name of this shipping template.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The numeric ID of the user who owns this shipping template."))
 
  ;; (:default-initargs 
  ;;  :shipping-template-id nil :title nil :user-id nil)

  (:documentation "Represents a template used to set a listing's shipping information.
See documentation of shipping-info for discussion w/r/t the interaction of
shipping-info shipping-template and shipping-template-entry.

 (URL `http://www.etsy.com/developers/documentation/reference/shippingtemplate')"))


#|

 ((:NAME        . "createShippingTemplate")
  (:DESCRIPTION . "Creates a new ShippingTemplate")
  (:URI         . "/shipping/templates")
  (:PARAMS
   (:TITLE                    . "string")
   (:ORIGIN-COUNTRY-ID      . "int")
   (:DESTINATION-COUNTRY-ID . "int")
   (:PRIMARY-COST            . "float")
   (:SECONDARY-COST          . "float")
   (:DESTINATION-REGION-ID  . "int"))
  (:DEFAULTS
   (:DESTINATION-COUNTRY-ID)
   (:DESTINATION-REGION-ID))
  (:TYPE         . "ShippingTemplate")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "POST"))
     
  ((:NAME        . "getShippingTemplate")
   (:DESCRIPTION . "Retrieves a ShippingTemplate by id.")
   (:URI         . "/shipping/templates/:shipping_template_id")
   (:PARAMS
    (:SHIPPING-TEMPLATE-ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "ShippingTemplate")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))
     
  ((:NAME        . "updateShippingTemplate")
   (:DESCRIPTION . "Updates a ShippingTemplate")
   (:URI         . "/shipping/templates/:shipping_template_id")
   (:PARAMS
    (:SHIPPING-TEMPLATE-ID . "int")
    (:TITLE                  . "string")
    (:ORIGIN-COUNTRY-ID    . "int"))
   (:DEFAULTS
    (:TITLE)
    (:ORIGIN-COUNTRY-ID))
   (:TYPE         . "ShippingTemplate")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "PUT"))
     
  ((:NAME        . "deleteShippingTemplate")
   (:DESCRIPTION . "Deletes the ShippingTemplate with the given id.")
   (:URI         . "/shipping/templates/:shipping_template_id")
   (:PARAMS
    (:SHIPPING-TEMPLATE-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ShippingTemplate")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "DELETE"))

 ((:NAME        . "findAllUserShippingTemplates")
  (:DESCRIPTION . "Retrieves a set of ShippingTemplate objects associated to a User.")
  (:URI         . "/users/:user_id/shipping/templates")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "ShippingTemplate")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
