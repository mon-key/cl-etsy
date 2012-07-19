;;; :FILE-CREATED <Timestamp: #{2012-07-19T18:45:28-04:00Z}#{12294} - by MON>
;;; :FILE cl-etsy/api-class/etsy-permission-scop-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/getting_started/oauth#section_permission_scopes')

"Methods and fields in the Etsy API are tagged with "permission scopes" that
control what operations can be performed and what data can be read with a given
set of OAuth credentials.

Apps that obtain OAuth credentials without specifying at least one of the above
scopes will have a level of access that is not much different from apps using
basic, API-key-based authentication. To take advantage of Etsy's read-write API,
at least one of the following scopes should be specified depending on what
aspects of the member's account you'd like to access. These are passed using the
proprietary field ``scope'' in the temporary credentials request. Multiple
permission scopes should be separated with spaces."

 By default we want all permissions:

 (list "email_r" "listings_r" "listings_w" "listings_d" "transactions_r"
       "transactions_w" "billing_r" "profile_r" "profile_w" "address_r" "address_w"
       "favorites_rw" "shops_rw" "cart_rw" "recommend_rw" "feedback_r" "treasury_w")

 These are passed as the value for the "scope" paramater wehen requesting a token with:

 (cons "scope" (format nil "~{~A~^ ~}" 
                       (list "email_r" "listings_r" "listings_w" "listings_d" "transactions_r"
                             "transactions_w" "billing_r" "profile_r" "profile_w" "address_r" "address_w"
                             "favorites_rw" "shops_rw" "cart_rw" "recommend_rw" "feedback_r" "treasury_w")))

 ((:permission-scope  "email_r"
   :description       "Read a member's email address"
   :affected-resources ("User"))

  (:permission-scope  "listings_r"
   :description       "Read a members's inactive and expired (i.e., non-public) listings."
   :affected-resources ("Listing"))

  (:permission-scope  "listings_w"
   :description       "Create and edit a members's listings."
   :affected-resources ("Listing"))

  (:permission-scope  "listings_d"
   :description       "Delete a members's listings."
   :affected-resources ("Listing"))

  (:permission-scope  "transactions_r"
   :description       "Read a member's purchase and sales data. This applies to buyers as well as sellers."
   :affected-resources ("Order" "Transaction" "Receipt"))

  (:permission-scope  "transactions_w"
   :description       "Update a member's sales data."
   :affected-resources ("Receipt"))

  (:permission-scope  "billing_r"
   :description       "Read a member's Etsy bill charges and payments."
   :affected-resources ("BillCharge" "BillPayment" "BillingOverview"))

  (:permission-scope  "profile_r"
   :description       "Read a member's private profile information."
   :affected-resources ("User" "UserProfile"))

  (:permission-scope  "profile_w"
   :description       "Update a member's private profile information."
   :affected-resources ("Avatar"))

  (:permission-scope  "address_r"
   :description       "Read a member's shipping addresses."
   :affected-resources ("UserAddress"))

  (:permission-scope  "address_w"
   :description       "Update and delete a member's shipping address."
   :affected-resources ("UserAddress"))

  (:permission-scope  "favorites_rw"
   :description       "Add to and remove from a member's favorite listings and users."
   :affected-resources ("FavoriteListing" "FavoriteUser"))

  (:permission-scope  "shops_rw"
   :description       "Update a member's shop description, messages and sections."
   :affected-resources ("Shop" "ShopSection"))

  (:permission-scope  "cart_rw"
   :description       "Add and remove listings from a member's shopping cart."
   :affected-resources ("Cart" "CartListing"))

  (:permission-scope  "recommend_rw"
   :description       "View, accept and reject a member's recommended listings."
   :affected-resources ("Listing"))

  (:permission-scope  "feedback_r"
   :description       "View all details of a member's feedback (including purchase history.)"
   :affected-resources ("Feedback"))

  (:permission-scope  "treasury_w"
   :description       "Create and delete treasuries and treasury comments"
   :affected-resources ("Treasury")))

|#

(in-package #:cl-etsy)

(defclass permission-scope (base-etsy)
  ((permission-scope
    :initarg :permission-scope
    :accessor permission-scope
    :documentation "A string identifiying the scope of permssions a particular API request is entailed by.")
   (description
    :initarg :description
    :accessor description
    :documentation "A description of the permission.")
   (affected-resources
    :initarg :affected-resources 
    :accessor affected-resources
    :documentation "A list strings identifying the resources affected by the entailing scope.
Each element of list should map to a symbol designating a subclass of class
`base-etsy' which represents the resource."))

  ;; (:default-initargs :permission-scope nil :description nil :affected-resources nil)

  (:documentation "
 \"The Etsy API presents a proprietary extension to the OAuth protocol called
 ``permission scopes'' which are intended to allow Etsy apps to be more specific
 about the operations they intend to perform against an Etsy member's
 account. This means that apps that, for instance, only intend to look at a
 member's sales history and not upload or change the member's listings, can
 request only the permissions they intend to use. This protects the member's
 account against abuse.

 Methods and fields in the Etsy API are tagged with ``permission scopes'' that
 control what operations can be performed and what data can be read with a given
 set of OAuth credentials.

 Apps that obtain OAuth credentials without specifying at least one of the above
 scopes will have a level of access that is not much different from apps using
 basic, API-key-based authentication.

 To take advantage of Etsy's read-write API, at least one of the following
 scopes should be specified depending on what aspects of the member's account
 you'd like to access. These are passed using the proprietary field ``scope'' in
 the temporary credentials request. Multiple permission scopes should be
 separated with spaces.\"

 (URL `http://www.etsy.com/developers/documentation/getting_started/oauth#section_permission_scopes')"))


;;; ==============================
;;; EOF
