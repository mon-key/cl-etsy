;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-shop-translation-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/shoptranslation')

----
API-METHODS

"getShopTranslation"

----
 (closer-mop:class-finalized-p (find-class 'shop-translation))
 (api-class-slot-names-as-underscored-strings 'shop-translation)

|#

(in-package #:cl-etsy)

;; ShopTranslation
(defclass shop-translation (base-etsy)
  (;; shop_id
   (shop-id
    :initarg :shop-id
    :accessor shop-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID for the Shop.")

   (language
    :initarg :language
    :accessor language
    ;; :visibility public
    ;; :perm-scope none
    ;; :type language
    :documentation "The IETF language tag (e.g. 'fr') for the language of this translation.")

   (announcement
    :initarg :announcement
    :accessor announcement
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of an announcement to buyers that displays on the shop's homepage.")

   ;; policy_welcome
   (policy-welcome
    :initarg :policy-welcome
    :accessor policy-welcome
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of the introductory text from the top of the seller's policies page (may be blank).")

   ;; policy_payment
   (policy-payment
    :initarg :policy-payment
    :accessor policy-payment
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of the seller's policy on payment (may be blank).")

   ;; policy_shipping
   (policy-shipping
    :initarg :policy-shipping
    :accessor policy-shipping
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of the seller's policy on shipping (may be blank).")

   ;; policy_refunds
   (policy-refunds
    :initarg :policy-refunds
    :accessor policy-refunds
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of the seller's policy on refunds (may be blank).")

   ;; policy_additional
   (policy-additional
    :initarg :policy-additional
    :accessor policy-additional
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of any additional policy information the seller provides (may be blank).")

   ;; policy_seller_info
   (policy-seller-info
    :initarg :policy-seller-info
    :accessor policy-seller-info
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of the Shop's Seller information (may be blank).")

   ;; sale_message
   (sale-message
    :initarg :sale-message
    :accessor sale-message
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of a message that is sent to users who buy from this shop.")

   (title
    :initarg :title
    :accessor title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of a brief heading for the shop's main page.")

   ;; vacation_autoreply
   (vacation-autoreply
    :initarg :vacation-autoreply
    :accessor vacation-autoreply
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of a message to buyers in response to new conversations. 
Primarily relevant if the is-vacation slot-value of a shop instance is true.")

   ;; vacation_message
   (vacation-message
    :initarg :vacation-message
    :accessor vacation-message
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Translation of a message to buyers. 
Primarily relevant if the is-vacation slot-value of a shop instance is true."))

  ;; (:default-initargs
  ;;  :shop-id nil :language nil :announcement nil :policy-welcome nil
  ;;  :policy-payment nil :policy-shipping nil :policy-refunds nil
  ;;  :policy-additional nil :policy-seller-info nil :sale-message nil :title nil
  ;;  :vacation-autoreply nil :vacation-message nil)

  (:documentation "Represents the translation data for a Shop.
 (URL `http://www.etsy.com/developers/documentation/reference/shoptranslation')"))


#|

 ;; :NOTE Ther is a duplicate/similiar method for shop-section-translation  
 ((:NAME        . "getShopTranslation")
  (:DESCRIPTION . "Retrieves a ShopTranslation by shop_id and language")
  (:URI         . "/shops/:shop_id/translations/:language")
  (:PARAMS
   (:SHOP-ID . "shop_id_or_name")
   (:LANGUAGE . "language"))
  (:DEFAULTS)
  (:TYPE         . "ShopTranslation")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
