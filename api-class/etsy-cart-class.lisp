;;; :FILE-CREATED <Timestamp: #{2012-07-10T22:52:01-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-cart-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/cart')

----
API-ASSOCIATIONS

:association Shop 
:visibility  private 
:perm-scope  cart_rw 
:type        Shop 
:description "The shop"

:association Listings
:visibility  private
:perm-scope  cart_rw
:type        array(Listing)
:description "An array of listings"

:association Coupon
:visibility  private
:perm-scope  cart_rw
:type        Coupon
:description "The coupon applied to the cart "

----
API-METHODS

"getAllUserCarts"
"updateCartListingQuantity"
"removeCartListing"
"getUserCart"
"updateCart"
"deleteCart"

----
 (closer-mop:class-finalized-p (find-class 'cart))
 (api-class-slot-names-as-underscored-strings  'cart)


|#

(in-package #:cl-etsy)

;; Cart
(defclass cart (base-etsy)
  (;; cart_id 
   (cart-id 
    :initarg :cart-id 
    :accessor cart-id 
    ;; :visibility private 
    ;; :perm-scope cart_rw 
    ;; :type int 
    :documentation "The numeric ID of the cart.")

   ;; shop_name
   (shop-name
    :initarg :shop-name
    :accessor shop-name
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The shop name.")

   ;; message_to_seller
   (message-to-seller
    :initarg :message-to-seller
    :accessor message-to-seller
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The message to the seller.")

   ;; destination_country_id
   (destination-country-id
    :initarg :destination-country-id
    :accessor destination-country-id
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type int
    :documentation "The numeric ID of the destination country.")

   ;; coupon_code
   (coupon-code
    :initarg :coupon-code
    :accessor coupon-code
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The alphanumeric coupon code applied to the cart.")

   ;; currency_code
   (currency-code
    :initarg :currency-code
    :accessor currency-code
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The ISO (alphabetic) code for the currency.")

   (total
    :initarg :total
    :accessor total
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The total price.")

   ;; subtotal
   (subtotal
    :initarg :subtotal
    :accessor subtotal
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The subtotal price.")

   ;; shipping_cost
   (shipping-cost
    :initarg :shipping-cost
    :accessor shipping-cost
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The shipping cost.")

   ;; tax_cost
   (tax-cost
    :initarg :tax-cost
    :accessor tax-cost
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The tax cost.")

   ;; discount_amount
   (discount-amount
    :initarg :discount-amount
    :accessor discount-amount
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The line-item discount amount (does not include tax or shipping).")

   ;; shipping_discount_amount
   (shipping-discount-amount
    :initarg :shipping-discount-amount
    :accessor shipping-discount-amount
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The shipping discount amount.")

   ;; tax_discount_amount
   (tax-discount-amount
    :initarg :tax-discount-amount
    :accessor tax-discount-amount
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The tax discount amount.")

   (url
    :initarg :url
    :accessor url
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The full URL to the cart page on Etsy.")

   (listings
    :initarg :listings
    :accessor listings
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type array(CartListing)
    :documentation "An array of purchase information for the listings."))

  ;; (:default-initargs 
  ;;  :cart-id nil :shop-name nil :message-to-seller nil :destination-country-id nil
  ;;  :coupon-code nil :currency-code nil :total nil :subtotal nil :shipping-cost nil
  ;;  :tax-cost nil :discount-amount nil :shipping-discount-amount nil
  ;;  :tax-discount-amount nil :url nil :listings nil)

  (:documentation "Represents a shopping cart on Etsy. Users have one cart per shop.
 (URL `http://www.etsy.com/developers/documentation/reference/cart')"))

#|

 ((:NAME        . "getAllUserCarts")
  (:DESCRIPTION . "Get a user's Carts")
  (:URI         . "/users/:user_id/carts")
  (:PARAMS
   (:USER-ID . "user_id_or_name"))
  (:DEFAULTS)
  (:TYPE         . "Cart")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "addToCart")
  (:DESCRIPTION . "Add a listing to a cart")
  (:URI         . "/users/:user_id/carts")
  (:PARAMS
   (:USER-ID    . "user_id_or_name")
   (:LISTING-ID . "int")
   (:QUANTITY    . "int"))
  (:DEFAULTS
   (:QUANTITY . 1))
  (:TYPE         . "Cart")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "POST"))

 ((:NAME        . "updateCartListingQuantity")
  (:DESCRIPTION . "Update a cart listing purchase quantity")
  (:URI         . "/users/:user_id/carts")
  (:PARAMS
   (:USER-ID    . "user_id_or_name")
   (:LISTING-ID . "int")
   (:QUANTITY    . "int"))
  (:DEFAULTS)
  (:TYPE         . "Cart")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "PUT"))

 ((:NAME        . "removeCartListing")
  (:DESCRIPTION . "Remove a listing from a cart")
  (:URI         . "/users/:user_id/carts")
  (:PARAMS
   (:USER-ID    . "user_id_or_name")
   (:LISTING-ID . "int"))
  (:DEFAULTS)
  (:TYPE         . "Cart")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "DELETE"))

 ((:NAME        . "getUserCart")
  (:DESCRIPTION . "Get a cart")
  (:URI         . "/users/:user_id/carts/:cart_id")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:CART-ID . "cart_id"))
  (:DEFAULTS)
  (:TYPE         . "Cart")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "updateCart")
  (:DESCRIPTION . "Update a cart")
  (:URI         . "/users/:user_id/carts/:cart_id")
  (:PARAMS
   (:USER-ID                 . "user_id_or_name")
   (:CART-ID                 . "cart_id")
   (:DESTINATION-COUNTRY-ID . "int")
   (:MESSAGE-TO-SELLER      . "text")
   (:COUPON-CODE             . "string"))
  (:DEFAULTS
   (:DESTINATION-COUNTRY-ID)
   (:MESSAGE-TO-SELLER)
   (:COUPON-CODE))
  (:TYPE         . "Cart")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "PUT"))

 ((:NAME        . "deleteCart")
  (:DESCRIPTION . "Delete a cart")
  (:URI         . "/users/:user_id/carts/:cart_id")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:CART-ID . "cart_id"))
  (:DEFAULTS)
  (:TYPE         . "Cart")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "DELETE"))

|#



;;; ==============================
;;; EOF
