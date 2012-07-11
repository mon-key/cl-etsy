;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-favorite-listing-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/favoritelisting')

----
API-ASSOCIATIONS

:association User
:visibility  public/private
:perm-scope  favorites_rw
:type        User
:description "The user who favorited the listing. Note: This field may be absent, depending on the user's privacy settings."

:association Listing
:visibility  public
:perm-scope  none
:type        Listing
:description "The favorited listing."

----
API-METHODS

"findAllListingFavoredBy"
"findAllUserFavoriteListings"
"findUserFavoriteListings"
"createUserFavoriteListings"
"deleteUserFavoriteListings"


|#

(in-package #:cl-etsy)

;; FavoriteListing
(defclass favorite-listing (base-etsy)
  (;; listing_id
   (listing-id
    :initarg :listing-id
    :accessor listing-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The listings numeric ID.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility public/private
    ;; :perm-scope favorites_rw
    ;; :type int
    :documentation "The user's numeric ID.
Note: This field may be absent, depending on the user's privacy settings.")

   ;; listing_state
   (listing-state
    :initarg :listing-state
    :accessor listing-state
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The state of the listing.")

   ;; create_date
   (create-date
    :initarg :create-date
    :accessor create-date
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The date and time that the listing was favorited.")

   (state
    :initarg :state
    :accessor state
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The state of the listing.
[DEPRECATED] Use 'listing_state'.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The date and time that the listing was favorited.
[DEPRECATED] Use 'create_date'.")

   ;; favorite_listing_id
   (favorite-listing-id
    :initarg :favorite-listing-id
    :accessor favorite-listing-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of this favorite listing association.
[DEPRECATED] do not use."))
  ;; (:default-initargs 
  ;;  :listing-id nil :user-id nil :listing-state nil :create-date nil 
  ;;  :state nil :creation-tsz nil :favorite-listing-id nil)
  (:documentation "Represents the association between a user and a listing they've marked as favorite.
 (URL `http://www.etsy.com/developers/documentation/reference/favoritelisting')"))

;;; ==============================
;;; EOF
