;;; :FILE-CREATED <Timestamp: #{2012-07-10T16:35:46-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-treasury-counts-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/treasurycounts')

----
 (closer-mop:class-finalized-p (find-class 'treasury-counts))
 (api-class-slot-names-as-underscored-strings 'treasury-counts)

|#

(in-package #:cl-etsy)

;; TreasuryCounts
(defclass treasury-counts (base-etsy)
  ((clicks
    :initarg :clicks
    :accessor clicks
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of times the Treasury has been clicked on.")

   (views
    :initarg :views
    :accessor views
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of times the Treasury has been viewed.")

   (shares
    :initarg :shares
    :accessor shares
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of times the Treasury has been shared.")

   (reports
    :initarg :reports
    :accessor reports
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of times the Treasury has been reported."))
  
  ;; (:default-initargs :clicks nil :views nil :shares nil :reports nil)

  (:documentation "Various metrics on the Treasury"))



;;; ==============================
;;; EOF
