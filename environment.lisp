;;; :FILE-CREATED <Timestamp: #{2012-07-12T13:37:27-04:00Z}#{12284} - by MON>
;;; :FILE #P"cl-etsy/environment.lisp"
;;; ==============================

#|

|#

(in-package #:cl-etsy)

(deftype endpoint-type ()
  "The current Etsy API endpoint-type.
One of :production or :sandbox which correspond to the following URLs:
 :production - \"http://openapi.etsy.com/v2\"
 :sandbox    - \"http://sandbox.openapi.etsy.com/v2\"
:SEE-ALSO `*base-url*', `etsy-environment', `set-etsy-environment', `endpoint-type'."
  '(or (eql :production) (eql :sandbox)))

;; (etsy-environment)
(defun etsy-environment ()
  "Return the current environment ENDPOINT-TYPE as if by cl:values.
 - nth-value 0 is value of `*base-url*'.
 - nth-value 1 is either an `endpoint-type', either :production or :sandbox
An error is signaled if value of *base-url* is not `cl:stringp' or not `cl:string=' either
\"http://openapi.etsy.com/v2\" or \"http://sandbox.openapi.etsy.com/v2\"
:SEE-ALSO `set-etsy-environment', `endpoint-type', `*base-url*'."
  (unless (stringp *base-url*)
    (error ":FUNCTION `etsy-environment' -- value of *base-url* not `cl:stringp'~% got: ~S type-of: ~S"
           *base-url* (type-of *base-url*)))
  (cond ((string= *base-url* "http://openapi.etsy.com/v2")
         (values *base-url* :production))
        ((string= *base-url* "http://sandbox.openapi.etsy.com/v2")
         (values *base-url* :sandbox))
        (t 
         (error ":FUNCTION `etsy-environment' -- value of *base-url* not a valid endpoint got: ~S" *base-url*))))

(defun set-etsy-environment (&key (endpoint-type :production))
  "Set value of `*base-url*' to ENDPOINT-TYPE.
ENDPOINT-TYPE is either :sandbox or :production (the default).
When ENDPOINT-TYPE is :production the value of `*base-url*' is \"http://openapi.etsy.com/v2\".
When ENDPOINT-TYPE is :production the value of `*base-url*' is \"http://sandbox.openapi.etsy.com/v2\".
:EXAMPLE
 \(set-etsy-environment :endpoint-type :sandbox\)
 \(set-etsy-environment :endpoint-type :production\)
:SEE-ALSO `etsy-environment', `set-etsy-environment', `endpoint-type'."
  (declare (endpoint-type endpoint-type))
  (if (eql endpoint-type :production)
      (values (setf *base-url* "http://openapi.etsy.com/v2") :production)
      (values (setf *base-url* "http://sandbox.openapi.etsy.com/v2") :sandbox)))

;;; ==============================
;;; EOF
