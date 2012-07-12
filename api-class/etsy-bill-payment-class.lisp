;;; :FILE-CREATED <Timestamp: #{2012-07-10T22:40:52-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-bill-payment-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/billpayment')

----
API-METHODS

"findAllUserPayments"

|#

(in-package #:cl-etsy)

;; BillPayment
(defclass bill-payment (base-etsy)
  (;; bill_payment_id 
   (bill-payment-id 
    :initarg :bill-payment-id 
    :accessor bill-payment-id 
    ;; :visibility private 
    ;; :perm-scope billing_r 
    ;; :type int 
    :documentation "The numeric ID for this bill payment record.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type float
    :documentation "Creation time, in epoch seconds.")

   ;; :NOTE This symbol conflicts with CL:TYPE
   ;; Consider using payment-type or bill-payment-type instead???
   (type
    :initarg :type
    :accessor type
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type string
    :documentation "The name of the type of payment.")

   ;; type_id
   (type-id
    :initarg :type-id
    :accessor type-id
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type int
    :documentation "The Listing or Transaction ID to which the payment applies.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type int
    :documentation "The user's numeric ID.")

   (amount
    :initarg :amount
    :accessor amount
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type float
    :documentation "The amount paid.")

   ;; currency_code
   (currency-code
    :initarg :currency-code
    :accessor currency-code
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type string
    :documentation "The currency of the payment.")

   ;; creation_month
   (creation-month
    :initarg :creation-month
    :accessor creation-month
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type int
    :documentation "Month that the payment was made.")

   ;; creation_year
   (creation-year
    :initarg :creation-year
    :accessor creation-year
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type int
    :documentation "Year that the payment was made. "))

  ;; (:default-initargs 
  ;;  :bill-payment-id nil :creation-tsz nil :type nil :type-id nil :user-id nil
  ;;  :amount nil :currency-code nil :creation-month nil :creation-year nil)

  (:documentation "Represents a user's Billing Payment.
 (URL `http://www.etsy.com/developers/documentation/reference/billpayment')"))


#|


 ((:NAME        . "findAllUserPayments")
  (:DESCRIPTION . "Retrieves a set of BillPayment objects associated to a User.")
  (:URI         . "/users/:user_id/payments")
  (:PARAMS
   (:LIMIT        . "int")
   (:OFFSET       . "int")
   (:PAGE         . "int")
   (:USER-ID     . "user_id_or_name")
   (:SORT-ORDER  . "enum(up, down)")
   (:MIN-CREATED . "epoch")
   (:MAX-CREATED . "epoch"))
  (:DEFAULTS
   (:LIMIT       . 25)
   (:OFFSET      . 0)
   (:PAGE)
   (:SORT-ORDER . "up")
   (:MIN-CREATED)
   (:MAX-CREATED))
  (:TYPE         . "BillPayment")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
