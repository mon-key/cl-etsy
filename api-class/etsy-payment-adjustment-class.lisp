;;; :FILE-CREATED <Timestamp: #{2012-07-30T16:33:11-04:00Z}#{12311} - by MON>
;;; :FILE #P"cl-etsy/api-class/etsy-payment-adjustment-class.lisp"
;;; ==============================

#|

 :TODO get the docs for this class
 (URL `http://www.etsy.com/developers/documentation/reference/paymentadjustmentitem')

----
API-ASSOCIATIONS

----
API-METHODS

----
 (closer-mop:class-finalized-p (find-class 'payment-adjustment))
 (api-class-slot-names-as-underscored-strings 'payment-adjustment)

|#

(in-package #:cl-etsy)


;;
(defclass payment-adjustment (base-etsy)
  (
   )
  ;; (:default-initargs )
  (:documentation ""))

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
