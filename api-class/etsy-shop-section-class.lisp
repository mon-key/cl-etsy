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

----
 (closer-mop:class-finalized-p (find-class 'shop-section))
 (api-class-slot-names-as-underscored-strings 'shop-section)

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


#|
 
 ((:NAME        . "findAllShopSections")
  (:DESCRIPTION . "Retrieves a set of ShopSection objects associated to a Shop.")
  (:URI         . "/shops/:shop_id/sections")
  (:PARAMS
   (:SHOP-ID . "shop_id_or_name"))
  (:DEFAULTS)
  (:TYPE         . "ShopSection")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "createShopSection")
  (:DESCRIPTION . "Creates a new ShopSection.")
  (:URI         . "/shops/:shop_id/sections")
  (:PARAMS
   (:SHOP-ID . "shop_id_or_name")
   (:TITLE    . "text")
   (:USER-ID . "int"))
  (:DEFAULTS
   (:TITLE)
   (:USER-ID))
  (:TYPE         . "ShopSection")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "POST"))

 ((:NAME        . "getShopSection")
  (:DESCRIPTION . "Retrieves a ShopSection by id and shop_id")
  (:URI         . "/shops/:shop_id/sections/:shop_section_id")
  (:PARAMS
   (:SHOP-ID          . "shop_id_or_name")
   (:SHOP-SECTION-ID . "array(int)"))
  (:DEFAULTS)
  (:TYPE         . "ShopSection")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "updateShopSection")
  (:DESCRIPTION . "Updates a ShopSection with the given id.")
  (:URI         . "/shops/:shop_id/sections/:shop_section_id")
  (:PARAMS
   (:SHOP-ID          . "shop_id_or_name")
   (:SHOP-SECTION-ID . "int")
   (:TITLE             . "text")
   (:USER-ID          . "int")
   (:RANK              . "int"))
  (:DEFAULTS
   (:TITLE)
   (:USER-ID)
   (:RANK))
  (:TYPE         . "ShopSection")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "PUT"))

 ((:NAME        . "deleteShopSection")
  (:DESCRIPTION . "Deletes the ShopSection with the given id.")
  (:URI         . "/shops/:shop_id/sections/:shop_section_id")
  (:PARAMS
   (:SHOP-ID          . "shop_id_or_name")
   (:SHOP-SECTION-ID . "int"))
  (:DEFAULTS)
  (:TYPE         . "ShopSection")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "DELETE"))

 ;; :NOTE Shouldn't this be of :type shop-section-translation ???

 ((:NAME        . "getShopSectionTranslationShopSection")
   (:DESCRIPTION . "Retrieves a set of ShopSection objects associated to a ShopSectionTranslation.")
   (:URI         . "/shopsectiontranslations/:shop_section_id/shopsection")
   (:PARAMS
    (:SHOP-SECTION-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ShopSection")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
