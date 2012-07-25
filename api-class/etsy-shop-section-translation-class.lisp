;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-shop-section-translation-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/shopsectiontranslation')

----
API-ASSOCIATIONS

:association ShopSection
:visibility  public
:perm-scope  none
:type        ShopSection
:description "The ShopSection this translation belongs to."

----
API-METHODS

 "getShopSectionTranslation"

----
 (closer-mop:class-finalized-p (find-class 'shop-section-translation))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'shop-section-translation)

|#

(in-package #:cl-etsy)

;; ShopSectionTranslation
(defclass shop-section-translation (base-etsy)
  (;; shop_section_id
   (shop-section-id
    :initarg :shop-section-id
    :accessor shop-section-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID for the ShopSection.")

   (language
    :initarg :language
    :accessor language
    ;; :visibility public
    ;; :perm-scope none
    ;; :type language
    :documentation "The IETF language tag (e.g. 'fr') for the language of this translation.")

   (title
    :initarg :title
    :accessor title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of title of ShopSection."))

  ;; (:default-initargs 
  ;;  :shop-section-id nil :language nil :title nil)

  (:documentation "Represents the translation data for a shop-section.
 (URL `http://www.etsy.com/developers/documentation/reference/shopsectiontranslation')"))


#|

 ;; :NOTE There is a duplicate/similiar method for shop-translation  
 ((:NAME        . "getShopTranslation")
  (:DESCRIPTION . "Retrieves a ShopSectionTranslation by shop_id and language")
  (:URI         . "/shops/:shop_id/sections/:shop_section_id/translations/:language")
  (:PARAMS
   (:SHOP-ID          . "shop_id_or_name")
   (:SHOP-SECTION-ID . "int")
   (:LANGUAGE          . "language"))
  (:DEFAULTS)
  (:TYPE         . "ShopSectionTranslation")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
