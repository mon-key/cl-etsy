;;; :FILE-CREATED <Timestamp: #{2012-07-10T16:14:27-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-tag-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/tag')

---
API-METHODS

"findPopularTags"
"findAllRelatedTags"

---
:NOTE Regarding deprecation of the tags related methods
[ANNOUNCE] Deprecating findPopularTags and findAllRelatedTags - dated 2012/05/21 

1) In 2 days, Wed 23 May 2012, these 2 methods will become no-op
features. This means they will return empty results sets in all cases.

2) In a few weeks (no sooner than 2), we'll remove these 2 API methods
and documentation entirely. 

 (URL `https://groups.google.com/forum/?fromgroups#!searchin/etsy-api-v2/tags/etsy-api-v2/swh3xwnu4HM/LeADxQUE0JQJ')

----
 (closer-mop:class-finalized-p (find-class 'tag))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'tag)

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
