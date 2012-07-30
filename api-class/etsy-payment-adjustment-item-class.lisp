;;; :FILE-CREATED <Timestamp: #{2012-07-30T16:37:53-04:00Z}#{12311} - by MON>
;;; :FILE #P"cl-etsy/api-class/etsy-payment-adjustment-item-class.lisp"
;;; ==============================

#|

 :TODO get the docs for this class

 (URL `http://www.etsy.com/developers/documentation/reference/paymentadjustmentitem')

----
API-ASSOCIATIONS

----
API-METHODS

----
 (closer-mop:class-finalized-p (find-class 'payment-adjustment-item))
 (api-class-slot-names-as-underscored-strings 'payment-adjustment-item)

|#

(in-package #:cl-etsy)

;;
(defclass payment-adjustment-item (base-etsy)
  (
   )

  ;; (:default-initargs )
  
  (:documentation ""))

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
