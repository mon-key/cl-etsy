;;; :FILE-CREATED <Timestamp: #{2012-07-10T11:53:18-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-listing-class.lisp
;;; ==============================


#|

 (URL `http://www.etsy.com/developers/documentation/reference/listing')
 (URL `http://www.etsy.com/developers/documentation/reference/listing#section_fields')


  Searching Listings
 
  By default, the method findAllListingActive returns all active Listings on Etsy,
  paginated by date. Use the optional parameters (such as keyword, min_price,
  etc.) to narrow these results. The sort_order and sort_on parameters can be used
  to change the order of returned results. Note that these parameters are only
  available when using sort options. Without sort options, they will be ignored
  (and Listings will be returned newest-first.)
 
  To search within a shop, use findAllShopListingsActive.
  (URL `http://www.etsy.com/developers/documentation/reference/listing#section_searching_listings')



----
API-ASSOCIATIONS

:association User
:visibility public
:perm-scope none
:type User
:documentation "The user who posted the listing."

:association Shop
:visibility public
:perm-scope none
:type Shop
:documentation "The shop to which the listing belongs."

:association Section
:visibility public
:perm-scope none
:type ShopSection
:documentation "The shop section to which the listing belongs."

:association Images
:visibility public
:perm-scope none
:type array(ListingImage)
:documentation "An array of images for the listing."

:association MainImage
:visibility public
:perm-scope none
:type ListingImage
:documentation "The main image associated with this Listing."

:association ShippingInfo
:visibility public
:perm-scope none
:type array(ShippingInfo)
:documentation "An array of destinations and shipping prices for this listing."

:association PaymentInfo
:visibility public
:perm-scope none
:type array(PaymentTemplate)
:documentation "An array of accepted payment methods for this listing."

:association Translations
:visibility public
:perm-scope none
:type array(ListingTranslation)
:documentation "An array of translations for this Listing."

----
API-METHODS

"createListing"
"getListing"
"updateListing"
"deleteListing"
"findAllListingActive"
"findAllListingsForFeaturedTreasuryId",
"findAllActiveListingsForFeaturedTreasuryId"
"findAllFeaturedListings",
"findAllCurrentFeaturedListings"
"findAllReceiptListings",
"findAllShopListingsActive"
"findAllShopListingsDraft",
"findAllShopListingsExpired"
"getShopListingExpired",
"findAllShopListingsFeatured"
"findAllShopListingsInactive",
"getShopListingInactive"
"findAllShopSectionListings",
"findAllShopSectionListingsActive"
"findAllCartListings"

|#

(in-package #:cl-etsy)

; Listing
(defclass listing (base-etsy)
  ;; listing_id
  ((listing-id
    :initarg :listing-id
    :accessor listing-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The listing's numeric ID.")

   (state
    :initarg :state
    :accessor state
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "One of active, removed, sold_out, expired, alchemy, edit, create, private, or unavailable.
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
    :initarg :user-id
    :accessor user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the user who posted the item.")

   ;; category_id
   (category-id
    :initarg :category-id
    :accessor category-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the listing's category.")

   (title
    :initarg :title
    :accessor title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The listing's title.")

   (description
    :initarg :description
    :accessor description
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A description of the item.")

   ;; creation_tsz v1 was creation-epoch
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "Creation time, in epoch seconds.")

   ;; ending_tsz v1 was ending-epoch
   (ending-tsz
    :initarg :ending-tsz
    :accessor ending-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The listing's expiration date and time, in epoch seconds.")

   ;; original_creation_tsz
   (original-creation-tsz
    :initarg :original-creation-tsz
    :accessor original-creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The date and time the listing was originally posted, in epoch seconds.")

   ;; last_modified_tsz
   (last-modified-tsz
    :initarg :last-modified-tsz
    :accessor last-modified-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The date and time the listing was updated, in epoch seconds.")

   (price
    :initarg :price
    :accessor price
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The item's price (will be treated as private for sold listings).")

   ;; currency_code
   (currency-code
    :initarg :currency-code
    :accessor currency-code
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The ISO (alphabetic) code for the item's currency.")

   (quantity
    :initarg :quantity
    :accessor quantity
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The quantity of this item available for sale.")

   (tags
    :initarg :tags
    :accessor tags
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(string)
    :documentation "A list of tags for the item.")

   ;; category_path
   (category-path
    :initarg :category-path
    :accessor category-path
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(string)
    :documentation "Name of the category of the item and the names of categories in that hierarchy.")

   (materials
    :initarg :materials
    :accessor materials
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(string)
    :documentation "A list of materials used in the item.")

   ;; shop_section_id
   (shop-section-id
    :initarg :shop-section-id
    :accessor shop-section-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the shop section for this listing, can be null")

   ;; featured_rank
   (featured-rank
    :initarg :featured-rank
    :accessor featured-rank
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Search relevancy score (only when sorting a search on \"score\").")

   ;; state_tsz
   (state-tsz
    :initarg :state-tsz
    :accessor state-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The time at which the listing last changed state.")

   ;; replaces v1's hsv-color (mostly)
   (hue
    :initarg :hue
    :accessor hue
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The hue of the listing's primary image (HSV color).")

   (saturation
    :initarg :saturation
    :accessor saturation
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The saturation of the listing's primary image (HSV color).")
  
   (brightness
    :initarg :brightness
    :accessor brightness
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The value of the listing's primary image (HSV color).")

   ;; is_black_and_white
   (is-black-and-white
    :initarg :is-black-and-white
    :accessor is-black-and-white
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the listing's primary image is in black & white.")

   (url
    :initarg :url
    :accessor url
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The full URL to the listing's page on Etsy.")

   (views
    :initarg :views
    :accessor views
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of times the listing has been viewed on Etsy.com (does not include API views).")

   ;; num_favorers
   (num-favorers
    :initarg :num-favorers
    :accessor num-favorers
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of members who've marked this Listing as a favorite.")

   ;; who_made
   (who-made
    :initarg :who-made
    :accessor who-made
    ;; :visibility public
    ;; :perm-scope none
    ;; :type enum(i_did, collective, someone_else)
    :documentation "Who made the item being listed.")

   ;; is_supply
   (is-supply
    :initarg :is-supply
    :accessor is-supply
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the listing is a supply.")

   ;; when_made
   (when-made
    :initarg :when-made
    :accessor when-made
    ;; :visibility public
    ;; :perm-scope none
    ;; :type enum(made_to_order, 2010_2012, 2000_2009, 1993_1999, before_1993, 1990_1992, 1980s, 1970s, 1960s, 1950s, 1940s, 1930s, 1920s, 1910s, 1900s, 1800s, 1700s, before_1700)
    :documentation "When was the item made.")

   (recipient
    :initarg :recipient
    :accessor recipient
    ;; :visibility public
    ;; :perm-scope none
    ;; :type enum(men, women, unisex_adults, teen_boys, teen_girls, teens, boys, girls, children, baby_boys, baby_girls, babies, birds, cats, dogs, pets)
    :documentation "Who is this listing for.")

   (occasion
    :initarg :occasion
    :accessor occasion
    ;; :visibility public
    ;; :perm-scope none
    ;; :type enum(anniversary, baptism, bar_or_bat_mitzvah, birthday, canada_day, chinese_new_year, cinco_de_mayo, confirmation, christmas, day_of_the_dead, easter, eid, engagement, fathers_day, get_well, graduation, halloween, hanukkah, housewarming, kwanza, prom, july_4th, mothers_day, new_baby, new_years, quinceanera, retirement, st_patricks_day, sweet_16, sympathy, thanksgiving, valentines, wedding)
    :documentation "What is the occasion for this listing.")

   (style
    :initarg :style
    :accessor style
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(string)
    :documentation "Style of this listing. A Listing may have up to two styles. 
Each style is a free-form text string such as \"Formal\", or \"Steampunk\"."))

  ;; (:default-initargs 
  ;;  :listing-id nil :state nil :user-id nil :category-id nil :title nil
  ;;  :description nil :creation-tsz nil :ending-tsz nil
  ;;  :original-creation-tsz nil :last-modified-tsz nil :price nil
  ;;  :currency-code nil :quantity nil :tags nil :category-path nil
  ;;  :materials nil :shop-section-id nil :featured-rank nil :state-tsz nil
  ;;  :hue nil :saturation nil :brightness nil :is-black-and-white nil
  ;;  :url nil :views nil :num-favorers nil :who-made nil :is-supply nil
  ;;  :when-made nil :recipient nil :occasion nil :style nil)
  
 (:documentation "Listings on Etsy are items for sale. 
Each Listing is associated with a User, and with a Shop (Users own Shops.) 
Etsy Listings have a creation date, and are valid for approximately four months.
Listings have a price and a quantity, and when they're sold out, the User must
renew them before they can be sold again.
 (URL `http://www.etsy.com/developers/documentation/reference/listing')"))

;; (defmethod print-object ((x listing) stream)
;;   (dumb-printing stream x "~D: ~A" listing-id title))


#|

 ((:NAME        . "findAllListingsForFeaturedTreasuryId")
   (:DESCRIPTION . "Finds all listings for a certain FeaturedTreasury.")
   (:URI         . "/featured_treasuries/:featured_treasury_id/listings")
   (:PARAMS
    (:FEATURED-TREASURY-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

  ((:NAME        . "findAllActiveListingsForFeaturedTreasuryId")
   (:DESCRIPTION . "Finds all active listings for a certain FeaturedTreasury.")
   (:URI         . "/featured_treasuries/:featured_treasury_id/listings/active")
   (:PARAMS
    (:FEATURED-TREASURY-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

  ((:NAME        . "findAllFeaturedListings")
   (:DESCRIPTION . "Finds all FeaturedTreasury listings.")
   (:URI         . "/featured_treasuries/listings")
   (:PARAMS
    (:LIMIT  . "int")
    (:OFFSET . "int")
    (:PAGE   . "int")
    (:REGION . "region"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE)
    (:REGION . "__ALL_REGIONS__"))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

  ((:NAME        . "findAllCurrentFeaturedListings")
   (:DESCRIPTION  . "Finds FeaturedTreasury listings that are currently displayed on a regional homepage.")
   (:URI         . "/featured_treasuries/listings/homepage_current")
   (:PARAMS
    (:REGION . "region"))
   (:DEFAULTS
    (:REGION . "US"))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

 ((:NAME        . "createListing")
   (:DESCRIPTION . "Creates a new Listing")
   (:URI         . "/listings")
   (:PARAMS
    (:QUANTITY               . "int")
    (:TITLE                  . "string")
    (:DESCRIPTION            . "text")
    (:PRICE                  . "float")
    (:MATERIALS              . "array(string)")
    (:SHIPPING-TEMPLATE-ID . "int")
    (:SHOP-SECTION-ID      . "int")
    (:IMAGE                  . "image")
    (:STATE                  . "enum(active, draft)")
    (:CATEGORY-ID           . "int")
    (:TAGS                   . "array(string)")
    (:WHO-MADE              . "enum(i_did, collective, someone_else)")
    (:IS-SUPPLY             . "boolean")
    (:WHEN-MADE
     . "enum(made_to_order, 2010_2012, 2000_2009, 1993_1999, before_1993, 1990_1992, 1980s, 1970s, 1960s, 1950s, 1940s, 1930s, 1920s, 1910s, 1900s, 1800s, 1700s, before_1700)")
    (:RECIPIENT
     . "enum(men, women, unisex_adults, teen_boys, teen_girls, teens, boys, girls, children, baby_boys, baby_girls, babies, birds, cats, dogs, pets)")
    (:OCCASION
     . "enum(anniversary, baptism, bar_or_bat_mitzvah, birthday, canada_day, chinese_new_year, cinco_de_mayo, confirmation, christmas, day_of_the_dead, easter, eid, engagement, fathers_day, get_well, graduation, halloween, hanukkah, housewarming, kwanza, prom, july_4th, mothers_day, new_baby, new_years, quinceanera, retirement, st_patricks_day, sweet_16, sympathy, thanksgiving, valentines, wedding)")
    (:STYLE . "array(string)"))
   (:DEFAULTS
    (:MATERIALS)
    (:SHOP-SECTION-ID)
    (:IMAGE)
    (:STATE . "active")
    (:TAGS)
    (:RECIPIENT)
    (:OCCASION)
    (:STYLE))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "POST"))
     
  ((:NAME        . "getListing")
   (:DESCRIPTION . "Retrieves a Listing by id.")
   (:URI         . "/listings/:listing_id")
   (:PARAMS
    (:LISTING-ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))
     
  ((:NAME        . "updateListing")
   (:DESCRIPTION . "Updates a Listing")
   (:URI         . "/listings/:listing_id")
   (:PARAMS
    (:LISTING-ID            . "int")
    (:QUANTITY               . "int")
    (:TITLE                  . "string")
    (:DESCRIPTION            . "text")
    (:PRICE                  . "float")
    (:MATERIALS              . "array(string)")
    (:RENEW                  . "boolean")
    (:SHIPPING-TEMPLATE-ID . "int")
    (:SHOP-SECTION-ID      . "int")
    (:STATE                  . "enum(active, inactive, draft)")
    (:CATEGORY-ID           . "int")
    (:TAGS                   . "array(string)")
    (:WHO-MADE              . "enum(i_did, collective, someone_else)")
    (:IS-SUPPLY             . "boolean")
    (:WHEN-MADE
     . "enum(made_to_order, 2010_2012, 2000_2009, 1993_1999, before_1993, 1990_1992, 1980s, 1970s, 1960s, 1950s, 1940s, 1930s, 1920s, 1910s, 1900s, 1800s, 1700s, before_1700)")
    (:RECIPIENT
     . "enum(men, women, unisex_adults, teen_boys, teen_girls, teens, boys, girls, children, baby_boys, baby_girls, babies, birds, cats, dogs, pets)")
    (:OCCASION
     . "enum(anniversary, baptism, bar_or_bat_mitzvah, birthday, canada_day, chinese_new_year, cinco_de_mayo, confirmation, christmas, day_of_the_dead, easter, eid, engagement, fathers_day, get_well, graduation, halloween, hanukkah, housewarming, kwanza, prom, july_4th, mothers_day, new_baby, new_years, quinceanera, retirement, st_patricks_day, sweet_16, sympathy, thanksgiving, valentines, wedding)")
    (:STYLE . "array(string)"))
   (:DEFAULTS
    (:QUANTITY)
    (:TITLE)
    (:DESCRIPTION)
    (:PRICE)
    (:MATERIALS)
    (:RENEW)
    (:SHIPPING-TEMPLATE-ID)
    (:SHOP-SECTION-ID)
    (:STATE . "active")
    (:CATEGORY-ID)
    (:TAGS)
    (:WHO-MADE)
    (:IS-SUPPLY)
    (:WHEN-MADE)
    (:RECIPIENT)
    (:OCCASION)
    (:STYLE))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "PUT"))
     
  ((:NAME        . "deleteListing")
   (:DESCRIPTION . "Deletes a Listing")
   (:URI         . "/listings/:listing_id")
   (:PARAMS
    (:LISTING-ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "DELETE"))


 ((:NAME        . "findAllListingActive")
  (:DESCRIPTION . "Finds all active Listings. (Note: the sort_on and sort_order options only work when combined with one of the search options: keywords, color, tags, materials, location, etc.)")
  (:URI         . "/listings/active")
  (:PARAMS
   (:LIMIT           . "int")
   (:OFFSET          . "int")
   (:PAGE            . "int")
   (:KEYWORDS        . "text")
   (:SORT-ON        . "enum(created, price, score)")
   (:SORT-ORDER     . "enum(up, down)")
   (:MIN-PRICE      . "float")
   (:MAX-PRICE      . "float")
   (:COLOR           . "color_triplet")
   (:COLOR-ACCURACY . "color_wiggle")
   (:TAGS            . "array(string)")
   (:MATERIALS       . "array(string)")
   (:CATEGORY        . "category")
   (:LOCATION        . "string")
   (:LAT             . "latitude")
   (:LON             . "longitude")
   (:GEO-LEVEL      . "enum(city, state, country)"))
  (:DEFAULTS
   (:LIMIT           . 25)
   (:OFFSET          . 0)
   (:PAGE)
   (:KEYWORDS)
   (:SORT-ON        . "created")
   (:SORT-ORDER     . "down")
   (:MIN-PRICE)
   (:MAX-PRICE)
   (:COLOR)
   (:COLOR-ACCURACY . 0)
   (:TAGS)
   (:MATERIALS)
   (:CATEGORY)
   (:LOCATION)
   (:LAT)
   (:LON)
   (:GEO-LEVEL      . "city"))
  (:TYPE         . "Listing")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

  ((:NAME        . "findAllReceiptListings")
   (:DESCRIPTION . "Finds all listings in a receipt")
   (:URI         . "/receipts/:receipt_id/listings")
   (:PARAMS
    (:LIMIT         . "int")
    (:OFFSET        . "int")
    (:PAGE          . "int")
    (:RECEIPT-ID   . "int")
    (:DATA-VERSION . "string"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE)
    (:DATA-VERSION))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllShopListingsActive")
  (:DESCRIPTION . "Finds all active Listings associated with a Shop")
  (:URI         . "/shops/:shop_id/listings/active")
  (:PARAMS
   (:LIMIT           . "int")
   (:OFFSET          . "int")
   (:PAGE            . "int")
   (:SHOP-ID        . "shop_id_or_name")
   (:KEYWORDS        . "string")
   (:SORT-ON        . "enum(created, price, score)")
   (:SORT-ORDER     . "enum(up, down)")
   (:MIN-PRICE      . "float")
   (:MAX-PRICE      . "float")
   (:COLOR           . "color_triplet")
   (:COLOR-ACCURACY . "color_wiggle")
   (:TAGS            . "array(string)")
   (:MATERIALS       . "array(string)")
   (:CATEGORY        . "category"))
  (:DEFAULTS
   (:LIMIT           . 25)
   (:OFFSET          . 0)
   (:PAGE)
   (:KEYWORDS)
   (:SORT-ON        . "created")
   (:SORT-ORDER     . "down")
   (:MIN-PRICE)
   (:MAX-PRICE)
   (:COLOR)
   (:COLOR-ACCURACY . 0)
   (:TAGS)
   (:MATERIALS)
   (:CATEGORY))
  (:TYPE         . "Listing")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllShopListingsDraft")
  (:DESCRIPTION . "Finds all of a Shop's draft listings")
  (:URI         . "/shops/:shop_id/listings/draft")
  (:PARAMS 
   (:SHOP-ID . "shop_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Listing")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllShopListingsExpired")
  (:DESCRIPTION . "Retrieves Listings associated to a Shop that are expired")
  (:URI         . "/shops/:shop_id/listings/expired")
  (:PARAMS
   (:SHOP-ID . "shop_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Listing")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "getShopListingExpired")
  (:DESCRIPTION . "Retrieves a Listing associated to a Shop that is inactive")
  (:URI         . "/shops/:shop_id/listings/expired/:listing_id")
  (:PARAMS
   (:SHOP-ID    . "shop_id_or_name")
   (:LISTING-ID . "int"))
  (:DEFAULTS)
  (:TYPE         . "Listing")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllShopListingsFeatured")
  (:DESCRIPTION . "Retrieves Listings associated to a Shop that are featured")
  (:URI         . "/shops/:shop_id/listings/featured")
  (:PARAMS
   (:SHOP-ID . "shop_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Listing")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllShopListingsInactive")
  (:DESCRIPTION . "Retrieves Listings associated to a Shop that are inactive")
  (:URI         . "/shops/:shop_id/listings/inactive")
  (:PARAMS
   (:SHOP-ID . "shop_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Listing")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "getShopListingInactive")
  (:DESCRIPTION . "Retrieves a Listing associated to a Shop that is inactive")
  (:URI         . "/shops/:shop_id/listings/inactive/:listing_id")
  (:PARAMS
   (:SHOP-ID    . "shop_id_or_name")
   (:LISTING-ID . "int"))
  (:DEFAULTS)
  (:TYPE         . "Listing")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllShopSectionListings")
  (:DESCRIPTION . "Finds all listings within a shop section")
  (:URI         . "/shops/:shop_id/sections/:shop_section_id/listings")
  (:PARAMS
   (:LIMIT             . "int")
   (:OFFSET            . "int")
   (:PAGE              . "int")
   (:SHOP-ID          . "shop_id_or_name")
   (:SHOP-SECTION-ID . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Listing")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

  ((:NAME        . "findAllShopSectionListingsActive")
   (:DESCRIPTION . "Finds all listings within a shop section")
   (:URI         . "/shops/:shop_id/sections/:shop_section_id/listings/active")
   (:PARAMS
    (:LIMIT             . "int")
    (:OFFSET            . "int")
    (:PAGE              . "int")
    (:SHOP-ID          . "shop_id_or_name")
    (:SHOP-SECTION-ID . "int")
    (:SORT-ON          . "enum(created, price)")
    (:SORT-ORDER       . "enum(up, down)"))
   (:DEFAULTS
    (:LIMIT       . 25)
    (:OFFSET      . 0)
    (:PAGE)
    (:SORT-ON    . "created")
    (:SORT-ORDER . "down"))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllCartListings")
  (:DESCRIPTION . "Finds all listings in a given Cart")
  (:URI         . "/users/:user_id/carts/:cart_id/listings")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:CART-ID . "cart_id"))
  (:DEFAULTS)
  (:TYPE         . "Listing")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

|#

;;; ==============================
;;; EOF
