;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-favorite-user-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/favoriteuser')

----
API-ASSOCIATIONS

:association User
:visibility  public/private
:perm-scope  favorites_rw
:type        User
:description "The user who marked the target user as a favorite. 
              Note: This field may be absent, depending on the user's privacy settings."

:association TargetUser
:visibility  public
:perm-scope  none
:type        User
:description "The user who was marked as a favorite."


----
API-METHODS

"findAllUserFavoredBy"
"findAllUserFavoriteUsers"
"findUserFavoriteUsers"
"createUserFavoriteUsers"
"deleteUserFavoriteUsers"

|#

(in-package #:cl-etsy)

;; FavoriteUser
(defclass favorite-user (base-etsy)
  (;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility public/private
    ;; :perm-scope favorites_rw
    ;; :type int
    :documentation "The user's numeric ID.
Note: This field may be absent, depending on the user's privacy settings.")

   ;; favorite_user_id
   (favorite-user-id
    :initarg :favorite-user-id
    :accessor favorite-user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numberic ID of this favorite user association.
[DEPRECATED] Do not use.")

   ;; target_user_id
   (target-user-id
    :initarg :target-user-id
    :accessor target-user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The targeted favorite user's numeric ID.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The date and time that the user was favorited."))

  ;; (:default-initargs 
  ;;  :user-id nil :favorite-user-id nil :target-user-id nil :creation-tsz nil)

  (:documentation "Represents the association between a user and another user they've marked as favorite.
 (URL `http://www.etsy.com/developers/documentation/reference/favoriteuser')"))


;;; ==============================
;;; EOF
