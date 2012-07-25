;;; :FILE-CREATED <Timestamp: #{2012-07-23T12:29:12-04:00Z}#{12301} - by MON>
;;; :FILE #P"cl-etsy/api-class/etsy-ledger-class.lisp"
;;; ==============================

#|

:NOTE "Ledger" was added to the  Etsy API 2012-07-17.

 (URL `https://groups.google.com/forum/?fromgroups#!searchin/etsy-api-v2/Ledger/etsy-api-v2/ao_QI9QywYc/7f-IMinsfV0J')

 (URL `http://www.etsy.com/developers/documentation/reference/ledger')

----
API-ASSOCIATIONS

----
API-METHODS

"findLedger"

----
 (closer-mop:class-finalized-p (find-class 'ledger))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'ledger)

|#


(in-package #:cl-etsy)

;; Ledger
(defclass ledger (base-etsy)
  (;; ledger_id
   (ledger-id
    :initarg :ledger-id
    :accessor ledger-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The ledger's numeric ID.")

   ;; shop_id
   (shop-id
    :initarg :shop-id
    :accessor shop-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The shop's numeric ID.")

   ;; currency
   (currency
    :initarg :currency
    :accessor currency
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type string
    :documentation "The currency code of the shop.")

   ;; create_date
   (create-date
    :initarg :create-date
    :accessor create-date
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The date and time the ledger was created in Epoch seconds.")

   ;; update_date
   (update-date
    :initarg :update-date
    :accessor update-date
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The date and time the ledger was last updated in Epoch seconds."))

  ;; (:default-initargs :ledger-id nil :shop-id nil :currency nil :create-date nil :update-date nil)

  (:documentation "
:SEE Etsy API method \"findLedgerEntries\".
 (URL `http://www.etsy.com/developers/documentation/reference/ledger')"))


#|


  ((:NAME        . "findLedger")
   (:DESCRIPTION . "Get a Shop Payment Account Ledger.")
   (:URI         . "/shops/:shop_id/ledger/")
   (:PARAMS
    (:SHOP-ID    . "shop_id_or_name"))
   (:DEFAULTS)
   (:TYPE        . "Ledger")
   (:VISIBILITY  . "private")
   (:HTTP-METHOD . "GET"))


|#

;;; ==============================
;;; EOF
