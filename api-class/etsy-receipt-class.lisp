;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-receipt-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/receipt')

----
API-ASSOCIATIONS

:association Coupon
:visibility  private
:perm-scope  transactions_r
:type        Coupon
:description "The coupon for the receipt."

:association Country
:visibility  private
:perm-scope  transactions_r
:type        Country
:description "The country to which the order was shipped."

:association Buyer
:visibility  private
:perm-scope  transactions_r
:type        User
:description "The buyer of the items in this receipt."

:association Order
:visibility  private
:perm-scope  transactions_r
:type        Order
:description "The order this receipt is part of. (Only visible to the buyer.)"

:association Seller
:visibility  private
:perm-scope  transactions_r
:type        User
:description "The seller of the items in this receipt."

:association Transactions
:visibility  private
:perm-scope  transactions_r
:type        array(Transaction)
:description "The transactions associated to this receipt."

:association Listings
:visibility  private
:perm-scope  transactions_r
:type        array(Listing)
:description "The listings associated to this receipt."

----
API-METHODS

"createReceiptOnSandbox"
"getReceipt"
"updateReceipt"
"findAllOrderReceipts"
"findAllShopReceipts"
"findAllShopReceiptsByStatus"
"findAllUserBuyerReceipts"

----
 (closer-mop:class-finalized-p (find-class 'receipt))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'receipt)

|#

(in-package #:cl-etsy)

;; Receipt
(defclass receipt (base-etsy)
  (;; receipt_id
   (receipt-id
    :initarg :receipt-id
    :accessor receipt-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The receipt's numeric ID.")

   ;; order_id
   (order-id
    :initarg :order-id
    :accessor order-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The numeric ID of the order this receipt is associated with.")

   ;; seller_user_id
   (seller-user-id
    :initarg :seller-user-id
    :accessor seller-user-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The numeric ID of the seller for this receipt.")

   ;; buyer_user_id
   (buyer-user-id
    :initarg :buyer-user-id
    :accessor buyer-user-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The numeric ID of the buyer for this receipt.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type float
    :documentation "Creation time, in epoch seconds.")

   ;; last_modified_tsz
   (last-modified-tsz
    :initarg :last-modified-tsz
    :accessor last-modified-tsz
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type float
    :documentation "Last modification time, in epoch seconds.")

   (name
    :initarg :name
    :accessor name
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The name portion of the buyer's address.")

   ;; first_line
   (first-line
    :initarg :first-line
    :accessor first-line
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The first line of the buyer's address.")

   ;; second_line
   (second-line
    :initarg :second-line
    :accessor second-line
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The second line of the buyer's address.")

   (city
    :initarg :city
    :accessor city
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The city for the buyer's address.")

   (state
    :initarg :state
    :accessor state
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The state for the buyer's address.")

   (zip
    :initarg :zip
    :accessor zip
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The zip code of the buyer's address.")

   (country-id
    :initarg :country-id
    :accessor country-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The numeric ID of the buyer's country.")

   (payment-method
    :initarg :payment-method
    :accessor payment-method
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The payment method used. 
Return value is per LHS which is shorthand for RHS as follows:
 pp     paypal
 cc     credit card
 ck     check
 mo     money order
 other  other")

   ;; payment_email
   (payment-email
    :initarg :payment-email
    :accessor payment-email
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The email address that payment confirmation is sent.")

   ;; message_from_seller
   (message-from-seller
    :initarg :message-from-seller
    :accessor message-from-seller
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "An optional message from the seller.")

   ;; message_from_buyer
   (message-from-buyer
    :initarg :message-from-buyer
    :accessor message-from-buyer
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "An optional message from the buyer.")

   ;; was_paid
   (was-paid
    :initarg :was-paid
    :accessor was-paid
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type boolean
    :documentation "True if the receipt was paid.")

   ;; total_tax_cost
   (total-tax-cost
    :initarg :total-tax-cost
    :accessor total-tax-cost
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type float
    :documentation "The total sales tax of the receipt.")

   ;; total_price
   (total-price
    :initarg :total-price
    :accessor total-price
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type float
    :documentation "The total price of the receipt.")

   ;; total_shipping_cost
   (total-shipping-cost
    :initarg :total-shipping-cost
    :accessor total-shipping-cost
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type float
    :documentation "The total shipping cost of the receipt.")

   ;; currency_code
   (currency-code
    :initarg :currency-code
    :accessor currency-code
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The ISO code (alphabetic) for the seller's native currency.")

   ;; message_from_payment
   (message-from-payment
    :initarg :message-from-payment
    :accessor message-from-payment
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The machine generated acknowledgement from the payment system.")

   ;; was_shipped
   (was-shipped
    :initarg :was-shipped
    :accessor was-shipped
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type boolean
    :documentation "True if the items in the receipt were shipped.")

   ;; buyer_email
   (buyer-email
    :initarg :buyer-email
    :accessor buyer-email
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The email address of the buyer.")

   ;; seller_email
   (seller-email
    :initarg :seller-email
    :accessor seller-email
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The email address of the seller.")

   ;; discount_amt
   (discount-amt
    :initarg :discount-amt
    :accessor discount-amt
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type float
    :documentation "The total discount for the receipt, if using a percent-off Coupon.
Free shipping Coupons are not refected here; check the Coupon object for these.")

   (subtotal
    :initarg :subtotal
    :accessor subtotal
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type float
    :documentation "The subtotal for the receipt.")

   (grandtotal
    :initarg :grandtotal
    :accessor grandtotal
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type float
    :documentation "The grand total for the receipt.")

   ;; shipping_tracking_code
   (shipping-tracking-code
    :initarg :shipping-tracking-code
    :accessor shipping-tracking-code
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The tracking code for the shipment.")

   ;; shipping_tracking_url
   (shipping-tracking-url
    :initarg :shipping-tracking-url
    :accessor shipping-tracking-url
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The tracking URL for the shipment.")

   ;; shipping_carrier
   (shipping-carrier
    :initarg :shipping-carrier
    :accessor shipping-carrier
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The shipping carrier.")

   ;; shipping_note
   (shipping-note
    :initarg :shipping-note
    :accessor shipping-note
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The shipping notification note text."))  

  ;; (:default-initargs 
  ;;  :receipt-id nil :order-id nil :seller-user-id nil :buyer-user-id nil
  ;;  :creation-tsz nil :last-modified-tsz nil :name nil :first-line nil
  ;;  :second-line nil :city nil :state nil :zip nil :country-id nil :payment-method nil
  ;;  :payment-email nil :message-from-seller nil :message-from-buyer nil
  ;;  :was-paid nil :total-tax-cost nil :total-price nil :total-shipping-cost nil
  ;;  :currency-code nil :message-from-payment nil :was-shipped nil :buyer-email nil
  ;;  :seller-email nil :discount-amt nil :subtotal nil :grandtotal nil
  ;;  :shipping-tracking-code nil :shipping-tracking-url nil :shipping-carrier nil
  ;;  :shipping-note nil)

  (:documentation "Represents proof of payment from a user to a shop for one or more transactions.
 (URL `http://www.etsy.com/developers/documentation/reference/receipt')"))

#|

 ((:NAME        . "findAllOrderReceipts")
   (:DESCRIPTION . "Retrieves a set of Receipt objects associated to a Order.")
   (:URI         . "/orders/:order_id/receipts")
   (:PARAMS
    (:ORDER-ID . "int")
    (:LIMIT     . "int")
    (:OFFSET    . "int")
    (:PAGE      . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Receipt")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "GET"))

 ((:NAME        . "createReceiptOnSandbox")
  (:DESCRIPTION . "Creates a purchase for the current OAuth user, including Order, Receipt and Transaction resources. This method is only available via the Sandbox API. Listing IDs must be active, and belong to the same seller user ID. The buyer must have at least one UserAddress record, or an error will be thrown.")
  (:URI         . "/receipts")
  (:PARAMS
   (:LISTING-ID . "array(int)"))
  (:DEFAULTS)
  (:TYPE         . "Receipt")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "POST"))
     
 ((:NAME        . "getReceipt")
  (:DESCRIPTION . "Retrieves a Receipt by id.")
  (:URI         . "/receipts/:receipt_id")
  (:PARAMS
   (:RECEIPT-ID . "array(int)"))
  (:DEFAULTS)
  (:TYPE         . "Receipt")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))
     
 ((:NAME        . "updateReceipt")
  (:DESCRIPTION . "Updates a Receipt")
  (:URI         . "/receipts/:receipt_id")
  (:PARAMS
   (:RECEIPT-ID           . "int")
   (:WAS-PAID             . "boolean")
   (:WAS-SHIPPED          . "boolean")
   (:MESSAGE-FROM-SELLER . "string")
   (:MESSAGE-FROM-BUYER  . "string"))
  (:DEFAULTS
   (:WAS-PAID)
   (:WAS-SHIPPED)
   (:MESSAGE-FROM-SELLER)
   (:MESSAGE-FROM-BUYER))
  (:TYPE         . "Receipt")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "PUT"))

 ((:NAME        . "findAllShopReceipts")
  (:DESCRIPTION . "Retrieves a set of Receipt objects associated to a Shop.")
  (:URI         . "/shops/:shop_id/receipts")
  (:PARAMS
   (:SHOP-ID     . "shop_id_or_name")
   (:MIN-CREATED . "epoch")
   (:MAX-CREATED . "epoch")
   (:LIMIT        . "int")
   (:OFFSET       . "int")
   (:PAGE         . "int")
   (:WAS-PAID    . "boolean")
   (:WAS-SHIPPED . "boolean"))
  (:DEFAULTS
   (:MIN-CREATED)
   (:MAX-CREATED)
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE)
   (:WAS-PAID)
   (:WAS-SHIPPED))
  (:TYPE         . "Receipt")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllShopReceiptsByStatus")
  (:DESCRIPTION . "Retrieves a set of Receipt objects associated to a Shop based on the status.")
  (:URI         . "/shops/:shop_id/receipts/:status")
  (:PARAMS
   (:SHOP-ID . "shop_id_or_name")
   (:STATUS   . "enum(open, unshipped, unpaid, completed, processing, all)")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Receipt")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllUserBuyerReceipts")
  (:DESCRIPTION . "Retrieves a set of Receipt objects associated to a User.")
  (:URI         . "/users/:user_id/receipts")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Receipt")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

|#

;;; ==============================
;;; EOF
