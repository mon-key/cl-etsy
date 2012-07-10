;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:46:22-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-param-list-class.lisp
;;; ==============================


;; (URL `http://www.etsy.com/developers/documentation/reference/paramlist')
;; This is an associative array (an alist) that maps parameter names to types. 
;; It has a varying number of fields with differing names.

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
Each field in the record represents an Etsy API method parameter. 
The value corresponds to one of the documented data or resource types. 
 (URL `http://www.etsy.com/developers/documentation/reference/paramlist')"))

;; (defmethod print-object ((x param-list) stream)
;;   (dumb-printing stream x "~~A" param-name))

;;; ==============================
;;; EOF
