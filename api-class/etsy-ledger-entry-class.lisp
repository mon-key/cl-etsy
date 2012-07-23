;;; :FILE-CREATED <Timestamp: #{2012-07-23T14:05:02-04:00Z}#{12301} - by MON>
;;; :FILE #P"cl-etsy/api-class/etsy-ledger-entry-class.lisp"
;;; ==============================

#|

:NOTE "Ledger" was added to the  Etsy API 2012-07-17.
 (URL `https://groups.google.com/forum/?fromgroups#!searchin/etsy-api-v2/Ledger/etsy-api-v2/ao_QI9QywYc/7f-IMinsfV0J')

 (URL `http://www.etsy.com/developers/documentation/reference/ledgerentry')

----
API-ASSOCIATIONS

----
API-METHODS

"findLedgerEntries"

----
 (closer-mop:class-finalized-p (find-class 'ledger-entry))
 (api-class-slot-names-as-underscored-strings 'ledger-entry)

|#

(in-package #:cl-etsy)


;; LedgerEntry
(defclass ledger-entry (base-etsy)
  (;; ledger_entry_id
   (ledger-entry-id
    :initarg :ledger-entry-id
    :accessor ledger-entry-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The ledger entry's numeric ID.")

   ;; ledger_id
   (ledger-id
    :initarg :ledger-id
    :accessor ledger-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The ledger's numeric ID.")

   ;; :NOTE sequence is a cl:type
   ;; sequence
   (sequence
    :initarg :sequence
    :accessor sequence
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The sequence allows ledger entries to be sorted chronologically.
The higher the sequence, the more recent the entry.")

   ;; credit_amount
   (credit-amount
    :initarg :credit-amount
    :accessor credit-amount
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The amount of money credited to the ledger.")

   ;; debit_amount
   (debit-amount
    :initarg :debit-amount
    :accessor debit-amount
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The amount of money debited from the ledger.")

   ;; entry_type
   (entry-type
    :initarg :entry-type
    :accessor entry-type
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "Details what kind of ledger entry this is: a payment, refund, disbursement, returned disbursement, or recoupment.")

   ;; reference_id
   (reference-id
    :initarg :reference-id
    :accessor reference-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "Depending on the entry_type, this is the id of the corresponding payment, payment adjustment, or disbursement.")

   ;; running_balance
   (running-balance
    :initarg :running-balance
    :accessor running-balance
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The amount of money in the shop's ledger the moment after this entry was applied.")

   ;; create_date
   (create-date
    :initarg :create-date
    :accessor create-date
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The date and time the ledger entry was created in Epoch seconds.")))

  ;; (:default-initargs 
  ;;  :ledger-entry-id nil :ledger-id nil :sequence nil :credit-amount nil
  ;;  :debit-amount nil :entry-type nil :reference-id nil :running-balance nil
  ;;  :create-date nil)

  (:documentation "Represents an entry in the ledger of a shop.
 (URL `http://www.etsy.com/developers/documentation/reference/ledgerentry')"))


#|

  ((:NAME        . "findLedgerEntries")
   (:DESCRIPTION . "Get a Shop Payment Account Ledger's Entries.")
   (:URI         . "/shops/:shop_id/ledger/entries")
   (:PARAMS
    (:SHOP-ID    . "shop_id_or_name")
    (:LIMIT      . "int")
    (:OFFSET     . "int")
    (:PAGE       . "int"))
   (:DEFAULTS
    (:LIMIT      . 25)
    (:OFFSET     . 0)
    (:PAGE))
   (:TYPE        . "LedgerEntry")
   (:VISIBILITY  . "private")
   (:HTTP-METHOD . "GET"))

|#

;;; ==============================
;;; EOF
