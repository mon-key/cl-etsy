;;; :FILE-CREATED <Timestamp: #{2012-07-10T17:09:19-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-base-class.lisp
;;; ==============================

#|

"getServerEpoch"
"ping"

"findPayment"             -- api-type "Payment" doesn't exist
"findPaymentAdjustments"  -- api-type "PaymentAdjustment" doesn't exist
"findPaymentAdjustment"   -- api-type "PaymentAdjustment" doesn't exist
"findPaymentAdjustmentItem" -- 2x method with different URI api-type "PaymentAdjustmentItem" doesn't exist 

"findLedger" -- api-type "Ledger" doesn't exist
"findLedgerEntries" -- api-type "LedgerEntry" doesn't exist

|#

(in-package #:cl-etsy)

(defclass base-etsy ()
  ()
  ;; (:default-initargs )
  (:documentation "An abstract class from which Etsy API classes should inherit."))

#|

 We should run an after method on make-instance of api-type subclasses that
 adds the api-name/api-symbol to a hash-table(s)
 subclasses of api-resource-type

 (defclass api-type (base-etsy)
   ((api-name 
     :initarg api-name
     :accessor api-name
     :documentation "The resource's JSON name - a string.")
  
    (api-symbol
     :initarg :api-symbol
     :accessor api-symbol
     :documentation "The Lisp symbol of this resource."))

   (:documentation ""))

 ---
 (defclass api-resource-type (api-type)
   ()
  (:documentation "An abstract class for for resources exposed by the Etsy v2 API."))

 ----
 (defclass api-resource-association-type (api-type)
   (
    (name
    :reader name
    :documentation "A string identifying the resource-association")

   (visibility
    :reader visibility
    :documentation "An association's visibility is either public or private.
When an association's visibility is public it's asosociation-permission is null.
Public association's do not require interaction with the Oauth regime of the Etsy v2 API.
When an association's visibility private it's it's asosociation-permission is one of the following:

Public association's require interaction with the Oauth regime of the Etsy v2 API.
")

   (permission-scope
    :reader permission-scope
    :documentation "")

   (type
    :reader type ;; assocation-type
    :documentation "")

   (description  ;; assocation-description
    :reader description ;; assocation-description
    :documentation "")
   )

  ;; (:default-initargs  )

  (:documentation "An abstract class for the associations of a resource as exposed by the Etsy v2 API.

\" Each resource has one or more associations that can be included using the
 standard includes parameter:

  /v2/listings/active?includes=Images

 Multiple associations can be separated with commas:

  /v2/listings/active?includes=Images,Shop

 In addition, associations can specify limit/offset parameters.
 The following example loads only the first image (limit 1, offset 0:)

  /v2/listings/active?includes=Images:1:0

 You can also specify which fields of an association are returned:

  /v2/listings/active?includes=Images(url_75x75,hex_code)

 Finally, associations can be nested up to three levels deep, using slashes:

  /v2/listings/active?includes=Shop/User
  /v2/shops/etsystore?includes=Listings:1:0/Images\

 The complete association inclusion syntax is as follows 

  ?includes=Association[(fieldname[,fieldname...])][:scope][:limit[:offset]][,Assocation...]
 
 Elements in [square brackets] are optional.\"

 (URL `http://www.etsy.com/developers/documentation/getting_started/resources#section_associations')"))

 ----
 (defclass api-resource-method-type (api-type)
   (
    ;; name
    ;; description
    ;; uri
    ;; params
    ;; defaults
    ;; type
    ;; visibility ;; Requires Oauth in the web documentation
    ;; http-method ;; "GET" "PUT" "POST" "DELETE"
    )
 
   (:documentation "An abstract class for the api-methods of a resource as exposed by the Etsy v2 API."))

 ----
 (defclass api-resource-permission-scope-type (api-type)
   (
    ;; description
    ;; type
    )
   (:documentation ""))

 :api-name "email_r"
 :api-symbol email-r
 :description "Read a member's email address"
 :type        User ; user
 
 :api-name "listings_r"
 :api-symbol  listings-r
 :description "Read a members's inactive and expired (i.e., non-public) listings."
 :type        Listing ; listing
 
 :api-name "listings_w"
 :api-symbol listings-w
 :description "Create and edit a members's listings."
 :type        Listing ; listing
 
 :api-name "listings_d"
 :api-symbol listings-d
 :description "Delete a members's listings."
 :type        Listing ; listing
 
 :api-name "transactions_r"
 :api-symbol transactions-r
 :description "Read a member's purchase and sales data. This applies to buyers as well as sellers."
 :type        Order Transaction Receipt ; order transaction receipt
 
 :api-name "transactions_w"
 :api-symbol transactions-w
 :description "Update a member's sales data."
 :type        Receipt ; receipt
 
 :api-name "billing_r"
 :api-symbol billing-r
 :description "Read a member's Etsy bill charges and payments."
 :type        BillCharge BillPayment BillingOverview ; bill-charge bill-payment billing-overview
 
 :api-name "profile_r"
 :api-symbol profile-r
 :description "Read a member's private profile information."
 :type        User UserProfile ; user user-profile
 
 :api-name "profile_w"
 :api-symbol profile-w
 :description "Update a member's private profile information."
 :type        Avatar ; avatar
 
 :api-name "address_r"
 :api-symbol address-r
 :description "Read a member's shipping addresses."
 :type        UserAddress ; user-address
 
 :api-name "address_w"
 :api-symbol address-w
 :description "Update and delete a member's shipping address."
 :type        UserAddress ; user-address
 
 :api-name "favorites_rw"
 :api-symbol favorites_rw
 :description "Add to and remove from a member's favorite listings and users."
 :type        FavoriteListing FavoriteUser ; favorite-listing favorite-user
 
 :api-name "shops_rw"
 :api-symbol shops-rw
 :description "Update a member's shop description, messages and sections."
 :type        Shop ShopSection ; shop shop-section
 
 :api-name "cart_rw"
 :api-symbol cart-rw
 :description "Add and remove listings from a member's shopping cart."
 :type        Cart CartListing ; cart cart-listing
 
 :api-name "recommend_rw"
 :api-symbol recommend-rw
 :description "View, accept and reject a member's recommended listings."
 :type        Listing ; listing
 
 :api-name "feedback_r"
 :api-symbol feedback-r
 :description "View all details of a member's feedback (including purchase history.)"
 :type        Feedback ; feedback
 
 :api-name "treasury_w"
 :api-symbol treasury-w
 :description "Create and delete treasuries and treasury comments"
 :type        Treasury ; treasury


 Methods and fields in the Etsy API are tagged with "permission scopes" that
 control what operations can be performed and what data can be read with a given
 set of OAuth credentials:

 The Etsy v2 API presents a proprietary extension to the OAuth protocol called
 "permission scopes" which allow apps to be more specific about the operations
 they intend to perform against an Etsy member's account. This means that apps
 that, for instance, only intend to look at a member's sales history and not
 upload or change the member's listings, can request only the permissions they
 intend to use. This protects the member's account against abuse.

 Apps that obtain OAuth credentials without specifying a scope will have a
 level of access that is not much different from apps using basic,
 API-key-based authentication. To take advantage of Etsy's read-write API, a
 scopes should be specified.
 (URL `http://www.etsy.com/developers/documentation/getting_started/oauth#section_permission_scopes')


|#

;;; ==============================
;;; EOF

