;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:36:30-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-feedback-info-class.lisp
;;; ==============================

;; (URL `http://www.etsy.com/developers/documentation/reference/feedbackinfo')

;; An array representing the percentage of positive feedback this user has earned. 
;; This is returned in the feedback_info field of the User resource.
;; feedback-info slot user class.

;; before etsy-user-class

(in-package #:cl-etsy)

;; these should subclass something like base-etsy-data-container
(def-api-class feedback ()
  ((count
   :type int
   :doc "The number of feedbacks.")

   (score
    :type int
    :doc "The feedback score percentage.")
   ))

(defmethod print-object ((x feedback) stream)
  (dumb-printing stream x "~D: ~A" user-id login-name))

;;; ==============================
;;; EOF
