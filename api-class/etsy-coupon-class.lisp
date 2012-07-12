;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-coupon-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/coupon')

----
API-ASSOCIATIONS

----
API-METHODS
"findAllShopCoupons"
"createCoupon"
"findCoupon"
"updateCoupon"
"deleteCoupon"

|#

(in-package #:cl-etsy)

;; Coupon
(defclass coupon (base-etsy)
  (;; coupon_id
   (coupon-id
    :initarg :coupon-id
    :accessor coupon-id
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type int
    :documentation "The numeric ID of the coupon.")

   ;; coupon_code
   (coupon-code
    :initarg :coupon-code
    :accessor coupon-code
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type string
    :documentation "The alphanumeric coupon code.")

   ;; seller_active
   (seller-active
    :initarg :seller-active
    :accessor seller-active
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type boolean
    :documentation "True if the coupon is active.")

   ;; pct_discount
   (pct-discount
    :initarg :pct-discount
    :accessor pct-discount
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type int
    :documentation "The discount percent (null for free shipping coupons).")

   ;; free_shipping
   (free-shipping
    :initarg :free-shipping
    :accessor free-shipping
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type boolean
    :documentation "True if the coupon applies free shipping.")

   ;; domestic_only
   (domestic-only
    :initarg :domestic-only
    :accessor domestic-only
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type boolean
    :documentation "True if the coupon free shipping applies to domestic addresses only."))
  ;; (:default-initargs 
  ;;  :coupon-id nil :coupon-code nil :seller-active nil :pct-discount nil :free-shipping nil :domestic-only nil)
  (:documentation "Represents a shop coupon.
 (URL `http://www.etsy.com/developers/documentation/reference/coupon')"))

#|
 
 ((:NAME        . "findAllShopCoupons")
  (:DESCRIPTION . "Retrieves all Shop_Coupons by shop_id")
  (:URI         . "/shops/:shop_id/coupons")
  (:PARAMS
   (:SHOP-ID . "shop_id_or_name"))
  (:DEFAULTS)
  (:TYPE         . "Coupon")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))
     
  ((:NAME        . "createCoupon")
   (:DESCRIPTION . "Creates a new Coupon.")
   (:URI         . "/shops/:shop_id/coupons")
   (:PARAMS
    (:SHOP-ID       . "shop_id_or_name")
    (:COUPON-CODE   . "string")
    (:PCT-DISCOUNT  . "int")
    (:SELLER-ACTIVE . "boolean")
    (:FREE-SHIPPING . "boolean")
    (:DOMESTIC-ONLY . "boolean"))
   (:DEFAULTS
    (:PCT-DISCOUNT)
    (:SELLER-ACTIVE . "false")
    (:FREE-SHIPPING . "false")
    (:DOMESTIC-ONLY . "false"))
   (:TYPE         . "Coupon")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "POST"))
     
  ((:NAME        . "findCoupon")
   (:DESCRIPTION . "Retrieves a Shop_Coupon by id and shop_id")
   (:URI         . "/shops/:shop_id/coupons/:coupon_id")
   (:PARAMS
    (:SHOP-ID   . "shop_id_or_name")
    (:COUPON-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Coupon")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "GET"))
     
  ((:NAME        . "updateCoupon")
   (:DESCRIPTION . "Updates a coupon")
   (:URI         . "/shops/:shop_id/coupons/:coupon_id")
   (:PARAMS
    (:SHOP-ID       . "shop_id_or_name")
    (:COUPON-ID     . "int")
    (:SELLER-ACTIVE . "boolean"))
   (:DEFAULTS
    (:SELLER-ACTIVE . "false"))
   (:TYPE         . "Coupon")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "PUT"))
     
  ((:NAME        . "deleteCoupon")
   (:DESCRIPTION . "Deletes a coupon")
   (:URI         . "/shops/:shop_id/coupons/:coupon_id")
   (:PARAMS
    (:SHOP-ID   . "shop_id_or_name")
    (:COUPON-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Coupon")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "DELETE"))

|#

;;; ==============================
;;; EOF
