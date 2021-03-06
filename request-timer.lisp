;;; :FILE-CREATED <Timestamp: #{2012-07-12T17:33:39-04:00Z}#{12284} - by MON>
;;; :FILE cl-etsy/request-timer.lisp
;;; ==============================

;; :NOTE From Ben Hyde's cl-etsy/base.lisp for the Etsy v1 API

(in-package #:cl-etsy)

;;;; Interval Timers

(defclass timer ()
  ((start-time
    :initform 0)
   (first-index
    :initform 0)
   (last-index
    :initform 0)
   (max
    :initform 100)
   (samples
    :initform (make-array 100))))

(defmethod clear-timer ((timer timer))
  (with-slots (first-index last-index) timer
    (setf first-index 0)
    (setf last-index 0)))

(defmethod map-over-timer-samples ((timer timer) lambda)
  (with-slots (start-time first-index last-index max samples) timer
    (cond
      ((<= first-index last-index)
       (loop
          for i from first-index below last-index
          do (funcall lambda (svref samples i))))
      (t
       (loop
          for i from first-index below max
          do (funcall lambda (svref samples i)))
       (loop
          for i from 0 below last-index
          do (funcall lambda (svref samples i)))))))

(defmacro do-timer-samples ((var timer) &body body)
  `(map-over-timer-samples ,timer #'(lambda (,var) ,@body)))

(defmethod timer-stats  ((timer timer))
  (let ((cnt 0) min max (sum 0.0) (first? t))
    (do-timer-samples (x timer)
      (when first?
        (setf first? nil)
        (setf min x)
        (setf max x))
      (incf cnt)
      (incf sum x)
      (setf min (min min x))
      (setf max (max max x)))
    ;; (let ((d (* 1.0 cl:internal-time-units-per-second)))
    (let ((d (* 1.0 INTERNAL-TIME-UNITS-PER-SECOND)))
      (values cnt (/ min d) (/ max d) (/ (/ sum d) cnt)))))
   
(defmethod begin-timer ((timer timer))
  (with-slots (start-time) timer
    (setf start-time (get-internal-real-time))))

(defmethod end-timer ((timer timer))
  (with-slots (start-time first-index last-index max samples) timer
    (macrolet ((inc-index (index)
                 `(progn
                    (incf ,index)
                    (when (<= max ,index)
                      (setf ,index 0)))))
      (inc-index last-index)
      (when (= first-index last-index)
        (inc-index first-index)))
    (setf (svref samples last-index) (- (get-internal-real-time) start-time))))


(defmacro with-interval-timer ((timer-var) &body body)
  `(let ((#1=#:timer-var ,timer-var))
     (begin-timer #1#)
     (unwind-protect
          (progn ,@body)
       (end-timer #1#))))

(defvar *etsy-api-request-timer* (make-instance 'timer))


;;; ==============================
;;; EOF
