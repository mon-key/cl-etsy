;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-region-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/region')

----
API-METHODS

"findAllRegion"
"getRegion"

----
 (closer-mop:class-finalized-p (find-class 'region))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'region)

|#

(in-package #:cl-etsy)

;; Region
(defclass region (base-etsy)
  (;; region_id
   (region-id
    :initarg :region-id
    :accessor region-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of this region.")

   ;; region_name
   (region-name
    :initarg :region-name
    :accessor region-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The name of the region."))
 
  ;; (:default-initargs 
  ;;  :region-id nil :region-name nil)
 
  (:documentation "Represents a collection of countries to which an item ships.
 (URL `http://www.etsy.com/developers/documentation/reference/region')"))

#|

 ((:NAME        . "findAllRegion")
   (:DESCRIPTION . "Finds all Region.")
   (:URI         . "/regions")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "Region")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))
     
  ((:NAME        . "getRegion")
   (:DESCRIPTION . "Retrieves a Region by id.")
   (:URI         . "/regions/:region_id")
   (:PARAMS
    (:REGION-ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Region")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
