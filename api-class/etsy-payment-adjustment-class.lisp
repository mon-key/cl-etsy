;;; :FILE-CREATED <Timestamp: #{2012-07-30T16:33:11-04:00Z}#{12311} - by MON>
;;; :FILE #P"cl-etsy/api-class/etsy-payment-adjustment-class.lisp"
;;; ==============================

#|

 :TODO get the docs for this class
 (URL `http://www.etsy.com/developers/documentation/reference/paymentadjustment')

----
API-ASSOCIATIONS

----
API-METHODS

"findPaymentAdjustment"
"findPaymentAdjustments"

----
 (closer-mop:class-finalized-p (find-class 'payment-adjustment))
 (api-class-slot-names-as-underscored-strings 'payment-adjustment)

|#

(in-package #:cl-etsy)


;; PaymentAdjustment
(defclass payment-adjustment (base-etsy)
  (;; payment_adjustment_id
   (payment-adjustment-id
    :initarg :payment-adjustment-id
    :accessor payment-adjustment-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The payment adjustment's numeric ID.")

   ;; payment_id
   (payment-id
    :initarg :payment-id
    :accessor payment-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The payment's numeric ID.")

   ;; status
   (status
    :initarg :status
    :accessor status
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The status of the Payment Adjustment.
May be one of: OPEN, REFUNDED, ERROR, or REFUND_FAILED.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The seller's numeric ID.")

   ;; reason_code
   (reason-code
    :initarg :reason-code
    :accessor reason-code
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "A human-readable string describing the need for the refund.")

   ;; total_adjustment_amount
   (total-adjustment-amount
    :initarg :total-adjustment-amount
    :accessor total-adjustment-amount
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The total amount of the refund.")

   ;; total_fee_adjustment_amount
   (total-fee-adjustment-amount
    :initarg :total-fee-adjustment-amount
    :accessor total-fee-adjustment-amount
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The amount of card processing fees associated with this adjustment.")

   ;; create_date
   (create-date
    :initarg :create-date
    :accessor create-date
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The date and time the payment adjustment was created in Epoch seconds.")

   ;; update_date
   (update-date
    :initarg :update-date
    :accessor update-date
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The date and time the payment adjustment was last updated in Epoch seconds.")
   )

  ;; (:default-initargs 
  ;;  :payment-adjustment-id nil :payment-id nil :status nil :user-id nil
  ;;  :reason-code nil :total-adjustment-amount nil :total-fee-adjustment-amount nil
  ;;  :create-date nil :update-date nil)

  (:documentation "Represents refund on a Direct Checkout Payment.
Please note all monetary amounts are in USD pennies unless otherwise specified.
 (URL `http://www.etsy.com/developers/documentation/reference/paymentadjustment')"))

#|

 ((:NAME        . "findPaymentAdjustments")
  (:DESCRIPTION . "Get a Payment Adjustments from a Payment Id.")
  (:URI         . "/payments/:payment_id/adjustments")
  (:PARAMS
   (:PAYMENT-ID . "int")
   (:LIMIT       . "int")
   (:OFFSET      . "int")
   (:PAGE        . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "PaymentAdjustment")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD  . "GET"))
  
  ;; !!!!     
 ((:NAME        . "findPaymentAdjustment")
  (:DESCRIPTION . "Get a Direct Checkout Payment Adjustment.")
  (:URI         . "/payments/:payment_id/adjustments/:payment_adjustment_id")
  (:PARAMS
   (:PAYMENT-ID             . "int")
   (:PAYMENT-ADJUSTMENT-ID . "int"))
  (:DEFAULTS)
  (:TYPE         . "PaymentAdjustment")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD  . "GET"))


|#

;;; ==============================
;;; EOF
