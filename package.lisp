;;; :FILE-CREATED <Timestamp: #{2012-07-24T15:59:55-04:00Z}#{12302} - by MON>
;;; :FILE #P"cl-etsy/package.lisp"
;;; ==============================

;; (cl:in-package #:common-lisp-user)

(defpackage #:cl-etsy
  (:use #:common-lisp)
  (:nicknames #:etsy) ; :etc (find-package "ETC")
  (:documentation "A bridge from Common Lisp to v2 API of Etsy.com.")
  ;; 
  ;; We shadow cl:type cl:count and cl:sequence b/c the Etsy API exposes
  ;; representations with "type" "count" and "sequence" fields!
  ;;
  ;; The Etsy API has three representation's with the field "type", these are:
  ;;  BillCharge BillPayment DataType
  ;; we model a slot-name and slot-accessor `type' in the following api-classes:
  ;;  bill-charge bill-payment data-type
  ;; Possible variant symbol-name(s) to use instead:
  ;; bill-charge  - charge-type bill-charge-type
  ;; bill-payment - payment-type bill-payment-type
  ;; data-type    - data-type-type
  ;;
  ;; The Etsy API FeedbackInfo has the field "count" which we model in the
  ;; api-class `feedback-info' with the slot-name and slot-accessor `count'.
  ;; Possible variant symbol-name(s) to use instead:
  ;; feedback-info - feedback-count feedback-info-count
  ;;
  ;; The Etsy API LedgerEntry representation has the field "sequence" which we
  ;; model in the api-class `ledger-entry' with the slot-name and slot-accessor `sequence'.
  ;; Possible variant symbol-name(s) to use instead:
  ;; ledger-entry-sequence - index-position
  ;;
  ;; The Etsy API DataType representation also has the field "values" which we
  ;; model in the api-class `data-type' with the slot-name and slot-accessor `data-type-values'.
  ;; We're not ready to shadow CL:VALUES just yet.
  ;; 
  (:shadow #:type #:count #:sequence)
  (:export 
   ;;
   ;; Globals
   ;;
   ;; #:*API-KEY* ; :NOTE why would/should *api-key* be exported???
   ;; #:*BASE-URL*
   #:etsy-environment
   #:set-etsy-environment))


;;; ==============================
;;; EOF
