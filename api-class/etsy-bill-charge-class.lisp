;;; :FILE-CREATED <Timestamp: #{2012-07-10T18:33:33-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-bill-charge-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/billcharge')

----
API-METHODS

"findAllUserCharges"
"getUserChargesMetadata"

----
 (closer-mop:class-finalized-p  (find-class 'bill-charge))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'bill-charge)

|#

(in-package #:cl-etsy)

;; Billcharge
(defclass bill-charge (base-etsy)
  (;; bill_charge_id
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
    ;; :type float ;; why not int?
    :documentation "Creation time, in epoch seconds.")

   ;; :NOTE This symbol conflicts with CL:TYPE
   ;; Consider bill-charge-type or charge-type instead???
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
    :documentation "Time when charge was last modified.")) 

  ;; (:default-initargs 
  ;;  :bill-charge-id nil :creation-tsz nil :type nil :type-id nil :user-id nil
  ;;  :amount nil :currency-code nil :creation-year nil :creation-month nil
  ;;  :last-modified-tsz nil)

  (:documentation "Represents a charge to an Etsy member's account.
The type slot of bill-charge indicates the nature of the charge.
Following table outlines the types of charges for a bill-charge:

 listing 	   Seller fee for listing an item.
 edit 	           Seller fee if listing quantity increased.
 renew 	           Seller fee for renewing active listing.
 renew_sold 	   Seller fee for renewing sold listing.
 renew_expired 	   Seller fee for renewing expired listing.
 transaction 	   Seller fee for sold item.
 showcase_category Seller fee for current Showcase feature.
 showcase 	   Seller fee for original Showcase feature. [DEPRECATED]
 alchemy 	   Seller fee for Alchemy feature. [DEPRECATED]

 (URL `http://www.etsy.com/developers/documentation/reference/billcharge')"))


#|

 ((:NAME . "findAllUserCharges")
  (:DESCRIPTION
   . "Retrieves a set of BillCharge objects associated to a User. NOTE: from 8/8/12 the min_created and max_created arguments will be mandatory and can be no more than 31 days apart.")
  (:URI . "/users/:user_id/charges")
  (:PARAMS
   ("max_created" . "epoch")
   ("min_created" . "epoch")
   ("sort_order" . "enum(up, down)")
   ("user_id" . "user_id_or_name")
   ("page" . "int")
   ("offset" . "int")
   ("limit" . "int"))
  (:DEFAULTS
   ("max_created")
   ("min_created")
   ("sort_order" . "up")
   ("page")
   ("offset" . 0)
   ("limit" . 25))
  (:TYPE . "BillCharge")
  (:VISIBILITY . "private")
  (:HTTP-METHOD . "GET"))


 ((:NAME . "getUserChargesMetadata")
  (:DESCRIPTION
   . "Metadata for the set of BillCharges objects associated to a User")
  (:URI . "/users/:user_id/charges/meta")
  (:PARAMS ("user_id" . "user_id_or_name"))
  (:DEFAULTS)
  (:TYPE . "Dict")
  (:VISIBILITY . "private")
  (:HTTP-METHOD . "GET"))
 


|#




;;; ==============================
;;; EOF
