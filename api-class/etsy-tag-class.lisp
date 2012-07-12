;;; :FILE-CREATED <Timestamp: #{2012-07-10T16:14:27-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-tag-class.lisp
;;; ==============================

#|

(URL `http://www.etsy.com/developers/documentation/reference/tag')

---
API-METHODS

"findPopularTags"
"findAllRelatedTags"

|#

(in-package #:cl-etsy)

;; Tag
(defclass tag (base-etsy)
 ((tag
   :initarg :tag
   :accessor tag
   ;; :visibility public
   ;; :perm-scope none
   ;; :type string
   :documentation "The tag's short name.")

  (name
   :initarg :name
   :accessor name
   ;; :visibility public
   ;; :perm-scope none
   ;; :type string
   :documentation "The tag's display name.")
  
  ;; num_listings
  (num-listings
   :initarg :num-listings
   :accessor num-listings
   ;; :visibility public
   ;; :perm-scope none
   ;; :type int
   :documentation "The number of listings tagged with this tag.")

  (weight
   :initarg :weight
   :accessor weight
   ;; :visibility public
   ;; :perm-scope none
   ;; :type int
   :documentation "Relative weight (0-100) of this tag compared to other tags in the current result set.")
  )
  ;; (:default-initargs :tag nil :name nil :num-listings nil :weight nil)
  (:documentation "A user-supplied term attached to a listing."))



#|

 ((:NAME        . "findPopularTags")
  (:DESCRIPTION . "DEPRECATED - Retrieves all related tags for the given tag set.")
  (:URI         . "/taxonomy/tags")
  (:PARAMS
   (:LIMIT . "int"))
  (:DEFAULTS
   (:LIMIT . 25))
  (:TYPE         . "Tag")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllRelatedTags")
  (:DESCRIPTION . "DEPRECATED - Retrieves all related tags for the given tag set.")
  (:URI         . "/taxonomy/tags/:tags")
  (:PARAMS
   (:TAGS  . "array(string)")
   (:LIMIT . "int"))
  (:DEFAULTS
   (:LIMIT . 25))
  (:TYPE         . "Tag")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
