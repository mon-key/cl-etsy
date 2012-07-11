;;; :FILE-CREATED <Timestamp: #{2012-07-10T21:10:25-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-epoch.lisp
;;; ==============================

(in-package #:cl-etsy)

;; :SOURCE Ben Hyde's egleis/base.lisp :WAS `etsy-epoch->text'
(defun epoch-to-timestring (value)
  (setf value (round value))
  (incf value 2209006800) ;; convert to universal time
  (multiple-value-bind (second minute hour date month year)
      (decode-universal-time value)
    (format nil "~D/~D/~D ~D:~D:~D" month date year hour minute second)))

;;; ==============================
;;; EOF
