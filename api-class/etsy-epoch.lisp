;;; :FILE-CREATED <Timestamp: #{2012-07-10T21:10:25-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-epoch.lisp
;;; ==============================

(in-package #:cl-etsy)

;; :SOURCE Ben Hyde's egleis/base.lisp :WAS `etsy-epoch->text'
(defun epoch-to-timestring (value)
  "
:EXAMPLE
 (epoch-to-timestring 1342731989)"
  (setf value (round value))
  (incf value 2209006800) ;; convert to universal time
  (multiple-value-bind (second minute hour date month year)
      (decode-universal-time value)
    (format nil "~D/~D/~D ~D:~D:~D" year month date  hour minute second)))


;; (epoch-to-timestring (cadr (assoc "results" (get-server-epoch) :test #'equal)))
(defun get-server-epoch (&key (object-key-fn #'api-string/symbol-lookup)
                              (object-as :alist)
                              (return-values t))
  "
:EXAMPLE 
 (get-server-epoch)
 (get-server-epoch :return-values nil)
:API-METHOD \"getServerEpoch\""
  (declare (api-request-parse-object-as object-as)
           (boolean return-values))
  (parsed-api-call (concatenate 'string *base-url* "/server/epoch") 
                   :object-as object-as
                   :object-key-fn object-key-fn
                   :return-values return-values))

(defun ping (&key (object-key-fn #'api-string/symbol-lookup)
                  (object-as :alist)
                  (return-values t))
  "
:EXAMPLE 
 (ping)
 (ping :return-values nil)
:API-METHOD \"ping\""
  (declare (api-request-parse-object-as object-as)
           (boolean return-values))
  ;; (yason:parse (api-call (concatenate 'string *base-url* "/server/ping")) :object-as :alist))
  (parsed-api-call (concatenate 'string *base-url* "/server/ping")
                   :object-as object-as
                   :object-key-fn object-key-fn
                   :return-values return-values))

#|

   ((:NAME        . "getServerEpoch")
    (:DESCRIPTION . "Get server time, in epoch seconds notation.")
    (:URI         . "/server/epoch")
    (:PARAMS)
    (:DEFAULTS)
    (:TYPE         . "Int")
    (:VISIBILITY   . "public")
    (:HTTP-METHOD  . "GET"))

   ((:NAME        . "ping")
    (:DESCRIPTION . "Check that the server is alive.")
    (:URI         . "/server/ping")
    (:PARAMS)
    (:DEFAULTS)
    (:TYPE         . "String")
    (:VISIBILITY   . "public")
    (:HTTP-METHOD  . "GET"))

|#

;;; ==============================
;;; EOF
