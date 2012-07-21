;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:46:22-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-param-list-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/paramlist')

AFAICT the only resource that has a fields of type param-name are the params and defaults slots of class `api-method'.

 params   - An array of method parameters and types.
 defaults - An array of default values for parameters. Parameters that lack a default are required.
 
We should probably move this further up the class lattice.

|#

(in-package #:cl-etsy)

;; ParamList
(defclass param-list (base-etsy)
  (;; param_name
   (param-name
    :initarg :param-name
    :accessor param-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Each field in the record represents an Etsy API method parameter.
The value corresponds to one of the documented data or resource types."))

  ;; (:default-initargs :param-name nil)

  (:documentation "
This is an associative array (an alist, plist, or hash-table) that maps parameter names to types. 
It has a varying number of fields with differing names.
 (URL `http://www.etsy.com/developers/documentation/reference/paramlist')"))


;;; ==============================
;;; EOF
