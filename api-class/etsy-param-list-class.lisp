;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:46:22-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-param-list-class.lisp
;;; ==============================

;; (URL `http://www.etsy.com/developers/documentation/reference/paramlist')
;; This is an associative array (an alist) that maps parameter names to types. 
;; It has a varying number of fields with differing names.

(in-package #:cl-etsy)

(def-api-class param-list ()
  (;param_name
   (param-name
    :type string
    :doc "Each field in the record represents an Etsy API method parameter. 
          The value corresponds to one of the documented data or resource types.")
   ))

;; (defmethod print-object ((x param-list) stream)
;;   (dumb-printing stream x "~~A" param-name))

;;; ==============================
;;; EOF
