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
    (format nil "~D/~D/~D ~D:~D:~D" year month date  hour minute second)))

;; (epoch-to-timestring 1342731989)

#|

  | "getServerEpoch"
  | (yason:parse (api-call (concatenate 'string *base-url* "/server/epoch")) :object-as :alist)
  | => (("pagination") ("type" . "Int") ("params") ("results" 1342731989) ("count" . 1))

   ((:NAME        . "getServerEpoch")
    (:DESCRIPTION . "Get server time, in epoch seconds notation.")
    (:URI         . "/server/epoch")
    (:PARAMS)
    (:DEFAULTS)
    (:TYPE         . "Int")
    (:VISIBILITY   . "public")
    (:HTTP-METHOD  . "GET"))

  | "ping"
  | (yason:parse (api-call (concatenate 'string *base-url* "/server/ping")) :object-as :alist)
  | => (("pagination") ("type" . "String") ("params") ("results" "pong") ("count" . 1))

  ((:NAME        . "ping")
   (:DESCRIPTION . "Check that the server is alive.")
   (:URI         . "/server/ping")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "String")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD  . "GET"))


;;; ==============================
;;; EOF
