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


Associations

Country
visibility-level: public
permission-scope: none
type:             Country
description:      The country in which the user lives. 

|#

(in-package #:cl-etsy)


(defclass user-profile (base-etsy)
  (
   ;; user_profile_id   
   (user-profile-id
    :initarg :user-profile-id
    ;; :initform nil
    :accessor user-profile-id
    ;; :type int
    :documentation "The numeric ID of the user profile. [DEPRECATED] Do not use")

   ;; user_id
   (user-id
    :initarg :user-id
    ;; :initform nil
    :accessor user-id
    ;; :type int
    :documentation "The numeric ID of the user this profile corresponds to.")

   ;; login_name
   (login-name
    :initarg :login-name
    ;; :initform nil
    :accessor login-name
    ;; :type string
    :documentation "The login name of the user that owns this profile.")

   (bio
    :initarg :bio
    ;; :initform nil
    :accessor bio
    ;; :type string
    :documentation "The bio of the user.")
   
   (gender
    :initarg :gender
    ;; :initform nil
    :accessor gender
    ;; :type string
    :documentation "The gender of the user.")

   ;; birth-month
   (birth-month
    :initarg :birth-month
    ;; :initform nil
    :accessor birth-month
    ;; :type string
    :documentation "The birth month of the user.")

   ;; birth_day
   (birth-day
    :initarg :birth-day
    ;; :initform nil
    :accessor birth-day
    ;; :type string
    :documentation "The birth day of the user.")

   ;; birth_year private profile_r
   (birth-year
    :initarg :birth-year
    ;; :initform nil
    :accessor birth-year
    ;; :type string
    :documentation "The birth year of the user.")

   ;; join_tsz
   (join-tsz
    :initarg :join-tsz
    ;; :initform nil
    :accessor join-tsz
    ;; type float
    :documentation "The date and time the user was created, in epoch seconds.")

   (materials
    :initarg :materials
    ;; :initform nil
    :accessor materials
    ;; :type string
    :documentation "A list of the user's favorite materials.")

   ;; country_id
   (country-id
    :initarg :country-id
    ;; :initform nil
    :accessor country-id
    ;; :type int
    :documentation "The numeric ID of the user's country.")

   (region
    :initarg :region
    ;; :initform nil
    :accessor region
    ;; :type string
    :documentation "The user's region (free-form text)")

   (city
    :initarg :city
    ;; :initform nil
    :accessor city
    ;; :type string
    :documentation "The user's city (free-form text)")

   (location
    :initarg :location
    ;; :initform nil
    :accessor location
    ;; :type string
    :documentation "[DEPRECATED] The user's location (self-supplied, free-form text).")

   ;; avatar_id
   (avatar-id
    :initarg :avatar-id
    ;; :initform nil
    :accessor avatar-id
    ;; :type int
    :documentation "The numeric ID of this user's avatar image.")
   
   ;; private profile_r
   (lat 
    :initarg :lat
    ;; :initform nil
    :accessor lat
    ;; :type float
    :documentation "The latitude of the user.")

   ;; private profile_r
   (lon
    :initarg :lon
    ;; :initform nil
    :accessor lon
    ;; :type float
    :documentation "The longitude of the user.")

   ;; transaction_buy_count
   (transaction-buy-count
    :initarg :transaction-buy-count
    ;; :initform nil
    :accessor transaction-buy-count
    ;; :type int
    :documentation "The number of bought items for this user.")

   ;; transaction_sold_count
   (transaction-sold-count
    :initarg :transaction-sold-count
    ;; :initform nil
    :accessor transaction-sold-count
    ;; :type int
    :documentation "The number of sold transactions for this user.")

   ;; is_seller
   (is-seller
    :initarg :is-seller
    ;; :initform nil
    :accessor is-seller
    ;; :type boolean
    :documentation "If the user is a seller or not. Value true if user is a seller.")

   ;; image_url_75x75
   (image-url-75x75
    :initarg :image-url-75x75
    ;; :initform nil
    :accessor image-url-75x75
    ;; :type string
    :documentation "The URL to the user's avatar image; dimensions 75px square.")

   ;; first_name
   (first-name
    :initarg :first-name
    ;; :initform nil
    :accessor first-name
    ;; :type string
    :documentation "The first name of the user. May be the empty string.")

   ;; last_name
   (last-name
    :initarg :last-name
    ;; :initform nil
    :accessor last-name
    ;; :type string
    :documentation "The last name of the user. May be the empty string."))

  (:documentation
   "Represents a user's public profile. 
Generally, this is the information available for a member as \"Public Profile\" on Etsy.com"))


;;; ==============================
;;; EOF
