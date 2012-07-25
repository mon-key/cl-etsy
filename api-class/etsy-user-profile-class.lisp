;;; :FILE-CREATED <Timestamp: #{2012-07-10T15:17:10-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-user-profile-class.lisp
;;; ==============================

#|
 (URL `http://www.etsy.com/developers/documentation/reference/userprofile')

Deprecated Fields

As of March 28, 2011, the "User" and "Shops" associations of UserProfile no
longer exist in the API. Instead, query the User resource directly, using the
Etsy member's login name, and/or use the Shops association of User.
:SEE (URL `http://www.etsy.com/developers/documentation/reference/userprofile#section_deprecated_fields')

----
:ASSOCIATIONS

Country
visibility-level: public
permission-scope: none
type:             Country
description:      The country in which the user lives. 

----
 (closer-mop:class-finalized-p (find-class 'user-profile))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'user-profile)

|#

(in-package #:cl-etsy)


(defclass user-profile (base-etsy)
  (;; user_profile_id
   (user-profile-id
    :initarg :user-profile-id
    :accessor user-profile-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the user profile.
[DEPRECATED] Do not use.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the user this profile corresponds to.")

   ;; login_name
   (login-name
    :initarg :login-name
    :accessor login-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The login name of the user that owns this profile.")

   ;; bio
   (bio
    :initarg :bio
    :accessor bio
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The bio of the user.")

   ;; gender
   (gender
    :initarg :gender
    :accessor gender
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The gender of the user.")

   ;; birth_month
   (birth-month
    :initarg :birth-month
    :accessor birth-month
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The birth month of the user.")

   ;; birth_day
   (birth-day
    :initarg :birth-day
    :accessor birth-day
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The birth day of the user.")

   ;; birth_year
   (birth-year
    :initarg :birth-year
    :accessor birth-year
    ;; :visibility private
    ;; :perm-scope profile_r
    ;; :type string
    :documentation "The birth year of the user.")

   ;; join_tsz
   (join-tsz
    :initarg :join-tsz
    :accessor join-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The date and time the user was created, in epoch seconds.")

   ;; materials
   (materials
    :initarg :materials
    :accessor materials
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A list of the user's favorite materials.")

   ;; country_id
   (country-id
    :initarg :country-id
    :accessor country-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the user's country.")

   ;; region
   (region
    :initarg :region
    :accessor region
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The user's region (free-form text).")

   ;; city
   (city
    :initarg :city
    :accessor city
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The user's city (free-form text).")

   ;; location
   (location
    :initarg :location
    :accessor location
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "[DEPRECATED] The user's location (self-supplied, free-form text).")

   ;; avatar_id
   (avatar-id
    :initarg :avatar-id
    :accessor avatar-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of this user's avatar image.")

   ;; lat
   (lat
    :initarg :lat
    :accessor lat
    ;; :visibility private
    ;; :perm-scope profile_r
    ;; :type float
    :documentation "The latitude of the user.")

   ;; lon
   (lon
    :initarg :lon
    :accessor lon
    ;; :visibility private
    ;; :perm-scope profile_r
    ;; :type float
    :documentation "The longitude of the user.")

   ;; transaction_buy_count
   (transaction-buy-count
    :initarg :transaction-buy-count
    :accessor transaction-buy-count
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of bought items for this user.")

   ;; transaction_sold_count
   (transaction-sold-count
    :initarg :transaction-sold-count
    :accessor transaction-sold-count
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of sold transactions for this user.")

   ;; is_seller
   (is-seller
    :initarg :is-seller
    :accessor is-seller
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "If the user is a seller or not. Value true if user is a seller.")

   ;; image_url_75x75
   (image-url-75x75
    :initarg :image-url-75x75
    :accessor image-url-75x75
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The URL to the user's avatar image; dimensions 75px square.")

   ;; first_name
   (first-name
    :initarg :first-name
    :accessor first-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The first name of the user.")

   ;; last_name
   (last-name
    :initarg :last-name
    :accessor last-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The last name of the user."))

  ;; (:default-initargs 
  ;;  :user-profile-id nil :user-id nil :login-name nil :bio nil :gender nil
  ;;  :birth-month nil :birth-day nil :birth-year nil :join-tsz nil :materials nil
  ;;  :country-id nil :region nil :city nil :location nil :avatar-id nil :lat nil
  ;;  :lon nil :transaction-buy-count nil :transaction-sold-count nil :is-seller nil
  ;;  :image-url-75x75 nil :first-name nil :last-name nil)

  (:documentation
   "Represents a user's public profile. 
Generally, this is the information available for a member as \"Public Profile\" on Etsy.com"))


;;; ==============================
;;; EOF
