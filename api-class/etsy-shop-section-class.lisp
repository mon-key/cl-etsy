;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-shop-section-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/shopsection')

----
API-ASSOCIATIONS

:association Shop
:visibility  public
:perm-scope  none
:type        Shop
:description "The shop to which this section belongs."

:association Listings
:visibility  public
:perm-scope  none
:type        array(Listing)
:description "An array of listings in this section."

:association Translations
:visibility  public
:perm-scope  none
:type        array(ShopSectionTranslation)
:description "An array of translations for this ShopSection."

----
API-METHODS

"findAllShopSections"
"createShopSection"
"getShopSection"
"updateShopSection"
"deleteShopSection"

|#

(in-package #:cl-etsy)

;; ShopSection
(defclass shop-section (base-etsy)
  (;; shop_section_id
   (shop-section-id
    :initarg :shop-section-id
    :accessor shop-section-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the shop section.")

   (title
    :initarg :title
    :accessor title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The title of the section.")

   (rank
    :initarg :rank
    :accessor rank
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Display order.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The ID of the user who owns this shop section.")

   ;; active_listing_count
   (active-listing-count
    :initarg :active-listing-count
    :accessor active-listing-count
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of active listings currently in the section."))

  ;; (:default-initargs 
  ;;  :shop-section-id nil :title nil :rank nil :user-id nil :active-listing-count nil)

  (:documentation "A section within a user's shop.
 (URL `http://www.etsy.com/developers/documentation/reference/shopsection')"))


;;; ==============================
;;; EOF
