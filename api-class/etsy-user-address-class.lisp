;;; :FILE-CREATED <Timestamp: #{2012-07-10T15:50:43-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-user-address-class.lisp
;;; ==============================

#|

(URL `http://www.etsy.com/developers/documentation/reference/useraddress')

---
API-ASSOCIATIONS

Country
:visibility private
:perm-scope address_r
:type country
The full Country record for the user's address.

User
:visibility private
:perm-scope address_r
:type user
The full User record whom entered this address.

---
API-METHODS

"findAllUserAddresses"
"createUserAddress"
"getUserAddress"
"deleteUserAddress"

|#

(in-package #:cl-etsy)

;; UserAddress

(defclass user-address (base-etsy)
  (
   ;; user_address_id
   (user-address-id
    :initarg :user-address-id
    :accessor user-address-id
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type int
    :documentation "The numeric ID of the user's address.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type int
    :documentation "The user's numeric ID.")

   (name
    :initarg :name
    :accessor name
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type text
    :documentation "The user's name for this address.")

   ;; first_line
   (first-line
    :initarg :first-line
    :accessor first-line
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type text
    :documentation "The first line of the user's address.")

   ;; second_line
   (second-line
    :initarg :second-line
    :accessor second-line
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type text
    :documentation "The second line of the user's address.")

   (city
    :initarg :city
    :accessor city
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type text
    :documentation "The city field of the user's address.")

   (state
    :initarg :state
    :accessor state
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type text
    :documentation "The state field of the user's address.")

   (zip
    :initarg :zip
    :accessor zip
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type text
    :documentation "The zip code field of the user's address.")

   ;; country_id
   (country-id
    :initarg :country-id
    :accessor country-id
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type int
    :documentation "The country's numeric ID.")

   ;; country_name
   (country-name
    :initarg :country-name
    :accessor country-name
    ;; :visibility private
    ;; :perm-scope address_r
    ;; :type string
    :documentation "The name of the user's country"))

  (:documentation "Represents a user's address.")
  ;; (:default-initargs 
  ;;  :user-address-id nil :user-id nil :name nil :first-line nil :second-line nil
  ;;   :city nil :state nil :zip nil :country-id nil :country-name nil)
  )


;;; ==============================
;;; EOF
