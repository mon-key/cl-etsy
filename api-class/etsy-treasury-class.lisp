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

----
 (closer-mop:class-finalized-p (find-class 'treasury))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'treasury)

|#

(in-package #:cl-etsy)

;; Treasury
(defclass treasury (base-etsy)
  (;; Really, `id'? WTF kinda symbol is that?
   (id
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
    :documentation "The listings that are in this collection.
Each non-null value of listings is repreasentative of a `treasury-listing'.
Each `treasury-listing' contains data field which is representative of atomic `treasury-listing-data'.
An alist representation of the general form of listings is as follows:
 (:listings ((:creation-tsz . <CREATION-TSZ>)
             (:data
              (:user-id    . <USER-ID>)
              (:title      . <TITLE>)
              (:price      . <PRICE>)
              (:listing-id . <LISTING-ID>)
              (:state      . <STATE>)
              (:shop-name  . <SHOP-NAME>)
              (:image-id   . <IMAGE-ID>))
             ...))")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int ;; :NOTE all other classes other than Treasury and TreasuryListing have this as float
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
 (URL `http://www.etsy.com/developers/documentation/reference/treasury')"))


#|


 | treasury_search_string
 | "In the general case, this can be any string. However, there are four special
 | prefixes that can be used.
 |  shop:    will look for lists where one of the shop's listings is included.
 |  curator: will find all the lists created by the person specified.
 |  title:  will find lists with a specific title. 
 |  tags:, listing_title:, listing_tags: follow the same pattern.
 | Because the colon ":" is used as a special character to separate the special
 | prefixes, you may only have 1 colon in your search string, and the text that
 | comes before the colon must match one of the prefixes stated above."
 | (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_parameter_types')

 ((:NAME        . "findAllTreasuries")
  (:DESCRIPTION . "Search Treasuries or else List all Treasuries")
  (:URI         . "/treasuries")
  (:PARAMS
   (:KEYWORDS    . "treasury_search_string")
   (:SORT-ON    . "enum(hotness, created)")
   (:SORT-ORDER . "enum(up, down)")
   (:LIMIT       . "int")
   (:OFFSET      . "int")
   (:PAGE        . "int"))
  (:DEFAULTS
   (:KEYWORDS)
   (:SORT-ON    . "hotness")
   (:SORT-ORDER . "down")
   (:LIMIT       . 25)
   (:OFFSET      . 0)
   (:PAGE))
  (:TYPE         . "Treasury")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "createTreasury")
  (:DESCRIPTION . "Create a Treasury")
  (:URI         . "/treasuries")
  (:PARAMS
   (:TITLE        . "treasury_title")
   (:DESCRIPTION  . "treasury_description")
   (:LISTING-IDS . "array(int)")
   (:TAGS         . "array(string)")
   (:PRIVATE      . "boolean"))
  (:DEFAULTS 
   (:TAGS    . "")
   (:PRIVATE . 0))
  (:TYPE         . "Treasury")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "POST"))

 ((:NAME        . "getTreasury")
  (:DESCRIPTION . "Get a Treasury")
  (:URI         . "/treasuries/:treasury_key")
  (:PARAMS
   (:TREASURY-KEY . "treasury_id"))
  (:DEFAULTS)
  (:TYPE         . "Treasury")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "deleteTreasury")
  (:DESCRIPTION . "Delete a Treasury")
  (:URI         . "/treasuries/:treasury_key")
  (:PARAMS)
  (:DEFAULTS)
  (:TYPE         . "Treasury")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "DELETE"))

 ((:NAME        . "findAllUserTreasuries")
  (:DESCRIPTION . "Get a user's Treasuries")
  (:URI         . "/users/:user_id/treasuries")
  (:PARAMS
   (:USER-ID    . "user_id_or_name")
   (:SORT-ON    . "enum(hotness, created)")
   (:SORT-ORDER . "enum(up, down)")
   (:LIMIT       . "int")
   (:OFFSET      . "int")
   (:PAGE        . "int"))
  (:DEFAULTS
   (:SORT-ON    . "hotness")
   (:SORT-ORDER . "down")
   (:LIMIT       . 25)
   (:OFFSET      . 0)
   (:PAGE))
  (:TYPE         . "Treasury")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
