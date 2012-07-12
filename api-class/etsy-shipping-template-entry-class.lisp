;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-shipping-template-entry-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/shippingtemplateentry')

----
API-ASSOCIATIONS

:association OriginCountry
:visibility  private
:perm-scope  listings_r
:type        Country
:description "The full Country record for the shipping origin."

:association DestinationCountry
:visibility  private
:perm-scope  listings_r
:type        Country
:description "The full Country record for the shipping destination."

:association DestinationRegion
:visibility  private
:perm-scope  listings_r
:type        Region
:description "The full Region record for the shipping destination region."

:association Template
:visibility  private
:perm-scope  listings_r
:type        ShippingTemplate
:description "The template to which this entry belongs."

----
API-METHODS

"createShippingTemplateEntry"
"getShippingTemplateEntry"
"updateShippingTemplateEntry"
"deleteShippingTemplateEntry"

|#

(in-package #:cl-etsy)

;; ShippingTemplateEntry
(defclass shipping-template-entry (base-etsy)
  (;; shipping_template_entry_id
   (shipping-template-entry-id
    :initarg :shipping-template-entry-id
    :accessor shipping-template-entry-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The numeric ID of this shipping template entry.")

   ;; shipping_template_id
   (shipping-template-id
    :initarg :shipping-template-id
    :accessor shipping-template-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The numeric ID of the template this entry belongs to.")

   ;; currency_code
   (currency-code
    :initarg :currency-code
    :accessor currency-code
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The currency code for the prices in this template entry.")

   ;; origin_country_id
   (origin-country-id
    :initarg :origin-country-id
    :accessor origin-country-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The numeric ID of the country from which the listing ships.")

   ;; destination_country_id
   (destination-country-id
    :initarg :destination-country-id
    :accessor destination-country-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The numeric ID of the country to which the listing ships (optional).
If missing, these fees apply to all destinations.")

   ;; destination_region_id
   (destination-region-id
    :initarg :destination-region-id
    :accessor destination-region-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The numeric ID of the region to which the listing ships (optional).
Regions are collections of countries.")

   ;; primary_cost
   (primary-cost
    :initarg :primary-cost
    :accessor primary-cost
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type float
    :documentation "The shipping fee for this item, if shipped alone.")

   ;; secondary_cost
   (secondary-cost
    :initarg :secondary-cost
    :accessor secondary-cost
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type float
    :documentation "The shipping fee for this item, if shipped with another item."))

  ;; (:default-initargs
  ;;  :shipping-template-entry-id nil :shipping-template-id nil :currency-code nil
  ;;  :origin-country-id nil :destination-country-id nil :destination-region-id nil
  ;;  :primary-cost nil :secondary-cost nil)

  (:documentation "Represents one entry in a shipping template.
See documentation of shipping-info for discussion w/r/t the interaction of
shipping-info shipping-template and shipping-template-entry.
 (URL `http://www.etsy.com/developers/documentation/reference/shippingtemplateentry')"))


#|

 ((:NAME        . "findAllShippingTemplateEntries")
  (:DESCRIPTION . "Retrieves a set of ShippingTemplateEntry objects associated to a ShippingTemplate.")
  (:URI         . "/shipping/templates/:shipping_template_id/entries")
  (:PARAMS
   (:SHIPPING-TEMPLATE-ID . "int")
   (:LIMIT                  . "int")
   (:OFFSET                 . "int")
   (:PAGE                   . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "ShippingTemplateEntry")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))
     
  ((:NAME        . "createShippingTemplateEntry")
   (:DESCRIPTION . "Creates a new ShippingTemplateEntry")
   (:URI         . "/shipping/templates/entries")
   (:PARAMS
    (:SHIPPING-TEMPLATE-ID   . "int")
    (:DESTINATION-COUNTRY-ID . "int")
    (:PRIMARY-COST            . "float")
    (:SECONDARY-COST          . "float")
    (:DESTINATION-REGION-ID  . "int"))
   (:DEFAULTS
    (:DESTINATION-COUNTRY-ID)
    (:DESTINATION-REGION-ID))
   (:TYPE         . "ShippingTemplateEntry")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "POST"))
     
  ((:NAME        . "getShippingTemplateEntry")
   (:DESCRIPTION . "Retrieves a ShippingTemplateEntry by id.")
   (:URI         . "/shipping/templates/entries/:shipping_template_entry_id")
   (:PARAMS
    (:SHIPPING-TEMPLATE-ENTRY-ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "ShippingTemplateEntry")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))
     
  ((:NAME        . "updateShippingTemplateEntry")
   (:DESCRIPTION . "Updates a ShippingTemplateEntry")
   (:URI         . "/shipping/templates/entries/:shipping_template_entry_id")
   (:PARAMS
    (:SHIPPING-TEMPLATE-ENTRY-ID . "int")
    (:DESTINATION-COUNTRY-ID      . "int")
    (:PRIMARY-COST                 . "float")
    (:SECONDARY-COST               . "float"))
   (:DEFAULTS
    (:DESTINATION-COUNTRY-ID)
    (:PRIMARY-COST)
    (:SECONDARY-COST))
   (:TYPE         . "ShippingTemplateEntry")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "PUT"))
     
  ((:NAME        . "deleteShippingTemplateEntry")
   (:DESCRIPTION . "Deletes a ShippingTemplateEntry")
   (:URI         . "/shipping/templates/entries/:shipping_template_entry_id")
   (:PARAMS
    (:SHIPPING-TEMPLATE-ENTRY-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ShippingTemplateEntry")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "DELETE"))

|#

;;; ==============================
;;; EOF
