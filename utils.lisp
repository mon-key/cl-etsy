;;; :FILE-CREATED <Timestamp: #{2012-07-20T18:48:21-04:00Z}#{12295} - by MON>
;;; :FILE #P"cl-etsy/utils.lisp"
;;; ==============================

(in-package #:cl-etsy)

(deftype int ()
  'integer)

;; (and (typep "88" 'int-or-int-string) (null (typep "88.0" 'int-or-int-string )))
(deftype int-or-int-string ()
  '(or int (satisfies int-string-p)))

(defun int-to-int-string (int &optional stream)
  (declare (int int))
  (check-type int 'int)
  (if stream
      (princ int stream)
      (princ-to-string int)))

;; (and (int-string-p "88") (null (int-string-p "88.0")))
(defun int-string-p (maybe-int-string)
  (and (stringp maybe-int-string)
       (not (zerop (length maybe-int-string)))
       (every #'digit-char-p maybe-int-string)
       t))

(defun int-string-to-int (int-string)
  (assert (int-string-p int-string))
  (parse-integer int-string :radix 10))

;; (and (ensure-int "42") (ensure-int 42))
(defun ensure-int (int-or-int-string)
  (declare (int-or-int-string int-or-int-string))
  (if (typep int-or-int-string 'int) 
      int-or-int-string
      (int-string-to-int int-or-int-string)))

;;; ==============================
;;; EOF
