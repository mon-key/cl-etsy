;;; :FILE-CREATED <Timestamp: #{2012-07-23T14:30:58-04:00Z}#{12301} - by MON>
;;; :FILE #P"cl-etsy/api-class/etsy-payment-class.lisp"
;;; ==============================


#|

 (URL `http://www.etsy.com/developers/documentation/reference/payment')

----
API-METHODS

 "findPayment"

----
 (closer-mop:class-finalized-p (find-class 'payment))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'payment)

|#

(in-package #:cl-etsy)

;; Payment
(defclass payment (base-etsy)
  (;; payment_id
   (payment-id
    :initarg :payment-id
    :accessor payment-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The payment's numeric ID.")

   ;; buyer_user_id
   (buyer-user-id
    :initarg :buyer-user-id
    :accessor buyer-user-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The buyer's numeric ID.")

   ;; shop_id
   (shop-id
    :initarg :shop-id
    :accessor shop-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The shop's numeric ID.")

   ;; receipt_id
   (receipt-id
    :initarg :receipt-id
    :accessor receipt-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The receipt's numeric ID.")

   ;; amount_gross
   (amount-gross
    :initarg :amount-gross
    :accessor amount-gross
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The original gross amount of the order, in pennies - this is grand total, including shipping and taxes.")

   ;; amount_fees
   (amount-fees
    :initarg :amount-fees
    :accessor amount-fees
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The original card processing fee of the order in pennies.")

   ;; amount_net
   (amount-net
    :initarg :amount-net
    :accessor amount-net
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The total value of the payment less fees e.g.: (- amount-gross amount-fees).")

   ;; posted_gross
   (posted-gross
    :initarg :posted-gross
    :accessor posted-gross
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The gross amount which posted to the ledger once shipped.
This is equal to the amount_gross UNLESS the seller issues a refund prior to shipping.
Etsy considers \"shipping\" to the event which \"posts\" to the ledger.
Therefore, if the seller refunds first, we simply reduce the amount-gross and post that amount.
The seller does not see refunded amount in their ledger.
This is equal to the credit-amount of the ledger-entry.")

   ;; posted_fees
   (posted-fees
    :initarg :posted-fees
    :accessor posted-fees
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "Amount of the fees that posted when shipped.
Etsy refunds a proportional amount of the fees when a seller refunds a buyer.
If a seller issues a refund prior to shipping, the posted amount will be less than the original.")

   ;; posted_net
   (posted-net
    :initarg :posted-net
    :accessor posted-net
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The total value of the payment at the time of posting it to the ledger less fees e.g. (- posted-gross posted-fees).")

   ;; adjusted_gross
   (adjusted-gross
    :initarg :adjusted-gross
    :accessor adjusted-gross
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "If the payment is refunded, partially or fully, this is the new gross amount after the refund.")

   ;; adjusted_fees
   (adjusted-fees
    :initarg :adjusted-fees
    :accessor adjusted-fees
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "If the payment is refunded, partially or fully, this is the new fee amount after the refund.")

   ;; adjusted_net
   (adjusted-net
    :initarg :adjusted-net
    :accessor adjusted-net
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The total value of the payment after refunds less fees e.g. (- adjusted-gross adjusted-fees).")

   ;; currency
   (currency
    :initarg :currency
    :accessor currency
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "What currency the payment was made in.")

   ;; shipping_user_id
   (shipping-user-id
    :initarg :shipping-user-id
    :accessor shipping-user-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The numeric id of the user to which the order is being shipped.")

   ;; shipping_address_id
   (shipping-address-id
    :initarg :shipping-address-id
    :accessor shipping-address-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The numeric id identifying the shipping address.")

   ;; billing_address_id
   (billing-address-id
    :initarg :billing-address-id
    :accessor billing-address-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The numeric id identifying the billing address of the buyer.")

   ;; status
   (status
    :initarg :status
    :accessor status
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "Indicates the current status of the payment.
Most commonly \"settled\" or \"authed\".")

   ;; shipped_date
   (shipped-date
    :initarg :shipped-date
    :accessor shipped-date
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The date and time the payment was shipped in Epoch seconds.")

   ;; create_date
   (create-date
    :initarg :create-date
    :accessor create-date
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The date and time the payment was created in Epoch seconds.")

   ;; update_date
   (update-date
    :initarg :update-date
    :accessor update-date
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The date and time the payment was last updated in Epoch seconds."))

  ;; (:default-initargs
  ;;  :payment-id nil :buyer-user-id nil :shop-id nil :receipt-id nil :amount-gross nil
  ;;  :amount-fees nil :amount-net nil :posted-gross nil :posted-fees nil
  ;;  :posted-net nil :adjusted-gross nil :adjusted-fees nil :adjusted-net nil
  ;;  :currency nil :shipping-user-id nil :shipping-address-id nil
  ;;  :billing-address-id nil :status nil :shipped-date nil :create-date nil
  ;;  :update-date nil)

  (:documentation "Represents a Payment made with Direct Checkout.
Please note all monetary amounts are in USD pennies unless otherwise specified.
 (URL `http://www.etsy.com/developers/documentation/reference/payment')"))

#|  

 ((:NAME        . "findPayment")
  (:DESCRIPTION . "Get a Direct Checkout Payment")
  (:URI         . "/payments/:payment_id")
  (:PARAMS
   (:PAYMENT-ID . "int"))
  (:DEFAULTS)
  (:TYPE         . "Payment")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD  . "GET"))

|#


;;; ==============================
;;; EOF
