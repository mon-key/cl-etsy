;;; :FILE-CREATED <Timestamp: #{2012-07-10T11:53:18-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-listing-class.lisp
;;; ==============================

;; this class originally defined in cl-etsy/types.lisp

(in-package #:cl-etsy)


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

;; v2
(def-api-class listing ()
  "Listing records represent an item for sale on Etsy."
  (
   ;; listing_id
   (listing-id
    :level low
    :type int
    :doc "The numeric ID for this listing.")

   (state
    :level low
    :type string
    :doc "One of active, removed, sold_out, expired, alchemy, edit, create, private, or unavailable.
A state may be editable or non-editable. A state may be reneable or non-renewable.

  active   - The listing is currently for sale - editable renewable
  removed  - The Listing has been removed by its owner. non-editable non-renewable
  sold_out - The Listing has sold out.
             *Sold out listings may be edited, but active=true will only be
             honored if renew=true is aso passed. Users will be billed for this
             action. Otherwise, the listing will remain in the expired
             state. Note that when editing a sold out listing, you will need to
             update the quantity to a value greater than zero. - editable
             renewable
 expired - The Listing has expired.
           **Expired listings can be edited, but active=true will only be
             honored if renew=true is also passed. Users will be billed for this
             action. Otherwise, the listing will remain in the expired state. -
             editable renewable
 alchemy - Deprecated; please ignore.
 edit    - The Listing is inactive. \(For legacy reasons, this displays as \"edit\".\)
           non-editable non-renewable
 draft   - Draft listings are listings that have been saved prior to their first
           activation. The API can create draft listings, and also make draft listings
           active, but note that a listing in any other state cannot be moved to draft,
           nor can a draft listing be moved to any state other than active.
           non-editable non-renewable

 create  - Deprecated. The Listing is currently being edited by the owner (as
           part of the initial Listing creation.)
 private - The owner of the Listing has requested that it not appear in API results.m
           non-editable non-renewable
 unavailable - The Listing has been removed by Etsy admin for unspecified reasons.
               non-editable non-renewable")
   ;; user_id
   (user-id
    :level medium
    :type int
    :doc "The numeric ID of the user who posted the item. (User IDs are also shop IDs).")

   ;; category_id
   (category-id
    :level high ;; ???
    :type int
    :doc "The numeric ID of the listing's category.")

   (title
    :level low
    :type string
    :doc "The listing's title.")
   
   (description
    :level high
    :type string
    :doc "A description of the item.")

   ;; creation_tsz v1 was creation-epoch
   (creation-tsz
    :level low
    :type float
    :doc "The date and time the listing was posted, in epoch seconds.")

   ;; ending_tsz v1 was ending-epoch
   (ending-tsz
    :level medium
    :type float
    :doc "The listing's expiration date and time, in epoch seconds.")

   ;; original_creation_tsz
   (original-creation-tsz
    :level medium ; ???
    :type float 
    :doc "The date and time the listing was originally posted, in epoch seconds.")

   ;; last_modified_tsz
   (last-modified-tsz
    :level medium ;; ???
    :type float 
    :doc "The date and time the listing was updated, in epoch seconds.")

   (price
    :level medium
    :type float
    :doc "The item's price.")

   ;; currency_code
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
    :type "array(string)"
    :doc "A list of tags for the item.")

   ;; category_path
   (category-path
     :level medium
     :type "array(string)"
     :doc "Name of the category of the item and the names of categories in that hierarchy.")

   (materials
    :level medium ; ???
    :type "array(string)"
    :doc "A list of materials used in the item.")

   ;; v2 shop_section_id
   (shop-section-id
    :level high
    :type int ; or null
    :doc "The numeric ID of the shop section for this listing, may be null.")

   ;; featured_rank
   (featured-rank 
    :level medium  ;???
    :type int
    :doc "Search relevancy score (only when sorting a search on \"score\").")

   ;; state_tsz
   (state-tsz
    :level medium ; ???
    :type float
    :doc "The time at which the listing last changed state.")

   ;; replaces v1's hsv-color
   (hue
    :level medium ; ???
    :type  int
    :doc "The average color of the listing's primary image, in HSV format.")

   (saturation
    :level medium ; ???
    :type int
    :doc "The saturation of the listing's primary image (HSV color)." )
   
   (brightness
    :level medium ;???
    :type int
    :doc "The value of the listing's primary image (HSV color).")

   ;; v2 is_black_and_white
   (is-black-and-white
    :level medium ;???
    :type boolean
    :doc "True if the listing's primary image is in black & white.")

   (url
    :level low
    :type string
    :doc "The full URL to the listing's page on Etsy.")

   (views
    :level medium
    :type int
    :doc "The number of times the listing has been viewed on Etsy.com (does not include API views).")

   ;; num_favorers
   (num-favorers
    :level high
    :type int
    :doc "The number of members who've marked this Listing as a favorit")

   ;; The fields who_made, when_made and is_supply are the so-called "Marketplace Attributes"
   ;; that help buyers locate a Listing under the headings Handmade, Vintage, and Supplies.
   ;; When creating new Listings, these parameters are required.
   ;; As of this writing, not all Listings on Etsy have their Marketplace Attributes set.
   ;; These Listings will return null in these fields.
   ;; (URL `http://www.etsy.com/developers/documentation/reference/listing#section_marketplace_attributes')

   ;; :NOTE when-made, who-made, occasion, recipient are all enum DataTypes 
   ;; (URL `http://www.etsy.com/developers/documentation/reference/datatype')

   ;; (URL `http://www.etsy.com/developers/documentation/reference/datatype#method_describewhomadeenum')
   ;; who_made
   (who-made
    :level medium ;???
    :type "enum(i_did, collective, someone_else)"
    :doc "Who made the item being listed.")

   ;; is_supply
   (is-supply
    :level medium ;???
    :type boolean
    :doc "True if the listing is a supply.")
   
   ;; (URL `http://www.etsy.com/developers/documentation/reference/datatype#method_describewhenmadeenum')
   ;; when_made
   (when-made
    :level medium ;???
    :type "enum(made_to_order, 2010_2012, 2000_2009, 1993_1999, before_1993, 1990_1992, 1980s, 1970s, 1960s, 1950s, 1940s, 1930s, 1920s, 1910s, 1900s, 1800s, 1700s, before_1700)"
    :doc "When the listed item was made.")

   ;; (URL `http://www.etsy.com/developers/documentation/reference/datatype#method_describerecipientenum')
   (recipient
    :level medium ;???
    :type "enum(men, women, unisex_adults, teen_boys, teen_girls, teens, boys, girls, children, baby_boys, baby_girls, babies, birds, cats, dogs, pets)"
    :doc "Who this listing is for.")   

   ;; (URL `http://www.etsy.com/developers/documentation/reference/datatype#method_describeoccasionenum')
   (occasion
    :level medium ;???
    :type "enum(anniversary, baptism, bar_or_bat_mitzvah, birthday, canada_day, chinese_new_year, cinco_de_mayo, confirmation, christmas, day_of_the_dead, easter, eid, engagement, fathers_day, get_well, graduation, halloween, hanukkah, housewarming, kwanza, prom, july_4th, mothers_day, new_baby, new_years, quinceanera, retirement, st_patricks_day, sweet_16, sympathy, thanksgiving, valentines, wedding)"
    :doc "The occasion for this listing.")

   (style
   :level medium ;???
   :type "array(string)"
   :doc "Style(s) of this listing. A Listing may have up to two styles. Each style is a free-form text string such as \"Formal\", or \"Steampunk\".")))

(defmethod print-object ((x listing) stream)
  (dumb-printing stream x "~D: ~A" listing-id title))


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

;;; ==============================
;;; EOF
