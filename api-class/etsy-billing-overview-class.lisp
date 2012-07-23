;;; :FILE-CREATED <Timestamp: #{2012-07-10T22:15:45-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-billing-overview-class.lisp
;;; ==============================


#|

 (URL `http://www.etsy.com/developers/documentation/reference/billingoverview')

----
API-METHODS
"getUserBillingOverview"


 ;; (closer-mop:class-finalized-p (find-class 'billing-overview))
 ;; (api-class-slot-names-as-underscored-strings  'billing-overview)


|#

(in-package #:cl-etsy)

;; BillingOverview
(defclass billing-overview (base-etsy)
  (;; is_overdue 
   (is-overdue 
    :initarg :is-overdue 
    :accessor is-overdue 
    ;; :visibility private 
    ;; :perm-scope billing_r 
    ;; :type boolean 
    :documentation "True if the user has an overdue balance.")
           
   ;; currency_code
   (currency-code
    :initarg :currency-code
    :accessor currency-code
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type string
    :documentation "The currency unit in which the user is billed.")

   ;; overdue_balance
   (overdue-balance
    :initarg :overdue-balance
    :accessor overdue-balance
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type float
    :documentation "The total overdue balance owed by the user.")

   ;; balance_due
   (balance-due
    :initarg :balance-due
    :accessor balance-due
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type float
    :documentation "The total amount currently due for payment (including any overdue balance.)")

   ;; total_balance
   (total-balance
    :initarg :total-balance
    :accessor total-balance
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type float
    :documentation "The total amount owed by the user (including fees that are not yet due for payment.)")

   ;; date_due
   (date-due
    :initarg :date-due
    :accessor date-due
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type epoch
    :documentation "The date by which the user's balance due must be paid.")

   ;; date_overdue
   (date-overdue
    :initarg :date-overdue
    :accessor date-overdue
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type epoch
    :documentation "The date on which the user's balance became overdue."))

  ;; (:default-initargs 
  ;;  :is-overdue nil :currency-code nil :overdue-balance nil :balance-due nil
  ;;  :total-balance nil :date-due nil :date-overdue nil)

  (:documentation "A user's account balance on Etsy.
 (URL `http://www.etsy.com/developers/documentation/reference/billingoverview')"))


#|

 ((:NAME        . "getUserBillingOverview")
  (:DESCRIPTION . "Retrieves the user's current balance.")
  (:URI         . "/users/:user_id/billing/overview")
  (:PARAMS
   (:USER-ID . "user_id_or_name"))
  (:DEFAULTS)
  (:TYPE         . "BillingOverview")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

|#



;;; ==============================
;;; EOF
