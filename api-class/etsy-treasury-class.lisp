;;; :FILE-CREATED <Timestamp: #{2012-07-10T16:40:12-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-treasury-class.lisp
;;; ==============================


#|

 (URL `http://www.etsy.com/developers/documentation/reference/treasury')

---
 API-METHODS
"findAllTreasuries"
"createTreasury"
"getTreasury"      
"deleteTreasury"
"findAllUserTreasuries"

|#

(in-package #:cl-etsy)

;; Treasury
(defclass treasury (base-etsy)
  ((id
    :initarg :id
    :accessor id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Unique id of the collection.")

   (title
    :initarg :title
    :accessor title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Title of the collection.")

   (description
    :initarg :description
    :accessor description
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Description of the collection.")
     
   (homepage
    :initarg :homepage
    :accessor homepage
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "If the Treasury was featured on the homepage, the time in seconds since the epoch that it was featured.")
     
   (mature
    :initarg :mature
    :accessor mature
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "Whether the Treasury has been flagged mature or not.")

   (locale
    :initarg :locale
    :accessor locale
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Language/Locale of the collection.")

   ;; comment_count
   (comment-count
    :initarg :comment-count
    :accessor comment-count
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of comments on this Treasury.")

   (tags
    :initarg :tags
    :accessor tags
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(string)
    :documentation "The tags associated with this Treasury.")

   (counts
    :initarg :counts
    :accessor counts
    ;; :visibility public
    ;; :perm-scope none
    ;; :type TreasuryCounts
    :documentation "Clicks, views, shares, and reports metrics of this collection.")
     
   (hotness
    :initarg :hotness
    :accessor hotness
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The algorithmic ranking value assigned to this collection.")

   ;; hotness_color
   (hotness-color
    :initarg :hotness-color
    :accessor hotness-color
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The algorithmic ranking value shown as a color (color hexadecimal).")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "ID of the user (curator) of the collection.")

   ;; user_name
   (user-name
    :initarg :user-name
    :accessor user-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Name of the user (curator) of the collection.")

   ;; user_avatar_id
   (user-avatar-id
    :initarg :user-avatar-id
    :accessor user-avatar-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "ID of the user's (curator's) avatar.")

   (listings
    :initarg :listings
    :accessor listings
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(TreasuryListing)
    :documentation "The listings that are in this collection.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Time this collection was created, in epoch seconds."))
  ;; (:default-initargs :id nil :title nil :description nil :homepage nil :mature nil
  ;; :locale nil :comment-count nil :tags nil :counts nil :hotness nil
  ;; :hotness-color nil :user-id nil :user-name nil :user-avatar-id nil
  ;; :listings nil :creation-tsz nil)
  (:documentation 
   "The Treasury is an ever-changing, member-curated shopping gallery comprised of lists of items.
The Etsy API allows you to retrieve, create, edit, and delete treasury lists.
When retrieving multiple lists with findAllTreasuries method, you are limited to
the 25,000 sortable hottest lists in the Treasury at that time.
If you need to retrieve a specific list, be sure to use the getTreasury method
with the corresponding treasury key.
 (URL `http://www.etsy.com/developers/documentation/reference/treasury')
"))




;;; ==============================
;;; EOF