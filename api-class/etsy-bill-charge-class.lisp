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
bill_charge_id 	private 	billing_r 	int 	The numeric ID for this bill charge record.
creation_tsz 	private 	billing_r 	float 	Creation time, in epoch seconds.
type 	private 	billing_r 	string 	The name of the type of charge.
type_id 	private 	billing_r 	int 	The Listing or Transaction ID to which the charge applies.
user_id 	private 	billing_r 	int 	The user's numeric ID.
amount 	private 	billing_r 	float 	The amount charged.
currency_code 	private 	billing_r 	string 	The currency of the charge.
creation_year 	private 	billing_r 	int 	Year that the charge was created.
creation_month 	private 	billing_r 	int 	Month that the charge was created.
last_modified_tsz 	private 	billing_r 	float 	Time when charge was last modified. 
  )
  ;; (:default-initargs )
  (:documentation ""))

;;; ==============================
;;; EOF
