;;; :FILE-CREATED <Timestamp: #{2012-07-10T17:27:59-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-feedback-info-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/feedbackinfo')

|#

(in-package #:cl-etsy)

;; FeedbackInfo
(defclass feedback-info (base-etsy)
  (;; :NOTE This symbol conflicts with CL:COUNT
   ;; Consider feedback-count or feedback-info-count instead???
   (count
    :initarg :count
    :accessor count
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of feedbacks.")

   (score
    :initarg :score
    :accessor score
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The feedback score percentage."))

  ;; (:default-initargs :count nil :score nil)

  (:documentation "An array representing the percentage of positive feedback this user has earned. 
This is returned in the feedback_info field of the User resource.
 (URL `http://www.etsy.com/developers/documentation/reference/feedbackinfo')"))



;;; ==============================
;;; EOF
