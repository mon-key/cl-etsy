;;; :FILE-CREATED <Timestamp: #{2012-07-10T11:47:33-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-user-class.lisp
;;; ==============================


#|

 (URL `http://www.etsy.com/developers/documentation/reference/user')

----
API-ASSOCIATIONS

:association Shops
:visibility public
:perm-scope none
:type array(Shop)
:documentation "An array of shops that belong to the user."

:association Profile
:visibility public
:perm-scope none
:type UserProfile
:documentation "The user's public profile."

:association Orders
:visibility private
:perm-scope transactions_r
:type array(Order)
:documentation "An array of orders this user has placed."

:association BuyerReceipts
:visibility private
:perm-scope transactions_r
:type array(Receipt)
:documentation "An array of receipts for listings this user has purchased."

:association BuyerTransactions
:visibility private
:perm-scope transactions_r
:type array(Transaction)
:documentation "An array of transactions (sold listings) this user has purchased."

:association Addresses
:visibility private
:perm-scope profile_r
:type array(UserAddress)
:documentation "A user's Addresses."

:association Charges
:visibility private
:perm-scope billing_r
:type array(BillCharge)
:documentation "A user's (buyer's) Charges."

:association Payments
:visibility private
:perm-scope billing_r
:type array(BillPayment)
:documentation "A user's (buyer's) Payments. "


---
API-METHODS
 
 "findAllUsers"
 "getUser"
 "findAllUsersForTeam"

|#

(in-package #:cl-etsy)

;; User
(defclass user (base-etsy)
 (;; user_id
  (user-id
   :initarg :user-id
   :accessor user-id
   ;; :visibility public
   ;; :perm-scope none
   ;; :type int
   :documentation "The user's numeric ID. This is also valid as the user's shop ID.")

  ;; login_name v1 user-name
  (login-name
   :initarg :login-name
   :accessor login-name
   ;; :visibility public
   ;; :perm-scope none
   ;; :type string
   :documentation "The user's login name.")

  ;; primary_email
  (primary-email
   :initarg :primary-email
   :accessor primary-email
   ;; :visibility private
   ;; :perm-scope email_r
   ;; :type string
   :documentation "The user's primary email address.")

  ;; creation_tsz v1 join-epoch
  (creation-tsz
   :initarg :creation-tsz
   :accessor creation-tsz
   ;; :visibility public
   ;; :perm-scope none
   ;; :type float
   :documentation "The date and time the user was created, in epoch seconds.")

  ;; referred_by_user_id
  (referred-by-user-id
   :initarg :referred-by-user-id
   :accessor referred-by-user-id
   ;; :visibility public
   ;; :perm-scope none
   ;; :type int
   :documentation "The numeric ID of the user that referred this user.")

  ;; feedback_info
  (feedback-info
   :initarg :feedback-info
   :accessor feedback-info
   ;; :visibility public
   ;; :perm-scope none
   ;; :type FeedbackInfo
   :documentation "An associative array of feedback totals for the user."))

  ;; (:default-initargs :user-id nil :login-name nil :primary-email nil :creation-tsz nil
  ;; :referred-by-user-id nil :feedback-info nil)

  (:documentation "Represents a single user of the site.
 (URL `http://www.etsy.com/developers/documentation/reference/user')"))

;; (defmethod print-object ((x user) stream)
;;   (dumb-printing stream x "~D: ~A" user-id login-name))


#|
 | "findAllUsers"
 | (yason:parse (api-call (concatenate 'string *base-url* "/users") :parameters '(("keywords" . "<USER-NAME>"))) :object-as :alist)

 ((:NAME        . "findAllUsers")
   (:DESCRIPTION . "Finds all Users whose name or username match the keywords parameter.")
   (:URI         . "/users")
   (:PARAMS
    (:KEYWORDS . "string")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:KEYWORDS)
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "User")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))
 
 | "getUser"
 | (yason:parse (api-call (concatenate 'string *base-url* "/users/<USER-NAME-OR-ID>")) :object-as :alist)
 | (yason:parse (api-call (concatenate 'string *base-url* "/users/<USER-NAME-OR-ID>")) :object-as :alist)
 | (yason:parse (api-call (concatenate 'string *base-url* "/users/<USER-NAME>") :parameters '(("fields" . "user_id,login-name"))) :object-as :alist)
 | (yason:parse (api-call (concatenate 'string *base-url* "/users/<USER-ID>") :parameters '(("fields" . "login_name,user_id"))) :object-as :alist)

 ((:NAME        . "getUser")
  (:DESCRIPTION . "Retrieves a User by id.")
  (:URI         . "/users/:user_id")
  (:PARAMS
   (:USER-ID . "array(user_id_or_name)"))
  (:DEFAULTS)
  (:TYPE         . "User")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
