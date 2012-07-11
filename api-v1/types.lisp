
(in-package #:cl-etsy)

(defmacro dumb-printing (stream object format-string &rest slots)
  `(let* ((object ,object)
          ,@(loop for slot in slots
               collect `(,slot (if (slot-boundp object ',slot)
                                   (slot-value object ',slot)
                                   "<unbound>"))))
     (print-unreadable-object (object stream :type t)
       (format ,stream ,format-string ,@slots))))


;;; One marshalling function for each parameter type 

(defun marshall-int (x)
  (format nil "~S" x))

;; A number with or without a decimal point. 
;; Represented in output as a string, to avoid precision errors.
(defun marshall-float (x)
  (format nil "~S" x))

;; "A valid numeric latitude, between -90.0 and 90.0"
(defun marshall-latitude (x)
  ;; (format nil "~D" x)
  ;; (format nil "~S" x)
  (format nil "~,1,F" x))

;; "A valid numeric longitude, between -180.0 and 180.0"
(defun marshall-longitude (x)
  ;; (format nil "~D" x)
  ;; (format nil "~S" x)
  (format nil "~,1,F" x))

;; "Specify the degree of tolerance for color matching where 0 is the most accurate, and 30 is the least."
(defun marshall-color-wiggle (x)
  (format nil "~S"))


;; a string will contain upto at most 255 characters
(defun marshall-string (x)
  x)

;; "A string 255 characters long or less."
(defun marshall-treasury-description (x)
  x)

;; "A string that uniquely identifies a treasury."
(defun marshall-treasury-id (x)
  x)

;; "A string 127 characters long or less"
(defun marshall-treasury-title (x)
  x)

;; "An ISO 3166-1 alpha 2 country code. Currently supported values: US, CA, AU, GB, DE, FR, NL"
(defun marshall-region (x)
  x)

;; "An IETF language code. Currently supported values: en, de, fr"
(defun marshall-language (x)
  x)

;; v1 
;; see `api-type-to-our-type' where TYPE-STRING is "enum(low, medium, high)"
(defun marshall-detail-level (x)
  (string-downcase (symbol-name x)))

;; "Either a user's numeric ID or login name."
(defun marshall-user-id-or-name (x)
  (format nil "~(~A~)" x))

;; "Either a teams's numeric ID or full name, including spaces and punctuation. 
(defun marshall-team-id-or-name (x)
  (format nil "~(~A~)" x))

;; "Either a shop's numeric ID or login name.
(defun marshall-shop-id-or-name (x)
  (format nil "~(~A~)" x))

(defun marshall-sort-on-a (x)
  (string-downcase (symbol-name x)))

(defun marshall-sort-on-b (x)
  (string-downcase (symbol-name x)))

(defun marshall-sort-order (x)
  (string-downcase (symbol-name x)))

(defun marshall-boolean (x)
  (if x
      "true"  ; "1"
      "false" ; "0"
      ))

;; (format nil "~{~A~^;~}" (coerce #("a" "b" "c" "d") 'list))
(defun marshall-array-of-strings (x)
  (format nil "~{~A~^;~}" (coerce x 'list)))

;; (format nil "~{~D~^;~}" (coerce #(1 2 3 4) 'list))
(defun marshall-array-of-ints (x)
  (format nil "~{~D~^;~}" (coerce x 'list)))

;; "A color_triplet is Either an HSV color specified as an array in the range [0;0;0 , 360;100;100] or an
;; RGB color specified in hexadecimal notation in the range [#000000 , #FFFFFF].
;; :NOTE RGB colors are converted to HSV internally, which may result in small
;; rounding errors.  They may omit the leading "#", or use the three-digit form."
;;
;; marshall-hue ???
(defun marshall-color-triplet (x)
  (if (integerp x)
      (format nil "~X" x)
      (format nil "~D;~D;~D" (aref x 0) (aref x 1) (aref x 2))))

(defun demarshall-int (x)
  x)

(defun demarshall-string (x)
  x)

(defun demarshall-category (x)
  x)

(defun demarshall-tag (x)
  x)

(defun demarshall-boolean (x)
  x)

(defun demarshall-float (x)
  x)

;; demarshall-hue ???
(defun demarshall-hsv-color (x)
  (loop
     with result = (make-array 3) finally (return result)
     for i in (cl-ppcre:split ";" x)
     as j from 0
     do (setf (svref result j) (parse-integer i))))

(defun demarshall-rgb-color (x)
  (parse-integer (subseq x 1) :radix 16))

(defun demarshall-enum-to-keyword (x)
  (intern (string-upcase x) (symbol-package :keyword)))

(defun demarshall-image-booklet (booklet)
  (loop 
     for image-set in booklet
     collect image-set))



(define-unusual-json-mapping 'image-url-25x25 :image--url--25-x-25)

(define-unusual-json-mapping 'image-url-30x30 :IMAGE--URL--30-X-30)

(define-unusual-json-mapping 'image-url-50x50 :IMAGE--URL--50-X-50)

(define-unusual-json-mapping 'image-url-75x75 :IMAGE--URL--75-X-75)

(define-unusual-json-mapping 'image-url-155x125 :IMAGE--URL--155-X-125)

(define-unusual-json-mapping 'image-url-200x200 :IMAGE--URL--200-X-200)

(define-unusual-json-mapping 'image-url-430xN :image--url--430-x-n )

;;; ==============================

#|
 (URL `http://www.etsy.com/developers/documentation/reference/user')

 "findAllUsersForTeam", "findAllUsers", "getUser"

|#

;; moved to api-class/etsy-shop-class.lisp
;;
;; v1
;; (def-api-class 
;;     ;; NAME
;;     user 
;;     ;; SUPERCLASS
;;     () 
;;   ;; DOC
;;   "User records represent a single user of the site, who may or may not be a seller." 
;;   ;; FIELDS
;;   ((user-name
;;     :level :low
;;     :type string
;;     :doc "The user's login name.")
;;    (user-id
;;     :level :low
;;     :type int
;;     :doc "The user's numeric ID.  This is also valid as the user's shop ID.")
;;    (url
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's shop, if s/he is a seller, or to the user's public profile.")
;;    (image-url-25x25
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's 25x25 avatar thumbnail.")
;;    (image-url-30x30
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's 30x30 avatar thumbnail.")
;;    (image-url-50x50
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's 50x50 avatar thumbnail.")
;;    (image-url-75x75
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's 75x75 avatar (full resolution).")
;;    (join-epoch
;;     :level :low
;;     :type float
;;     :doc "The date and time the user joined the site, in epoch seconds.")
;;    (city
;;     :level :low
;;     :type string
;;     :doc "The user's city and state (freeform entry; may be blank).")
;;    (gender
;;     :level :medium
;;     :type string
;;     :doc "The user's gender (female, male, or private).")
;;    (lat
;;     :level :medium
;;     :type float
;;     :doc "The user's latitude (may be blank).")
;;    (lon
;;     :level :medium
;;     :type float
;;     :doc "The user's longitude (may be blank).")
;;    (transaction-buy-count
;;     :level :medium
;;     :type int
;;     :doc "The number of items the user has purchased.")
;;    (transaction-sold-count
;;     :level :medium
;;     :type int
;;     :doc "The number of items the user has sold.")
;;    (is-seller
;;     :level :medium
;;     :type boolean
;;     :doc "true if user is a seller.")
;;    (was-featured-seller
;;     :level :medium
;;     :type boolean
;;     :doc "true if user was previously featured.")
;;    (materials
;;     :level :medium
;;     :type string
;;     :doc "The user's favorite materials.")
;;    (last-login-epoch
;;     :level :medium
;;     :type float
;;     :doc "The date and time of the user's last login, in epoch seconds.")
;;    (referred-user-count
;;     :level :high :type int
;;     :doc "The number of members the user has referred to the site.")
;;    (birth-day
;;     :level :high
;;     :type int
;;     :doc "The day portion of the user's birthday (may be blank).")
;;    (birth-month
;;     :level :high
;;     :type int
;;     :doc "The month portion of the user's birthday (may be blank).")
;;    (bio
;;     :level :high
;;     :type string
;;     :doc "The user's biography (may be blank).")
;;    (num-favorers
;;     :level high
;;     :type int
;;     :doc "Presumably, the number of hearts.")
;;    (feedback-count
;;     :level :high
;;     :type int
;;     :doc "The total count of feedback by and about this user.")
;;    (feedback-percent-positive
;;     :level :favorites
;;     :type int
;;     :doc "The percentage of feedback by or about this user that is positive.")
;;    (favorite-creation-epoch
;;     :level :favorites
;;     :type float
;;     :doc "The date and time that the user was favorited 
;;  (only available in the commands getFavorersOfShop, getFavorersOfListing and getFavoriteShopsOfUser.)")
;;    (status 
;;     :level :favorites 
;;     :type enum-to-keyword
;;     :doc "public or private.
;; If private, user is a Secret Admirer, and no information about the user can be shown.")))
;;
;; (defmethod print-object ((x user) stream)
;;   (dumb-printing stream x "~D: ~A" user-id user-name))

;; v2
;; (def-api-class user () 
;;   "User records represent a single user of the site, who may or may not be a seller." 
;;   ;; v2 user_id
;;   ((user-id
;;     :level :low
;;     :type int
;;     :doc "The user's numeric ID.  This is also valid as the user's shop ID.")
;;    ;; v2 login_name v1 user-name
;;    (login-name
;;     :level :low
;;     :type string
;;     :doc "The user's login name.")
;;    ;; v2 primary_email
;;    (primary-email
;;     :level :low
;;     :type  string
;;     :doc "The user's primary email address.")
;;    ;; v2 creation_tsz v1 join-epoch
;;    (creation-tsz
;;     :level :low
;;     :type float
;;     :doc "The date and time the user was created in epoch seconds.")
;;    ;; 
;;    ;; v2 referred_by_user_id
;;    (referred-by-user-id
;;     :level low
;;     :type int 
;;     :doc "The numeric ID of the user that referred this user.")
;;    ;; feedback_info 	public 	none 	FeedbackInfo 	
;;    ;; v2
;;    (feedback_info
;;     :level :low
;;     :type hash-table
;;     ;;:type feedback-info ;; "FeedbackInfo"
;;     ;; :doc "An associative array of feedback totals for the user.")
;;     )))
;;
;;; ==============================


;; moved to api-class/etsy-shop-class.lisp
;;
;; "getShop", "updateShop", "findAllUserShops", "findAllShops", "uploadShopBanner", "deleteShopBanner"
;;
;; (def-api-class shop (user)
;;   "Shop records extend user records to include information about the seller's shop.
;; In addition to all the user fields listed above; shops have these additional fields:"
;;   ((banner-image-url
;;     :level :low
;;     :type string
;;     :doc "The full URL to the shops's banner image.")
;;    (last-updated-epoch
;;     :level :low
;;     :type string
;;     :doc "The date and time the shop was last updated, in epoch seconds.")
;;    (creation-epoch
;;     :level :low
;;     :type string
;;     :doc "The date and time the shop was created, in epoch seconds.")
;;    (listing-count
;;     :level :low
;;     :type int
;;     :doc "The number of active listings in the shop.")
;;    (shop-name
;;     :level :medium
;;     :type string
;;     :doc "The shop's name.")
;;    (title
;;     :level :medium
;;     :type string
;;     :doc "A brief heading for the shop's main page.")
;;    (sale-message
;;     :level :medium
;;     :type string
;;     :doc "A message that is sent to users who buy from this shop.")
;;    (announcement
;;     :level :high
;;     :type string
;;     :doc "An announcement to buyers that displays on the shop's homepage.")
;;    (is-vacation
;;     :level :high
;;     :type int
;;     :doc "If the seller is not currently accepting purchases, 1, blank otherwise.")
;;    (vacation-message
;;     :level :high
;;     :type string
;;     :doc "If is-vacation=1, a message to buyers.")
;;    (currency-code
;;     :level :high
;;     :type string
;;     :doc "The ISO code (alphabetic) for the seller's native currency.")
;;    (policy-welcome
;;     :level :high
;;     :type string
;;     :doc "The introductory text from the top of the seller's policies page (may be blank).")
;;    (policy-payment
;;     :level :high
;;     :type string
;;     :doc "The seller's policy on payment (may be blank).")
;;    (policy-shipping
;;     :level :high
;;     :type string
;;     :doc "The seller's policy on shippinh (may be blank).")
;;    (policy-refunds
;;     :level :high
;;     :type string
;;     :doc "The seller's policy on refunds (may be blank).")
;;    (policy-additional
;;     :level :high
;;     :type string
;;     :doc "Any additional policy information the seller provides (may be blank).")
;;    (sections
;;     :level :high
;;     :type array-of-shop-sections
;;     :doc "(shop-section)
;; An array of shop-section objects (see below).")))

#|

 (URL `http://www.etsy.com/developers/documentation/reference/shopsection#section_fields')

 Field  	             Visibility Level  	Permission Scope  	Type  	Description
 ------------------------------------------------------------------------------------------
 shop_section_id      public 	        none 	                int 	The numeric ID of the shop section.
 title 	             public 	        none 	                string 	The title of the section.
 rank 	             public 	        none 	                int 	Display order.
 user_id 	     public 	        none 	                int 	The ID of the user who owns this shop section.
 active_listing_count public 	        none 	                int 	The number of active listings currently in the section

|#


;; "findAllShopSections", "createShopSection", "getShopSection", "updateShopSection", "deleteShopSection", "getShopSectionTranslationShopSection"

(def-api-class shop-section ()
  "Some sellers may choose to organize their listings into sections.
Each section is specific to a shop and has a numeric ID and a title."
  (
   ;; v1
   (section-id
    :type int
    :doc "The numeric ID of the shop section.")
   ;; v2
   ;; (shop-section-id
   ;;  :type int
   ;;  :doc "The numeric ID of the shop section.")
   (title
    :type string
    :doc "The title of the section.")
   ;; v1
   (listing-count
    :type int
    :doc "The number of active listings currently in the section.")
   ;; v2
   ;; (active-listing-count
   ;;  :type int
   ;;  "The number of active listings currently in the section.")
   ;; v2   
   ;; (rank
   ;;  :type int 	
   ;;  :doc "Display order.")
   ;; v2
   ;; (user-id
   ;;  :type int
   ;;  :doc "The ID of the user who owns this shop section.")
   ))

(defmethod print-object ((x shop-section) stream)
  (dumb-printing stream x "~D: ~A" section-id title))

(defun demarshall-array-of-shop-sections (x)
  (loop
     for section-json in x
     as shop-section = (make-instance 'shop-section)
     collect (fill-out-etsy-object-from-json shop-section section-json)))

#|

 (URL `http://www.etsy.com/developers/documentation/reference/listing')
 (URL `http://www.etsy.com/developers/documentation/reference/listing#section_fields')

"createListing", "getListing", "updateListing", "deleteListing"
"findAllListingActive", "findAllListingsForFeaturedTreasuryId",
"findAllActiveListingsForFeaturedTreasuryId", "findAllFeaturedListings",
"findAllCurrentFeaturedListings", "findAllReceiptListings",
"findAllShopListingsActive", "findAllShopListingsDraft",
"findAllShopListingsExpired", "getShopListingExpired",
"findAllShopListingsFeatured", "findAllShopListingsInactive",
"getShopListingInactive", "findAllShopSectionListings",
"findAllShopSectionListingsActive", "findAllCartListings"


|#


#|
 ;; v1 
 (def-api-class listing ()
   "Listing records represent an item for sale on Etsy."
   ((listing-id
     :level low
     :type int
     :doc "The numeric ID for this listing.")
    (state
     :level low
     :type string
     :doc "One of active, removed, sold_out, expired, alchemy, edit, create, private, or unavailable.")
    (user-id
     :level medium
     :type int
     :doc "The numeric ID of the user who posted the item. (User IDs are also shop IDs).")
    (title
     :level low
     :type string
     :doc "The listing's title.")
    (description
     :level high
     :type string
     :doc "A description of the item.")
    (creation-epoch
     :level low
     :type float
     :doc "The date and time the listing was posted, in epoch seconds.")
    (ending-epoch
     :level medium
     :type float
     :doc "The listing's expiration date and time, in epoch seconds.")
    (price
     :level medium
     :type float
     :doc "The item's price.")
    (currency-code
     :level medium
     :type string
     :doc "The ISO (alphabetic) code for the item's currency.")
    (quantity
     :level medium
     :type int
     :doc "The quantity of this item available for sale.")
    (tags
     :level medium
     :type string
     :doc "A dot-separated list of tags for the item.")
    (materials
     :level medium
     :type string
     :doc "A dot-separated list of materials used in the item.")
    (section-id
     :level high
     :type int
     :doc "If the shop uses sections, the numeric ID of the section to which this listing belongs.")
    (hsv-color
     :level medium
     :type hsv-color
     :doc "(int) 	The average color of the listing's primary image, in HSV format.")
    (url
     :level low
     :type string
     :doc "The full URL to the listing's page on Etsy.")
    (views
     :level medium
     :type int
     :doc "The number of times the listing has been viewed on Etsy.com (does not include API views).")
    (num-favorers
     :level high
     :type int
     :doc "The number of members who've marked this Listing as a favorit")
    (image-url-25x25
     :level low
     :type string
     :doc "The full URL to a 25x25 thumbnail of the listing's image.")
    (image-url-50x50
     :level low
     :type string
     :doc "The full URL to a 50x50 thumbnail of the listing's image.")
    (image-url-75x75
     :level low
     :type string
     :doc "The full URL to a 75x75 thumbnail of the listing's image.")
    (image-url-155x125
     :level low
     :type string
     :doc "The full URL to a 155x125 thumbnail of the listing's image.")
    (image-url-200x200
     :level low
     :type string
     :doc "The full URL to a 200x200 thumbnail of the listing's image.")
    (image-url-430xN
     :level low
     :type string
     :json-key :IMAGE_URL_430X-N
     :doc "The full URL to the listing's image, always 430 pixels wide.")
    (sold-out-epoch
     :level medium
     :type float
     :doc "When the item sold out.")
    (user-name
     :level medium
     :type string
     :doc "The login name of the user who posted the item.")
    (rgb-color
     :level medium
     :type rgb-color
     :doc "The average color of the listing's primary image, in RGB hexadecimal (\"web\") format.")
    (lat
     :level high
     :type float
     :doc "The latitude of the user selling the item (may be blank).")
    (lon
     :level high
     :type float
     :doc "The longitude of the user selling the item (may be blank).")
    (city
     :level high
     :type string
     :doc "The user's city and state (user-supplied; may be blank).")
    (section-title
     :level high
     :type string
     :doc "The title of the section to which this listing belongs.")
    (favorite-creation-epoch
     :level favorites
     :type float
     :doc "The date and time that the user was favorited (only available in the command getFavoriteListingsOfUser.)")
    (user-image-id
     :level high
     :type int
     :doc "No idea what this is")
    (all-images
     :level high
     :type image-booklet
     :doc "A list of set objects")))
|#

;; v2
;; (def-api-class listing ()
;;   "Listing records represent an item for sale on Etsy."
;;   ((listing-id
;;     :level low
;;     :type int
;;     :doc "The numeric ID for this listing.")
;;    (state
;;     :level low
;;     :type string
;;     :doc "One of active, removed, sold_out, expired, alchemy, edit, create, private, or unavailable.
;; A state may be editable or non-editable. A state may be reneable or non-renewable.
;;   active   - The listing is currently for sale - editable renewable
;;   removed  - The Listing has been removed by its owner. non-editable non-renewable
;;   sold_out - The Listing has sold out.
;;              *Sold out listings may be edited, but active=true will only be
;;              honored if renew=true is aso passed. Users will be billed for this
;;              action. Otherwise, the listing will remain in the expired
;;              state. Note that when editing a sold out listing, you will need to
;;              update the quantity to a value greater than zero. - editable
;;              renewable
;;  expired - The Listing has expired.
;;            **Expired listings can be edited, but active=true will only be
;;              honored if renew=true is also passed. Users will be billed for this
;;              action. Otherwise, the listing will remain in the expired state. -
;;              editable renewable
;;  alchemy - Deprecated; please ignore.
;;  edit    - The Listing is inactive. \(For legacy reasons, this displays as \"edit\".\)
;;            non-editable non-renewable
;;  draft   - Draft listings are listings that have been saved prior to their first
;;            activation. The API can create draft listings, and also make draft listings
;;            active, but note that a listing in any other state cannot be moved to draft,
;;            nor can a draft listing be moved to any state other than active.
;;            non-editable non-renewable
;;  create  - Deprecated. The Listing is currently being edited by the owner (as
;;            part of the initial Listing creation.)
;;  private - The owner of the Listing has requested that it not appear in API results.m
;;            non-editable non-renewable
;;  unavailable - The Listing has been removed by Etsy admin for unspecified reasons.
;;                non-editable non-renewable")
;;     user_id
;;    (user-id
;;     :level medium
;;     :type int
;;     :doc "The numeric ID of the user who posted the item. (User IDs are also shop IDs).")
;;    ;; V2 category_id
;;     (category-id
;;     :level high ;; ???
;;     :type int
;;     :doc "The numeric ID of the listing's category.")
;;    (title
;;     :level low
;;     :type string
;;     :doc "The listing's title.")
;;    (description
;;     :level high
;;     :type string
;;     :doc "A description of the item.")
;;    ;; v2 creation_tsz v1 was creation-epoch
;;    (creation-tsz
;;     :level low
;;     :type float
;;     :doc "The date and time the listing was posted, in epoch seconds.")
;;    ;; v2 ending_tsz v1 was ending-epoch
;;    (ending-tsz
;;     :level medium
;;     :type float
;;     :doc "The listing's expiration date and time, in epoch seconds.")
;;    ;; v2 original_creation_tsz
;;    (original-creation-tsz
;;     :level medium ; ???
;;     :type float 
;;     :doc "The date and time the listing was originally posted, in epoch seconds.")

;;    ;; v2 last_modified_tsz
;;    (last-modified-tsz
;;     :level medium ;; ???
;;     :type float 
;;     :doc "The date and time the listing was updated, in epoch seconds.")
;;    (price
;;     :level medium
;;     :type float
;;     :doc "The item's price.")
;;    (currency-code
;;     :level medium
;;     :type string
;;     :doc "The ISO (alphabetic) code for the item's currency.")
;;    (quantity
;;     :level medium
;;     :type int
;;     :doc "The quantity of this item available for sale.")
;;    (tags
;;     :level medium
;;     :type "array(string)"
;;     :doc "A list of tags for the item.")
;;    ;; v2 category_path
;;    (category-path
;;      :level medium
;;      :type "array(string)"
;;      :doc "Name of the category of the item and the names of categories in that hierarchy.")
;;    ;; v2
;;    (materials
;;     :level medium ; ???
;;     :type "array(string)"
;;     :doc "A list of materials used in the item.")
;;    ;; v2 shop_section_id
;;    ;; (shop-section-id
;;    ;;  :level high
;;    ;;  :type int
;;    ;;  :doc "The numeric ID of the shop section for this listing, can be null.")
;;    ;; v2 featured_rank
;;    (featured-rank 
;;     :level medium  ;???
;;     :type int
;;     :doc "Search relevancy score (only when sorting a search on \"score\").")
;;    ;; v2 state_tsz
;;    (state-tsz
;;     :level medium ; ???
;;     :type float
;;     :doc "The time at which the listing last changed state.")
;;    ;; v2 replaces v1's hsv-color
;;    (hue
;;     :level medium ; ???
;;     :type  int
;;     :doc "The average color of the listing's primary image, in HSV format.")
;;    (saturation
;;     :level medium ; ???
;;     :type int
;;     :doc "The saturation of the listing's primary image (HSV color)." )
;;    (brightness
;;     :level medium ;???
;;     :type int
;;     :doc "The value of the listing's primary image (HSV color).")
;;    ;; v2 is_black_and_white
;;    (is-black-and-white
;;     :level medium ;???
;;     :type boolean
;;     :doc "True if the listing's primary image is in black & white.")
;;    (url
;;     :level low
;;     :type string
;;     :doc "The full URL to the listing's page on Etsy.")
;;    (views
;;     :level medium
;;     :type int
;;     :doc "The number of times the listing has been viewed on Etsy.com (does not include API views).")
;;    (num-favorers
;;     :level high
;;     :type int
;;     :doc "The number of members who've marked this Listing as a favorit")
;;    ;; v2 who_made
;;    (who-made
;;     :level medium ;???
;;     :type "enum(i_did, collective, someone_else)"
;;     :doc "Who made the item being listed.")
;;    ;; v2 is_supply
;;    (is-supply
;;     :level medium ;???
;;     :type boolean
;;     :doc "True if the listing is a supply.")
;;    ;; v2 when_made
;;    (when-made
;;     :level medium ;???
;;     :type "enum(made_to_order, 2010_2012, 2000_2009, 1993_1999, before_1993, 1990_1992, 1980s, 1970s, 1960s, 1950s, 1940s, 1930s, 1920s, 1910s, 1900s, 1800s, 1700s, before_1700)"
;;     :doc "When was the item made. ")
;;    (recipient
;;     :level medium ;???
;;     :type "enum(men, women, unisex_adults, teen_boys, teen_girls, teens, boys, girls, children, baby_boys, baby_girls, babies, birds, cats, dogs, pets)"
;;     :doc "Who is this listing for. ")   
;;    (occasion
;;     :level medium ;???
;;     :type "enum(anniversary, baptism, bar_or_bat_mitzvah, birthday, canada_day, chinese_new_year, cinco_de_mayo, confirmation, christmas, day_of_the_dead, easter, eid, engagement, fathers_day, get_well, graduation, halloween, hanukkah, housewarming, kwanza, prom, july_4th, mothers_day, new_baby, new_years, quinceanera, retirement, st_patricks_day, sweet_16, sympathy, thanksgiving, valentines, wedding)"
;;     :doc "What is the occasion for this listing.")
;;    (style
;;    :level medium ;???
;;    :type "array(string)"
;;    :doc "Style of this listing. Each style is a free-form text string such as "Formal", or "Steampunk". A Listing may have up to two styles.")))
;; (defmethod print-object ((x listing) stream)
;;   (dumb-printing stream x "~D: ~A" listing-id title))
;;
;;; ==============================



;; Does this appear in v2? maybe this is a treasury?
(def-api-class gift-guide ()
  "Gift guides display summary information about each gift guide on the Etsy website.
Gift Guides don't support the detail_level parameter; all fields are available at all times."
  ((guide-id
    :level :low
    :type int
    :doc "The numeric ID of this guide.")
   (creation-tsz-epoch
    :level :low
    :type float
    :doc "The date and time the gift guide was created, in epoch seconds.")
   (description
    :level :low
    :type string
    :doc "A short description of the guide")
   (title
    :level :low 
    :type string
    :doc "The guide's main title.")
   (display-order
    :level :low
    :type int 
    :doc "A field on which the guides can be sorted.")
   (guide-section-id
    :level :low
    :type int
    :doc "The numeric ID of the guide's parent section.")
   (guide-section-title
    :level :low
    :type string
    :doc "The title of the guide's parent section.")))

(defmethod print-object ((x gift-guide) stream)
  (dumb-printing stream x "~D: ~A" guide-id title))

#|

 (URL `http://www.etsy.com/developers/documentation/reference/feedback'
 (URL `http://www.etsy.com/developers/documentation/reference/feedback#section_fields')

Field 	         Visibility 	   Permission 	Type 	Description
------------------------------------------------------------------------------
feedback_id 	    public 	   none	        int
The feedback record's numeric ID.

transaction_id 	    public/private feedback_r 	int
The transaction's numeric ID.

creator_user_id     public/private feedback_r 	int
The numeric ID of the user who wrote this feedback. 
Note: This field may be absent, depending on the buyer's privacy settings.

target_user_id 	    public/private feedback_r 	int
The numeric ID of the user who received this feedback.
Note: This field may be absent, depending on the buyer's privacy settings.

seller_user_id 	    public/private feedback_r 	int
The numeric ID of the user who was the seller in this transaction.

buyer_user_id 	    public/private feedback_r 	int
The numeric ID of the user who was the buyer in this transaction.
Note: This field may be absent, depending on the buyer's privacy settings.

creation_tsz 	    public 	   none 	float
Creation time, in epoch seconds.

message 	    public 	   none 	string
A message left by the author, explaining the feedback.

value 	            public 	   none 	int
The feedback's value; 1 is positive, -1 is negative, and 0 is neutral.

image_feedback_id   public/private feedback_r 	int
The numeric ID of the feedback's image (if present).
Note: This field may be absent, depending on the buyer's privacy settings.

image_url_25x25     public/private feedback_r 	string
The url to a photo provided with the feedback, dimensions 25x25.
Note: This field may be absent, depending on the buyer's privacy settings.

image_url_155x125   public/private feedback_r 	string 
The url to a photo provided with the feedback, dimensions 155x125.
Note: This field may be absent, depending on the buyer's privacy settings.

image_url_fullxfull public/private feedback_r 	string 
The url to a photo provided with the feedback, dimensions fullxfull.
Note: This field may be absent, depending on the buyer's privacy settings. 

;; "findAllUserFeedbackAsAuthor", "findAllUserFeedbackAsSeller", "findAllUserFeedbackAsSubject", "findAllFeedbackFromBuyers", "findAllFeedbackFromSellers"
|#

(def-api-class feedback ()
  "Feedback records represent a comment left by either the buyer or seller in a transaction.
Every sale on Etsy creates two opportunities for a user to leave feedback:
 - one by the buyer commenting on the seller
 - a second by the seller commenting on the buyer"
  ((feedback-id
    :type int
    :doc "The numeric ID of the feedback record.")
   (listing-id
    :type int
    :doc "The numeric ID of the sold item.")
   (title
    :type string
    :doc "The sold item's title.")
   (url
    :type string
    :doc "The fully-qualified URL to the sold item's listing page.")
   (creation-epoch
    :type float
    :doc "The date and time the feedback was posted, in epoch seconds.")
   (author-user-id
    :type int
    :doc "The user ID of the person user leaving the feedback.")
   (subject-user-id
    :type int
    :doc "The user ID of the person receiving feedback.")
   (seller-user-id
    :type int
    :doc "The user ID of the user acting as seller in this transaction.")
   (buyer-user-id
    :type int
    :doc "The user ID of the user acting as buyer in this transaction.")
   (message
    :type string
    :doc "A short message, left by the author.")
   (disposition
    :type enum-to-keyword
    :doc "One of positive, neutral or negative.")
   (value
    :type int
    :doc "The numeric value of the feedback disposition (-1..1).")
   (image-url-25x25
    :type string
    :doc "The full URL to a thumbnail of an image posted by the feedback author (may be blank).")
   (image-url-fullxfull
    :type string
    :doc "The full URL to an image posted by the feedback author (may be blank).")))

(defmethod print-object ((x feedback) stream)
  (dumb-printing stream x "~D: ~A ~A" feedback disposition title))

#|

ApiMethod - A method call from the Etsy API.
Fields

Field 	    Visibility Level 	Permission Scope 	Type 	  Description
-----------------------------------------------------------------------------
name 	    public 	        none 	                string 	  The method's descriptive name.

uri 	    public 	        none 	                string 	  The method's URI pattern.
                                                                  Parameters are marked with a leading colon.

params 	    public 	        none 	                ParamList An array of method parameters and types.

defaults    public 	        none 	                ParamList An array of default values for parameters.
                                                                  Parameters that lack a default are required.
type 	    public 	        none 	                string 	  The resource type returned by the method.

visibility  public 	        none 	                string 	  The method's visibility level.
                                                                  Methods marked "private" require authentication.
http_method public 	        none 	                string 	 The HTTP method used to call the API method.

|#

(def-api-class api-method ()
  "Method records are returned by the getMethodTable command, which lists all
the functionality available in the Etsy API.
Method records don't support the detail_level parameter; all fields are
available at all times."
  ((name
    :level :low
    :type string
    ;; v2
    ;; doc "The method's descriptive name."
    :doc "The name for this Method")
   ;; not in v2
   ;;  was this even present in the v1???
   (description
    :level :low
    :type string
    :doc "A bit-o documenation")
   (uri
    :level :low
    :type string
    ;; v2
    ;; :doc "The method's URI pattern.
    ;;       Parameters are marked with a leading colon."
    :doc "A template for the URL")
   (params
    :level :low
    :type method-parameter-table ; ParamList
    ;; v2
    ;; :doc "An array of method parameters and types."
    :doc "A json dictionary of parameter names and their types.")
   (type
    :level :low
    :type string
    :doc "The type of the result elements")

   (http-method
    :level :low
    :type enum-to-keyword
    ;; v2
    ;; :doc "The HTTP method used to call the API method."
    :doc "The HTTP method, currently always GET")

   ;; v2
   ;; (visibility
   ;;  :level :low ;; ???
   ;;  :type string
   ;;  :doc "The method's visibility level.
   ;;        Methods marked \"private\" require authentication.")
   ;;
   ;; v2
   ;; (defaults
   ;;  :level :low  ; ???
   ;;  :type  method-parameter-table ; ParamList
   ;; :doc "An array of default values for parameters.
   ;;      Parameters that lack a default are required.")
   ))

(defun demarshall-method-parameter-table (x)
  x)

(defun demarshall-method (x)
  "Since method is locked, we avoid overloading it."
  (demarshall-api-method x))

(defmethod print-object ((x api-method) stream)
  (dumb-printing stream x "~a -> ~a" name type))
