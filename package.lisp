
;; (cl:in-package #:common-lisp-user)

(defpackage #:cl-etsy
  (:use #:common-lisp)
  (:nicknames #:etsy) ; :etc (find-package "ETC")
  (:documentation "A bridge from Common Lisp to v2 API of Etsy.com.")
  ;; 
  ;; three classes have reader/writer methods which conflict with the symbol-name CL:TYPE
  ;; bill-charge bill-payment data-type
  ;; Possible variant symbol-name(s) to use instead:
  ;; bill-charge  - charge-type bill-charge-type
  ;; bill-payment - payment-type bill-payment-type
  ;; data-type    - data-type-type
  ;;
  ;; one class has reader/writer methods with the symbol-name CL:COUNT
  ;; feedback-info
  ;; Possible variant symbol-name(s) to use instead:
  ;; feedback-info - feedback-count feedback-info-count
  ;;
  ;; :NOTE The class data-type originally specified reader/writer methods with the symbol-name VALUES
  ;; We're not ready to shadow CL:VALUES just yet.
  (:shadow #:type #:count)
  (:export 
   ;;
   ;; Globals
   ;;
   ;; #:*API-KEY* ; :NOTE why would/should *api-key* be exported???
   ;; #:*BASE-URL*
   #:etsy-environment
   #:set-etsy-environment))



