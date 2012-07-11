;;; :FILE-CREATED <Timestamp: #{2012-07-10T18:33:33-04:00Z}#{12282} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/cl-etsy/api-class/etsy-bill-charge-class.lisp
;;; ==============================

#|
(URL `http://www.etsy.com/developers/documentation/reference/billcharge')

----
API-METHODS
"findallusercharges"

|#

(in-package #:cl-etsy)

;; Billcharge
(defclass bill-charge (base-etsy)
  (
   ;; bill_charge_id
   (bill-charge-id
    :initarg :bill-charge-id
    :accessor bill-charge-id
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type int
    :documentation "The numeric ID for this bill charge record.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type float
    :documentation "Creation time, in epoch seconds.")

   (type
    :initarg :type
    :accessor type
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type string
    :documentation "The name of the type of charge.")

   ;; type_id
   (type-id
    :initarg :type-id
    :accessor type-id
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type int
    :documentation "The Listing or Transaction ID to which the charge applies.")

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
    :documentation "The amount charged.")

   ;; currency_code
   (currency-code
    :initarg :currency-code
    :accessor currency-code
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type string
    :documentation "The currency of the charge.")

   ;; creation_year
   (creation-year
    :initarg :creation-year
    :accessor creation-year
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type int
    :documentation "Year that the charge was created.")

   ;; creation_month
   (creation-month
    :initarg :creation-month
    :accessor creation-month
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type int
    :documentation "Month that the charge was created.")

   ;; last_modified_tsz
   (last-modified-tsz
    :initarg :last-modified-tsz
    :accessor last-modified-tsz
    ;; :visibility private
    ;; :perm-scope billing_r
    ;; :type float
    :documentation "Time when charge was last modified.")
   ) 

  ;; (:default-initargs 
  ;;  :bill-charge-id nil :creation-tsz nil :type nil :type-id nil :user-id nil
  ;;  :amount nil :currency-code nil :creation-year nil :creation-month nil
  ;;  :last-modified-tsz nil)
  (:documentation ""))

;;; ==============================
;;; EOF
