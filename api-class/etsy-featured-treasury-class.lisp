;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-featured-treasury-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/featuredtreasury')

----
API-METHODS

"findAllFeaturedTreasuries"
"getFeaturedTreasuryById"
"findAllFeaturedTreasuriesByOwner"

----
 (closer-mop:class-finalized-p (find-class 'featured-treasury))
 (api-class-slot-names-as-underscored-strings 'featured-treasury)

|#

(in-package #:cl-etsy)

;; FeaturedTreasury
(defclass featured-treasury (base-etsy)
  (;; treasury_id
   (treasury-id
    :initarg :treasury-id
    :accessor treasury-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID for this FeaturedTreasury.")

   ;; treasury_owner_id
   (treasury-owner-id
    :initarg :treasury-owner-id
    :accessor treasury-owner-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The user ID of the FeaturedTreasury owner.")

   (url
    :initarg :url
    :accessor url
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The url to the FeaturedTreasury.")

   (region
    :initarg :region
    :accessor region
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The region for which this FeaturedTreasury is active.")

   ;; active_date
   (active-date
    :initarg :active-date
    :accessor active-date
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The time this FeaturedTreasury is made active on the homepage."))

  ;; (:default-initargs 
  ;;  :treasury-id nil :treasury-owner-id nil :url nil :region nil :active-date nil)
  (:documentation "Represents a Treasury list featured on Etsy homepage.
 (URL `http://www.etsy.com/developers/documentation/reference/featuredtreasury')"))

#|

 ((:NAME        . "findAllFeaturedTreasuries")
  (:DESCRIPTION . "Finds all FeaturedTreasuries.")
  (:URI         . "/featured_treasuries")
  (:PARAMS
   (:LIMIT  . "int")
   (:OFFSET . "int")
   (:PAGE   . "int")
   (:REGION . "region"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE)
   (:REGION . "__ALL_REGIONS__"))
  (:TYPE         . "FeaturedTreasury")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

  ((:NAME        . "getFeaturedTreasuryById")
   (:DESCRIPTION . "Finds FeaturedTreasury by numeric ID.")
   (:URI         . "/featured_treasuries/:featured_treasury_id")
   (:PARAMS
    (:FEATURED-TREASURY-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "FeaturedTreasury")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllFeaturedTreasuriesByOwner")
  (:DESCRIPTION . "Finds all FeaturedTreasury by numeric owner_id.")
  (:URI         . "/featured_treasuries/owner/:owner_id")
  (:PARAMS
   (:LIMIT     . "int")
   (:OFFSET    . "int")
   (:PAGE      . "int")
   (:OWNER-ID . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "FeaturedTreasury")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

|#

;;; ==============================
;;; EOF
