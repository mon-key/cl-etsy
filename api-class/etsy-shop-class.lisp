;;; :FILE-CREATED <Timestamp: #{2012-07-10T11:49:10-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-shop-class.lisp
;;; ==============================

#|
 (URL `http://www.etsy.com/developers/documentation/reference/shop')

----
API-ASSOCIATIONS

:association User
:visibility public
:perm-scope none
:type User
:documentation "The user who owns this shop."

:association Sections
:visibility public
:perm-scope none
:type array(ShopSection)
:documentation "An array of sections within the shop.  Each section holds listings."

:association Listings
:visibility public
:perm-scope none
:type array(Listing)
:documentation "An array of listings within the shop.  (Must be used with scope \"active\", e.g.: Listings:active)."

:association Receipts
:visibility private
:perm-scope shops_rw
:type array(Receipt)
:documentation "An array of receipts (one per buyer) for this shop."

:association Transactions
:visibility private
:perm-scope shops_rw
:type array(Transaction)
:documentation "An array of transactions (sold items) for this shop."

:association Translations
:visibility public
:perm-scope none
:type array(ShopTranslation)
:documentation "An array of translations for this Shop."

----
API-METHODS
"getShop"
"updateShop"
"findAllUserShops"
"findAllShops"
"uploadShopBanner"
"deleteShopBanner"

|#

(in-package #:cl-etsy)

;; Shop
(defclass shop (base-etsy)
  (
   ;; shop_id
   (shop-id
    :initarg :shop-id
    :accessor shop-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The shop's numeric ID.")

   ;; shop_name
   (shop-name
    :initarg :shop-name
    :accessor shop-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The shop's name.")

   ;; first_line
   (first-line
    :initarg :first-line
    :accessor first-line
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type string
    :documentation "The first line of the shops address.
[DEPRECATED] Use UserAddress.first_line instead.")

   ;; second_line
   (second-line
    :initarg :second-line
    :accessor second-line
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type string
    :documentation "The second line of the shops address. 
[DEPRECATED] Use UserAddress.second_line instead.")

   (city
    :initarg :city
    :accessor city
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type string
    :documentation "The city the shop is in.
[DEPRECATED] Use UserAddress.city instead.")

   (state
    :initarg :state
    :accessor state
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type string
    :documentation "The state the shop is in. 
DEPRECATED: use UserAddress.state instead.")

   (zip
    :initarg :zip
    :accessor zip
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type string
    :documentation "The zip code the shop is in.
DEPRECATED: use UserAddress.zip instead.")

   ;; country_id
   (country-id
    :initarg :country-id
    :accessor country-id
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type int
    :documentation "The numeric ID of the country the shop is in.
DEPRECATED: use UserAddress.country_id instead.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the user that owns this shop.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The date and time the shop was created, in epoch seconds.")

   (title
    :initarg :title
    :accessor title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A brief heading for the shop's main page.")

   (announcement
    :initarg :announcement
    :accessor announcement
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "An announcement to buyers that displays on the shop's homepage.")

   ;; currency_code
   (currency-code
    :initarg :currency-code
    :accessor currency-code
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The ISO code (alphabetic) for the seller's native currency.")

   ;; is_vacation
   (is-vacation
    :initarg :is-vacation
    :accessor is-vacation
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "If the seller is not currently accepting purchases, 1, blank otherwise.")

   ;; vacation_message
   (vacation-message
    :initarg :vacation-message
    :accessor vacation-message
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "If is_vacation=1, a message to buyers.")

   ;; sale_message
   (sale-message
    :initarg :sale-message
    :accessor sale-message
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A message that is sent to users who buy from this shop.")

   ;; last_updated_tsz
   (last-updated-tsz
    :initarg :last-updated-tsz
    :accessor last-updated-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The date and time the shop was last updated, in epoch seconds.")

   ;; listing_active_count
   (listing-active-count
    :initarg :listing-active-count
    :accessor listing-active-count
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of active listings in the shop.")

   ;; login_name
   (login-name
    :initarg :login-name
    :accessor login-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The user's login name.")

   (lat
    :initarg :lat
    :accessor lat
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type float
    :documentation "The latitude of the shop.")

   (lon
    :initarg :lon
    :accessor lon
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type float
    :documentation "The longitude of the shop.")

   ;; alchemy_message
   (alchemy-message
    :initarg :alchemy-message
    :accessor alchemy-message
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A message to potential Alchemy buyers.")

   ;; is_refusing_alchemy
   (is-refusing-alchemy
    :initarg :is-refusing-alchemy
    :accessor is-refusing-alchemy
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True is the shop does not accept Alchemy requests.")

   ;; policy_welcome
   (policy-welcome
    :initarg :policy-welcome
    :accessor policy-welcome
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The introductory text from the top of the seller's policies page (may be blank).")

   ;; policy_payment
   (policy-payment
    :initarg :policy-payment
    :accessor policy-payment
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The seller's policy on payment (may be blank).")

   ;; policy_shipping
   (policy-shipping
    :initarg :policy-shipping
    :accessor policy-shipping
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The seller's policy on shipping (may be blank).")

   ;; policy_refunds
   (policy-refunds
    :initarg :policy-refunds
    :accessor policy-refunds
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The seller's policy on refunds (may be blank).")

   ;; policy_additional
   (policy-additional
    :initarg :policy-additional
    :accessor policy-additional
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Any additional policy information the seller provides (may be blank).")

   ;; policy_seller_info
   (policy-seller-info
    :initarg :policy-seller-info
    :accessor policy-seller-info
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The shop's seller information (may be blank).")

   ;; policy_updated_tsz
   (policy-updated-tsz
    :initarg :policy-updated-tsz
    :accessor policy-updated-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The date and time the shop was last updated, in epoch seconds.")

   ;; vacation_autoreply
   (vacation-autoreply
    :initarg :vacation-autoreply
    :accessor vacation-autoreply
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "If is_vacation=1, a message to buyers in response to new convos.")

   ;; ga_code
   (ga-code
    :initarg :ga-code
    :accessor ga-code
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type string
    :documentation "The shop's Google Analytics code.")

   (name
    :initarg :name
    :accessor name
    ;; :visibility private
    ;; :perm-scope shops_rw
    ;; :type string
    :documentation "The shop owner's real name.
DEPRECATED: use UserAddress.name instead.")

   (url
    :initarg :url
    :accessor url
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The URL of the shop")

   ;; image_url_760x100
   (image-url-760x100
    :initarg :image-url-760x100
    :accessor image-url-760x100
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The URL to the shop's banner image.")

   ;; num_favorers
   (num-favorers
    :initarg :num-favorers
    :accessor num-favorers
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of members who've marked this Shop as a favorite")

   ;; languages
   (languages
    :initarg :languages
    :accessor languages
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(string)
    :documentation "The languages that this Shop is enrolled in. ")
   )
  ;; (:default-initargs 
  ;;  :shop-id nil :shop-name nil :first-line nil :second-line nil
  ;;  :city nil :state nil :zip nil :country-id nil :user-id nil
  ;;  :creation-tsz nil :title nil :announcement nil :currency-code nil
  ;;  :is-vacation nil :vacation-message nil :sale-message nil
  ;;  :last-updated-tsz nil :listing-active-count nil :login-name nil
  ;;  :lat nil :lon nil :alchemy-message nil :is-refusing-alchemy nil
  ;;  :policy-welcome nil :policy-payment nil :policy-shipping nil
  ;;  :policy-refunds nil :policy-additional nil :policy-seller-info nil
  ;;  :policy-updated-tsz nil :vacation-autoreply nil :ga-code nil :name nil
  ;;  :url nil :image-url-760x100 nil :num-favorers nil :languages nil)
  (:documentation "Represents a shop with listings for sale.  Each shop is owned by one user.
 (URL `http://www.etsy.com/developers/documentation/reference/shop')"))


;;; ==============================
;;; EOF
