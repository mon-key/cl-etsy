;;; :FILE-CREATED <Timestamp: #{2012-07-30T16:37:53-04:00Z}#{12311} - by MON>
;;; :FILE #P"cl-etsy/api-class/etsy-payment-adjustment-item-class.lisp"
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/paymentadjustmentitem')

----
API-METHODS

 :NOTE There are two methods with the same name "findPaymentAdjustmentItem"

"findPaymentAdjustmentItem"
"findPaymentAdjustmentItem"

----
 (closer-mop:class-finalized-p (find-class 'payment-adjustment-item))
 (api-class-slot-names-as-underscored-strings 'payment-adjustment-item)

|#

(in-package #:cl-etsy)

;; PaymentAdjustmentItem
(defclass payment-adjustment-item (base-etsy)
  (;; payment_adjustment_item_id
   (payment-adjustment-item-id
    :initarg :payment-adjustment-item-id
    :accessor payment-adjustment-item-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The payment adjustment item's numeric ID.")

   ;; payment_adjustment_id
   (payment-adjustment-id
    :initarg :payment-adjustment-id
    :accessor payment-adjustment-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The payment adjustment's numeric ID.")

   ;; adjustment_type
   (adjustment-type
    :initarg :adjustment-type
    :accessor adjustment-type
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "A human readable string describing the area being refunded.
One of: TRANS, TAX, or SHIP.")

   ;; amount
   (amount
    :initarg :amount
    :accessor amount
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The total amount of the payment adjustment item.")

   ;; transaction_id
   (transaction-id
    :initarg :transaction-id
    :accessor transaction-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The numerice ID of the Credit Card Transaction.")

   ;; create_date
   (create-date
    :initarg :create-date
    :accessor create-date
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The date and time the payment adjustment item was created in Epoch seconds.")
   )

  ;; (:default-initargs
  ;;  :payment-adjustment-item-id nil :payment-adjustment-id nil
  ;;  :adjustment-type nil :amount nil :transaction-id nil :create-date nil)
  
  (:documentation "A Direct Checkout Payment may have adjustments, or refunds.
These adjustments can have different items, associated with the area being refunded, like shipping, sales tax, or the item itself.
Please note all monetary amounts are in USD pennies unless otherwise specified.
 (URL `http://www.etsy.com/developers/documentation/reference/paymentadjustmentitem')"))

#|

  ;; !!!!  
  ((:NAME        . "findPaymentAdjustmentItem")
   (:DESCRIPTION . "Get Direct Checkout Payment Adjustment Items")
   (:URI         . "/payments/:payment_id/adjustments/:payment_adjustment_id/items")
   (:PARAMS
    (:PAYMENT-ID             . "int")
    (:PAYMENT-ADJUSTMENT-ID . "int")
    (:LIMIT                   . "int")
    (:OFFSET                  . "int")
    (:PAGE                    . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "PaymentAdjustmentItem")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD  . "GET"))

  ;; !!!!
  ((:NAME        . "findPaymentAdjustmentItem")
   (:DESCRIPTION . "Get a Direct Checkout Payment Adjustment Item")
   (:URI         . "/payments/:payment_id/adjustments/:payment_adjustment_id/items/:payment_adjustment_item_id")
   (:PARAMS
    (:PAYMENT-ID                   . "int")
    (:PAYMENT-ADJUSTMENT-ID       . "int")
    (:PAYMENT-ADJUSTMENT-ITEM-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "PaymentAdjustmentItem")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD  . "GET"))

|#

;;; ==============================
;;; EOF
