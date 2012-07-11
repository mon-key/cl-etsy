;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-shipping-info-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/shippinginfo')

----
API-ASSOCIATIONS

:association DestinationCountry
:visibility  public
:perm-scope  none
:type        Country
:description "The full Country record for the shipping destination."

:association OriginCountry
:visibility  public
:perm-scope  none
:type        Country
:description "The full Country record for the shipping origin."

:association Region
:visibility  public
:perm-scope  none
:type        Region
:description "The full Region record for the shipping destination region."

----
API-METHODS

"findAllListingShippingInfo"
"createShippingInfo"
"getShippingInfo"
"updateShippingInfo"
"deleteShippingInfo"

|#

(in-package #:cl-etsy)

;; ShippingInfo
(defclass shipping-info (base-etsy)
  (;; shipping_info_id
    (shipping-info-id
     :initarg :shipping-info-id
     :accessor shipping-info-id
     ;; :visibility public
     ;; :perm-scope none
     ;; :type int
     :documentation "The numeric ID of this shipping info record.")

    ;; origin_country_id
    (origin-country-id
     :initarg :origin-country-id
     :accessor origin-country-id
     ;; :visibility public
     ;; :perm-scope none
     ;; :type int
     :documentation "The numeric ID of the country from which the listing ships.")

    ;; destination_country_id
    (destination-country-id
     :initarg :destination-country-id
     :accessor destination-country-id
     ;; :visibility public
     ;; :perm-scope none
     ;; :type int
     :documentation "The numeric ID of the country to which the listing ships (optional).
If missing, these fees apply to all destinations.")

    ;; currency_code
    (currency-code
     :initarg :currency-code
     :accessor currency-code
     ;; :visibility public
     ;; :perm-scope none
     ;; :type string
     :documentation "Identifies the currency unit for shipping fees (currently always USD).")

    ;; primary_cost
    (primary-cost
     :initarg :primary-cost
     :accessor primary-cost
     ;; :visibility public
     ;; :perm-scope none
     ;; :type float
     :documentation "The shipping fee for this item, if shipped alone.")

    ;; secondary_cost
    (secondary-cost
     :initarg :secondary-cost
     :accessor secondary-cost
     ;; :visibility public
     ;; :perm-scope none
     ;; :type float
     :documentation "The shipping fee for this item, if shipped with another item.")

    ;; listing_id
    (listing-id
     :initarg :listing-id
     :accessor listing-id
     ;; :visibility public
     ;; :perm-scope none
     ;; :type int
     :documentation "The numeric ID of the listing to which this shipping info applies.")

    ;; region_id
    (region-id
     :initarg :region-id
     :accessor region-id
     ;; :visibility public
     ;; :perm-scope none
     ;; :type int
     :documentation "The numeric ID of the region to which this shipping info applies (optional).
If missing, no region is selected. Regions are shorthand for lists of individual countries.")

    ;; origin_country_name
    (origin-country-name
     :initarg :origin-country-name
     :accessor origin-country-name
     ;; :visibility public
     ;; :perm-scope none
     ;; :type string
     :documentation "The name of the country from which this item ships.")

    ;; destination_country_name
    (destination-country-name
     :initarg :destination-country-name
     :accessor destination-country-name
     ;; :visibility public
     ;; :perm-scope none
     ;; :type string
     :documentation "The name of the country to which this item ships."))

   ;; (:default-initargs 
   ;;  :shipping-info-id nil :origin-country-id nil :destination-country-id nil
   ;;  :currency-code nil :primary-cost nil :secondary-cost nil :listing-id nil
   ;;  :region-id nil :origin-country-name nil :destination-country-name nil)

  (:documentation "Shipping fees for a listing and a specific destination.

\"Each listing has a user, and each user can have 0 or more shipping-template(s).
Etsy enforces that a user create at least one shipping-template before creating a
listing.  When that listing is created the shipping-template gets copied into the
ShippingInfo table and is associated to that listing.  You can then edit the
shipping-info directly for a listing, or update your shipping-template and update
the listing with it.

 - A shipping-template has a title and is owned by a user.

 - A shipping-info instance is a set of records that define shipping information
   for a specific listing. It is created from a shipping-template.

 - A shipping-template-entry are a set of rows that correspond to this template.

   -- They hold an origin country, and a destination, as well as the primary and
      secondary cost.

   -- There is only one origin per template, so this is changed on the
      shipping-template resource instead of the shipping-template-entry.

  - You can pass a destination id or a region id when creating a
    ShippingTemplateEntry, but not both - If you leave them both blank then the
    destination is assumed to be \"everywhere\".

 - If you create a shipping-template-entry with a region, this implies several
   destinations and will insert a row for each destination within that region.

 - If you delete a shipping-template-entry that is a region, it will delete all
   corresponding destinations for that region.

 - You can update a shipping-template-entry, but because a region defines many
   rows, and different regions may have a different number of rows, you cannot
   update the region.  You must first delete an entry corresponding to that
   region, and then add an entry with the new region.\"

 (URL `http://www.etsy.com/developers/documentation/reference/shippinginfo')"))


;;; ==============================
;;; EOF
