
;; (cl:in-package #:common-lisp-user)

(cl:defpackage #:cl-etsy
  ;; (:nicknames "ETSY" "etsy" "CL-ESTY")
  (:nicknames :etsy)
  (:documentation "A bridge from common lisp to v2 API of etsy.com.")
  (:use #:common-lisp)
  (:export 
   ;;
   ;; Globals
   ;;
   ;; #:*API-KEY* ; :NOTE why would/should *api-key* be exported???
   ;; #:*BASE-URL*
   ))

