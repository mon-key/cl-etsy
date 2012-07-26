;;; :FILE-CREATED <Timestamp: #{2012-07-20T18:48:21-04:00Z}#{12295} - by MON>
;;; :FILE #P"cl-etsy/utils.lisp"
;;; ==============================

#|

|#

(in-package #:cl-etsy)

(defmacro with-drakma-drakma-header-stream (header-io-stream &body body)
  "Evaluate BODY with dynamic value of `drakma:*header-stream*' bound to HEADER-IO-STREAM.
Value of HEADER-IO-STREAM is as per `drakma:*header-stream*'.
EXAMPLE
 \(macroexpand-1
  '\(with-drakma-drakma-header-stream *standard-output*
    \(parsed-api-call \(concatenate 'string *base-url* \"/countries\"\) :object-as :alist \)\)\)"
  `(let ((drakma:*header-stream* ,header-io-stream))
     ,@body))


;;; ==============================
;;; EOF
