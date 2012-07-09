;;; :FILE-CREATED <Timestamp: #{2012-06-27T10:05:46-04:00Z}#{12263} - by MON>
;;; :FILE cl-etsy/notes/cl-etsy-method-table-raw-2012-06-27.lisp
;;; ==============================

#|
 (URL `http://www.etsy.com/developers/documentation/reference/apimethod')

Field  	    Visibility 	Scope  	Type  	  Description
-----------------------------------------------------
name 	    public 	none 	string 	  The method's descriptive name.

uri 	    public 	none 	string 	  The method's URI pattern.
                                          Parameters are marked with a leading colon.

params 	    public 	none 	ParamList An array of method parameters and types.

defaults    public 	none 	ParamList An array of default values for parameters.
                                          Parameters that lack a default are required.

type 	    public 	none 	string 	  The resource type returned by the method.

visibility  public 	none 	string 	  The method's visibility level.
                                          Methods marked "private" require authentication.

http_method public 	none 	string 	  The HTTP method used to call the API method. 

----
:TYPES

ApiMethod
Int
String

Avatar
 - "uploadAvatar", "getAvatarImgSrc"

BillCharge
 - "findAllUserCharges"

BillPayment
 - "findAllUserPayments"

BillingOverview
 - "getUserBillingOverview"

Cart
 - "getAllUserCarts", "addToCart", "updateCartListingQuantity",
   "removeCartListing", "getUserCart", "updateCart", "deleteCart"

Category
 - "getCategory", "getSubCategory", "getSubSubCategory", "findAllTopCategory",
   "findAllTopCategoryChildren", "findAllSubCategoryChildren"

Country
 - "findAllCountry", "getCountry"

Coupon
 - "findAllShopCoupons", "createCoupon", "findCoupon", "updateCoupon",
   "deleteCoupon"

DataType
 - "describeOccasionEnum", "describeRecipientEnum", "describeWhenMadeEnum",
   "describeWhoMadeEnum"

FavoriteListing
 - "findAllListingFavoredBy", "findAllUserFavoriteListings",
   "findUserFavoriteListings", "createUserFavoriteListings",
   "deleteUserFavoriteListings"

FavoriteUser
 - "findAllUserFavoredBy", "findAllUserFavoriteUsers", "findUserFavoriteUsers",
   "createUserFavoriteUsers", "deleteUserFavoriteUsers"

FeaturedTreasury
 - "findAllFeaturedTreasuries", "getFeaturedTreasuryById",
   "findAllListingsForFeaturedTreasuryId",
   "findAllActiveListingsForFeaturedTreasuryId",
   "findAllFeaturedTreasuriesByOwner"

Feedback
 - "findAllUserFeedbackAsAuthor", "findAllUserFeedbackAsSeller",
   "findAllUserFeedbackAsSubject", "findAllFeedbackFromBuyers",
   "findAllFeedbackFromSellers"

ForumPost
 - "findTreasuryComments", "postTreasuryComment", "deleteTreasuryComment"

Ledger
 - "findLedger"

LedgerEntry
 - "findLedgerEntries"

Listing
 - "createListing", "getListing", "updateListing", "deleteListing"
   "findAllListingActive", "findAllListingsForFeaturedTreasuryId",
   "findAllActiveListingsForFeaturedTreasuryId", "findAllFeaturedListings",
   "findAllCurrentFeaturedListings", "findAllReceiptListings",
   "findAllShopListingsActive", "findAllShopListingsDraft",
   "findAllShopListingsExpired", "getShopListingExpired",
   "findAllShopListingsFeatured", "findAllShopListingsInactive",
   "getShopListingInactive", "findAllShopSectionListings",
   "findAllShopSectionListingsActive", "findAllCartListings"

ListingImage
 - "findAllListingImages", "uploadListingImage", "getImage_Listing", "deleteListingImage",

ListingTranslation
 - "getListingTranslation", 

Order
 - "getOrder", "findAllUserOrders"

Payment
 - "findPayment"

PaymentAdjustment
 - "findPaymentAdjustments", "findPaymentAdjustment", 

PaymentAdjustmentItem
 - "findPaymentAdjustmentItem"

PaymentTemplate
 - "createPaymentTemplate", "getPaymentTemplate", "updatePaymentTemplate",
   "findAllUserPaymentTemplates"

Receipt
 - "findAllOrderReceipts", "createReceiptOnSandbox", "updateReceipt",
   "findAllShopReceipts", "findAllShopReceiptsByStatus",
   "findAllUserBuyerReceipts"

Region
 - "findAllRegion", "getRegion"

ShippingInfo
 - "createShippingInfo", "getShippingInfo", "updateShippingInfo",
   "deleteShippingInfo", "findAllListingShippingInfo",

ShippingTemplate
 - "createShippingTemplate", "getShippingTemplate", "updateShippingTemplate",
   "deleteShippingTemplate", "findAllUserShippingTemplates"

ShippingTemplateEntry
 - "findAllShippingTemplateEntries", "createShippingTemplateEntry",
   "getShippingTemplateEntry", "updateShippingTemplateEntry",
   "deleteShippingTemplateEntry"

Shop
 - "getShop", "updateShop", "findAllUserShops", "findAllShops",
   "uploadShopBanner", "deleteShopBanner"

ShopSection
 - "findAllShopSections", "createShopSection", "getShopSection",
   "updateShopSection", "deleteShopSection",
   "getShopSectionTranslationShopSection"

ShopSectionTranslation
 - "getShopTranslation"

ShopTranslation
 - "getShopTranslation"

Style
 - "findSuggestedStyles"

Tag
 - "findPopularTags", "findAllRelatedTags"

Team
 - "findAllTeams", "findTeams", "findAllTeamsForUser", 

Transaction
 - "findAllUserBuyerTransactions", "findAllReceiptTransactions", "findAllShopTransactions", "getTransaction", 

Treasury
 - "findAllTreasuries", "createTreasury", "getTreasury", "deleteTreasury"

User
 - "findAllUsersForTeam", "findAllUsers", "getUser"

UserAddress
 - "findAllUserAddresses", "createUserAddress", "getUserAddress", "deleteUserAddress"


|#

(in-package #:cl-etsy)

(api-call "http://openapi.etsy.com/v2/"
          `(("api_key" . ,*API-KEY*)))

((:COUNT . 152)
 (:RESULTS
  ((:NAME        . "getMethodTable")
   (:DESCRIPTION . "Get a list of all methods available.")
   (:URI         . "/")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "ApiMethod")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getCategory")
   (:DESCRIPTION . "Retrieves a top-level Category by tag.")
   (:URI         . "/categories/:tag")
   (:PARAMS
    (:TAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getSubCategory")
   (:DESCRIPTION . "Retrieves a second-level Category by tag and subtag.")
   (:URI         . "/categories/:tag/:subtag")
   (:PARAMS
    (:TAG    . "string")
    (:SUBTAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getSubSubCategory")
   (:DESCRIPTION . "Retrieves a third-level Category by tag, subtag and subsubtag.")
   (:URI         . "/categories/:tag/:subtag/:subsubtag")
   (:PARAMS
    (:TAG       . "string")
    (:SUBTAG    . "string")
    (:SUBSUBTAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllCountry")
   (:DESCRIPTION . "Finds all Country.")
   (:URI         . "/countries")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "Country")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getCountry")
   (:DESCRIPTION . "Retrieves a Country by id.")
   (:URI         . "/countries/:country_id")
   (:PARAMS
    (:COUNTRY--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Country")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllFeaturedTreasuries")
   (:DESCRIPTION . "Finds all FeaturedTreasuries.")
   (:URI         . "/featured_treasuries")
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
   (:TYPE         . "FeaturedTreasury")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getFeaturedTreasuryById")
   (:DESCRIPTION . "Finds FeaturedTreasury by numeric ID.")
   (:URI         . "/featured_treasuries/:featured_treasury_id")
   (:PARAMS
    (:FEATURED--TREASURY--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "FeaturedTreasury")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllListingsForFeaturedTreasuryId")
   (:DESCRIPTION . "Finds all listings for a certain FeaturedTreasury.")
   (:URI         . "/featured_treasuries/:featured_treasury_id/listings")
   (:PARAMS
    (:FEATURED--TREASURY--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllActiveListingsForFeaturedTreasuryId")
   (:DESCRIPTION . "Finds all active listings for a certain FeaturedTreasury.")
   (:URI         . "/featured_treasuries/:featured_treasury_id/listings/active")
   (:PARAMS
    (:FEATURED--TREASURY--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

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
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllCurrentFeaturedListings")
   (:DESCRIPTION  . "Finds FeaturedTreasury listings that are currently displayed on a regional homepage.")
   (:URI         . "/featured_treasuries/listings/homepage_current")
   (:PARAMS
    (:REGION . "region"))
   (:DEFAULTS
    (:REGION . "US"))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findAllFeaturedTreasuriesByOwner")
   (:DESCRIPTION . "Finds all FeaturedTreasury by numeric owner_id.")
   (:URI         . "/featured_treasuries/owner/:owner_id")
   (:PARAMS
    (:LIMIT     . "int")
    (:OFFSET    . "int")
    (:PAGE      . "int")
    (:OWNER--ID . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "FeaturedTreasury")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "createListing")
   (:DESCRIPTION . "Creates a new Listing")
   (:URI         . "/listings")
   (:PARAMS
    (:QUANTITY               . "int")
    (:TITLE                  . "string")
    (:DESCRIPTION            . "text")
    (:PRICE                  . "float")
    (:MATERIALS              . "array(string)")
    (:SHIPPING--TEMPLATE--ID . "int")
    (:SHOP--SECTION--ID      . "int")
    (:IMAGE                  . "image")
    (:STATE                  . "enum(active, draft)")
    (:CATEGORY--ID           . "int")
    (:TAGS                   . "array(string)")
    (:WHO--MADE              . "enum(i_did, collective, someone_else)")
    (:IS--SUPPLY             . "boolean")
    (:WHEN--MADE
     . "enum(made_to_order, 2010_2012, 2000_2009, 1993_1999, before_1993, 1990_1992, 1980s, 1970s, 1960s, 1950s, 1940s, 1930s, 1920s, 1910s, 1900s, 1800s, 1700s, before_1700)")
    (:RECIPIENT
     . "enum(men, women, unisex_adults, teen_boys, teen_girls, teens, boys, girls, children, baby_boys, baby_girls, babies, birds, cats, dogs, pets)")
    (:OCCASION
     . "enum(anniversary, baptism, bar_or_bat_mitzvah, birthday, canada_day, chinese_new_year, cinco_de_mayo, confirmation, christmas, day_of_the_dead, easter, eid, engagement, fathers_day, get_well, graduation, halloween, hanukkah, housewarming, kwanza, prom, july_4th, mothers_day, new_baby, new_years, quinceanera, retirement, st_patricks_day, sweet_16, sympathy, thanksgiving, valentines, wedding)")
    (:STYLE . "array(string)"))
   (:DEFAULTS
    (:MATERIALS)
    (:SHOP--SECTION--ID)
    (:IMAGE)
    (:STATE . "active")
    (:TAGS)
    (:RECIPIENT)
    (:OCCASION)
    (:STYLE))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))
     
  ((:NAME        . "getListing")
   (:DESCRIPTION . "Retrieves a Listing by id.")
   (:URI         . "/listings/:listing_id")
   (:PARAMS
    (:LISTING--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "updateListing")
   (:DESCRIPTION . "Updates a Listing")
   (:URI         . "/listings/:listing_id")
   (:PARAMS
    (:LISTING--ID            . "int")
    (:QUANTITY               . "int")
    (:TITLE                  . "string")
    (:DESCRIPTION            . "text")
    (:PRICE                  . "float")
    (:MATERIALS              . "array(string)")
    (:RENEW                  . "boolean")
    (:SHIPPING--TEMPLATE--ID . "int")
    (:SHOP--SECTION--ID      . "int")
    (:STATE                  . "enum(active, inactive, draft)")
    (:CATEGORY--ID           . "int")
    (:TAGS                   . "array(string)")
    (:WHO--MADE              . "enum(i_did, collective, someone_else)")
    (:IS--SUPPLY             . "boolean")
    (:WHEN--MADE
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
    (:SHIPPING--TEMPLATE--ID)
    (:SHOP--SECTION--ID)
    (:STATE . "active")
    (:CATEGORY--ID)
    (:TAGS)
    (:WHO--MADE)
    (:IS--SUPPLY)
    (:WHEN--MADE)
    (:RECIPIENT)
    (:OCCASION)
    (:STYLE))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))
     
  ((:NAME        . "deleteListing")
   (:DESCRIPTION . "Deletes a Listing")
   (:URI         . "/listings/:listing_id")
   (:PARAMS
    (:LISTING--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))
     
  ((:NAME        . "findAllListingFavoredBy")
   (:DESCRIPTION . "Retrieves a set of FavoriteListing objects associated to a Listing.")
   (:URI         . "/listings/:listing_id/favored-by")
   (:PARAMS
    (:LISTING--ID . "int")
    (:LIMIT       . "int")
    (:OFFSET      . "int")
    (:PAGE        . "int"))
   (:DEFAULTS
    (:LIMIT . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "FavoriteListing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findAllListingImages")
   (:DESCRIPTION . "Retrieves a set of ListingImage objects associated to a Listing.")
   (:URI         . "/listings/:listing_id/images")
   (:PARAMS
    (:LISTING--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ListingImage")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "uploadListingImage")
   (:DESCRIPTION . "Upload a new listing image")
   (:URI         . "/listings/:listing_id/images")
   (:PARAMS
    (:LISTING--ID . "int")
    (:IMAGE       . "image")
    (:RANK        . "int"))
   (:DEFAULTS
    (:RANK . 1))
   (:TYPE         . "ListingImage")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))
     
  ((:NAME        . "getImage_Listing")
   (:DESCRIPTION . "Retrieves a Image_Listing by id.")
   (:URI         . "/listings/:listing_id/images/:listing_image_id")
   (:PARAMS
    (:LISTING--IMAGE--ID . "array(int)")
    (:LISTING--ID        . "int"))
   (:DEFAULTS)
   (:TYPE         . "ListingImage")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "deleteListingImage")
   (:DESCRIPTION . "Deletes a listing image")
   (:URI         . "/listings/:listing_id/images/:listing_image_id")
   (:PARAMS
    (:LISTING--ID        . "int")
    (:LISTING--IMAGE--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ListingImage")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))
     
  ((:NAME        . "findAllListingShippingInfo")
   (:DESCRIPTION
    . "Retrieves a set of ShippingInfo objects associated to a Listing.")
   (:URI         . "/listings/:listing_id/shipping/info")
   (:PARAMS
    (:LISTING--ID . "int")
    (:LIMIT       . "int")
    (:OFFSET      . "int")
    (:PAGE        . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "ShippingInfo")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "createShippingInfo")
   (:DESCRIPTION . "Creates a new ShippingInfo.")
   (:URI         . "/listings/:listing_id/shipping/info")
   (:PARAMS
    (:ORIGIN--COUNTRY--ID      . "int")
    (:DESTINATION--COUNTRY--ID . "int")
    (:PRIMARY--COST            . "float")
    (:SECONDARY--COST          . "float")
    (:REGION--ID               . "int")
    (:LISTING--ID              . "int"))
   (:DEFAULTS
    (:DESTINATION--COUNTRY--ID)
    (:REGION--ID))
   (:TYPE         . "ShippingInfo")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))
     
  ((:NAME        . "getListingTranslation")
   (:DESCRIPTION . "Retrieves a ListingTranslation by listing_id and language")
   (:URI         . "/listings/:listing_id/translations/:language")
   (:PARAMS
    (:LISTING--ID . "int")
    (:LANGUAGE    . "language"))
   (:DEFAULTS)
   (:TYPE         . "ListingTranslation")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findAllListingActive")
   (:DESCRIPTION
    . "Finds all active Listings. (Note: the sort_on and sort_order options only work when combined with one of the search options: keywords, color, tags, materials, location, etc.)")
   (:URI         . "/listings/active")
   (:PARAMS
    (:LIMIT           . "int")
    (:OFFSET          . "int")
    (:PAGE            . "int")
    (:KEYWORDS        . "text")
    (:SORT--ON        . "enum(created, price, score)")
    (:SORT--ORDER     . "enum(up, down)")
    (:MIN--PRICE      . "float")
    (:MAX--PRICE      . "float")
    (:COLOR           . "color_triplet")
    (:COLOR--ACCURACY . "color_wiggle")
    (:TAGS            . "array(string)")
    (:MATERIALS       . "array(string)")
    (:CATEGORY        . "category")
    (:LOCATION        . "string")
    (:LAT             . "latitude")
    (:LON             . "longitude")
    (:GEO--LEVEL      . "enum(city, state, country)"))
   (:DEFAULTS
    (:LIMIT           . 25)
    (:OFFSET          . 0)
    (:PAGE)
    (:KEYWORDS)
    (:SORT--ON        . "created")
    (:SORT--ORDER     . "down")
    (:MIN--PRICE)
    (:MAX--PRICE)
    (:COLOR)
    (:COLOR--ACCURACY . 0)
    (:TAGS)
    (:MATERIALS)
    (:CATEGORY)
    (:LOCATION)
    (:LAT)
    (:LON)
    (:GEO--LEVEL      . "city"))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "getOrder")
   (:DESCRIPTION . "Retrieves a Order by id.")
   (:URI         . "/orders/:order_id")
   (:PARAMS
    (:ORDER--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Order")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findAllOrderReceipts")
   (:DESCRIPTION . "Retrieves a set of Receipt objects associated to a Order.")
   (:URI         . "/orders/:order_id/receipts")
   (:PARAMS
    (:ORDER--ID . "int")
    (:LIMIT     . "int")
    (:OFFSET    . "int")
    (:PAGE      . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Receipt")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findPayment")
   (:DESCRIPTION . "Get a Direct Checkout Payment")
   (:URI         . "/payments/:payment_id")
   (:PARAMS
    (:PAYMENT--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Payment")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findPaymentAdjustments")
   (:DESCRIPTION . "Get a Payment Adjustments from a Payment Id")
   (:URI         . "/payments/:payment_id/adjustments")
   (:PARAMS
    (:PAYMENT--ID . "int")
    (:LIMIT       . "int")
    (:OFFSET      . "int")
    (:PAGE        . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "PaymentAdjustment")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findPaymentAdjustment")
   (:DESCRIPTION . "Get a Direct Checkout Payment Adjustment")
   (:URI         . "/payments/:payment_id/adjustments/:payment_adjustment_id")
   (:PARAMS
    (:PAYMENT--ID             . "int")
    (:PAYMENT--ADJUSTMENT--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "PaymentAdjustment")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findPaymentAdjustmentItem")
   (:DESCRIPTION . "Get Direct Checkout Payment Adjustment Items")
   (:URI         . "/payments/:payment_id/adjustments/:payment_adjustment_id/items")
   (:PARAMS
    (:PAYMENT--ID             . "int")
    (:PAYMENT--ADJUSTMENT--ID . "int")
    (:LIMIT                   . "int")
    (:OFFSET                  . "int")
    (:PAGE                    . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "PaymentAdjustmentItem")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findPaymentAdjustmentItem")
   (:DESCRIPTION . "Get a Direct Checkout Payment Adjustment Item")
   (:URI         . "/payments/:payment_id/adjustments/:payment_adjustment_id/items/:payment_adjustment_item_id")
   (:PARAMS
    (:PAYMENT--ID                   . "int")
    (:PAYMENT--ADJUSTMENT--ID       . "int")
    (:PAYMENT--ADJUSTMENT--ITEM--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "PaymentAdjustmentItem")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "createPaymentTemplate")
   (:DESCRIPTION . "Creates a new PaymentTemplate")
   (:URI         . "/payments/templates")
   (:PARAMS
    (:ALLOW--CHECK  . "boolean")
    (:ALLOW--MO     . "boolean")
    (:ALLOW--OTHER  . "boolean")
    (:ALLOW--PAYPAL . "boolean")
    (:ALLOW--CC     . "boolean")
    (:PAYPAL--EMAIL . "string")
    (:NAME          . "string")
    (:FIRST--LINE   . "string")
    (:SECOND--LINE  . "string")
    (:CITY          . "string")
    (:STATE         . "string")
    (:ZIP           . "string")
    (:COUNTRY--ID   . "int"))
   (:DEFAULTS
    (:ALLOW--CHECK)
    (:ALLOW--MO)
    (:ALLOW--OTHER)
    (:ALLOW--PAYPAL)
    (:ALLOW--CC)
    (:PAYPAL--EMAIL)
    (:NAME)
    (:FIRST--LINE)
    (:SECOND--LINE)
    (:CITY)
    (:STATE)
    (:ZIP)
    (:COUNTRY--ID))
   (:TYPE         . "PaymentTemplate")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))
     
  ((:NAME        . "getPaymentTemplate")
   (:DESCRIPTION . "Retrieves a PaymentTemplate by id.")
   (:URI         . "/payments/templates/:payment_template_id")
   (:PARAMS
    (:PAYMENT--TEMPLATE--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "PaymentTemplate")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "updatePaymentTemplate")
   (:DESCRIPTION . "Updates a PaymentTemplate")
   (:URI         . "/payments/templates/:payment_template_id")
   (:PARAMS
    (:ALLOW--CHECK          . "boolean")
    (:ALLOW--MO             . "boolean")
    (:ALLOW--OTHER          . "boolean")
    (:ALLOW--PAYPAL         . "boolean")
    (:ALLOW--CC             . "boolean")
    (:PAYPAL--EMAIL         . "string")
    (:NAME                  . "string")
    (:FIRST--LINE           . "string")
    (:SECOND--LINE          . "string")
    (:CITY                  . "string")
    (:STATE                 . "string")
    (:ZIP                   . "string")
    (:COUNTRY--ID           . "int")
    (:PAYMENT--TEMPLATE--ID . "int"))
   (:DEFAULTS
    (:ALLOW--CHECK)
    (:ALLOW--MO)
    (:ALLOW--OTHER)
    (:ALLOW--PAYPAL)
    (:ALLOW--CC)
    (:PAYPAL--EMAIL)
    (:NAME)
    (:FIRST--LINE)
    (:SECOND--LINE)
    (:CITY)
    (:STATE)
    (:ZIP)
    (:COUNTRY--ID))
   (:TYPE         . "PaymentTemplate")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))
     
  ((:NAME        . "createReceiptOnSandbox")
   (:DESCRIPTION
    . "Creates a purchase for the current OAuth user, including Order, Receipt and Transaction resources. This method is only available via the Sandbox API. Listing IDs must be active, and belong to the same seller user ID. The buyer must have at least one UserAddress record, or an error will be thrown.")
   (:URI         . "/receipts")
   (:PARAMS
    (:LISTING--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Receipt")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))
     
  ((:NAME        . "getReceipt")
   (:DESCRIPTION . "Retrieves a Receipt by id.")
   (:URI         . "/receipts/:receipt_id")
   (:PARAMS
    (:RECEIPT--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Receipt")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "updateReceipt")
   (:DESCRIPTION . "Updates a Receipt")
   (:URI         . "/receipts/:receipt_id")
   (:PARAMS
    (:RECEIPT--ID           . "int")
    (:WAS--PAID             . "boolean")
    (:WAS--SHIPPED          . "boolean")
    (:MESSAGE--FROM--SELLER . "string")
    (:MESSAGE--FROM--BUYER  . "string"))
   (:DEFAULTS
    (:WAS--PAID)
    (:WAS--SHIPPED)
    (:MESSAGE--FROM--SELLER)
    (:MESSAGE--FROM--BUYER))
   (:TYPE         . "Receipt")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))
     
  ((:NAME        . "findAllReceiptListings")
   (:DESCRIPTION . "Finds all listings in a receipt")
   (:URI         . "/receipts/:receipt_id/listings")
   (:PARAMS
    (:LIMIT         . "int")
    (:OFFSET        . "int")
    (:PAGE          . "int")
    (:RECEIPT--ID   . "int")
    (:DATA--VERSION . "string"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE)
    (:DATA--VERSION))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findAllReceiptTransactions")
   (:DESCRIPTION
    . "Retrieves a set of Transaction objects associated to a Receipt.")
   (:URI         . "/receipts/:receipt_id/transactions")
   (:PARAMS
    (:RECEIPT--ID . "int")
    (:LIMIT       . "int")
    (:OFFSET      . "int")
    (:PAGE        . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Transaction")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "findAllRegion")
   (:DESCRIPTION . "Finds all Region.")
   (:URI         . "/regions")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "Region")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "getRegion")
   (:DESCRIPTION . "Retrieves a Region by id.")
   (:URI         . "/regions/:region_id")
   (:PARAMS
    (:REGION--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Region")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "getServerEpoch")
   (:DESCRIPTION . "Get server time, in epoch seconds notation.")
   (:URI         . "/server/epoch")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "Int")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "ping")
   (:DESCRIPTION . "Check that the server is alive.")
   (:URI         . "/server/ping")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "String")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "getShippingInfo")
   (:DESCRIPTION . "Retrieves a ShippingInfo by id.")
   (:URI         . "/shipping/info/:shipping_info_id")
   (:PARAMS
    (:SHIPPING--INFO--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "ShippingInfo")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "updateShippingInfo")
   (:DESCRIPTION . "Updates a ShippingInfo with the given id.")
   (:URI         . "/shipping/info/:shipping_info_id")
   (:PARAMS
    (:SHIPPING--INFO--ID       . "int")
    (:ORIGIN--COUNTRY--ID      . "int")
    (:DESTINATION--COUNTRY--ID . "int")
    (:PRIMARY--COST            . "float")
    (:SECONDARY--COST          . "float")
    (:REGION--ID               . "int")
    (:LISTING--ID              . "int"))
   (:DEFAULTS
    (:ORIGIN--COUNTRY--ID)
    (:DESTINATION--COUNTRY--ID)
    (:CURRENCY--CODE)
    (:PRIMARY--COST)
    (:SECONDARY--COST)
    (:REGION--ID)
    (:LISTING--ID))
   (:TYPE         . "ShippingInfo")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))
     
  ((:NAME        . "deleteShippingInfo")
   (:DESCRIPTION . "Deletes the ShippingInfo with the given id.")
   (:URI         . "/shipping/info/:shipping_info_id")
   (:PARAMS
    (:SHIPPING--INFO--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ShippingInfo")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))
     
  ((:NAME        . "createShippingTemplate")
   (:DESCRIPTION . "Creates a new ShippingTemplate")
   (:URI         . "/shipping/templates")
   (:PARAMS
    (:TITLE                    . "string")
    (:ORIGIN--COUNTRY--ID      . "int")
    (:DESTINATION--COUNTRY--ID . "int")
    (:PRIMARY--COST            . "float")
    (:SECONDARY--COST          . "float")
    (:DESTINATION--REGION--ID  . "int"))
   (:DEFAULTS
    (:DESTINATION--COUNTRY--ID)
    (:DESTINATION--REGION--ID))
   (:TYPE         . "ShippingTemplate")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))
     
  ((:NAME        . "getShippingTemplate")
   (:DESCRIPTION . "Retrieves a ShippingTemplate by id.")
   (:URI         . "/shipping/templates/:shipping_template_id")
   (:PARAMS
    (:SHIPPING--TEMPLATE--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "ShippingTemplate")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "updateShippingTemplate")
   (:DESCRIPTION . "Updates a ShippingTemplate")
   (:URI         . "/shipping/templates/:shipping_template_id")
   (:PARAMS
    (:SHIPPING--TEMPLATE--ID . "int")
    (:TITLE                  . "string")
    (:ORIGIN--COUNTRY--ID    . "int"))
   (:DEFAULTS
    (:TITLE)
    (:ORIGIN--COUNTRY--ID))
   (:TYPE         . "ShippingTemplate")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))
     
  ((:NAME        . "deleteShippingTemplate")
   (:DESCRIPTION . "Deletes the ShippingTemplate with the given id.")
   (:URI         . "/shipping/templates/:shipping_template_id")
   (:PARAMS
    (:SHIPPING--TEMPLATE--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ShippingTemplate")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))
     
  ((:NAME        . "findAllShippingTemplateEntries")
   (:DESCRIPTION
    . "Retrieves a set of ShippingTemplateEntry objects associated to a ShippingTemplate.")
   (:URI         . "/shipping/templates/:shipping_template_id/entries")
   (:PARAMS
    (:SHIPPING--TEMPLATE--ID . "int")
    (:LIMIT                  . "int")
    (:OFFSET                 . "int")
    (:PAGE                   . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "ShippingTemplateEntry")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "createShippingTemplateEntry")
   (:DESCRIPTION . "Creates a new ShippingTemplateEntry")
   (:URI         . "/shipping/templates/entries")
   (:PARAMS
    (:SHIPPING--TEMPLATE--ID   . "int")
    (:DESTINATION--COUNTRY--ID . "int")
    (:PRIMARY--COST            . "float")
    (:SECONDARY--COST          . "float")
    (:DESTINATION--REGION--ID  . "int"))
   (:DEFAULTS
    (:DESTINATION--COUNTRY--ID)
    (:DESTINATION--REGION--ID))
   (:TYPE         . "ShippingTemplateEntry")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))
     
  ((:NAME        . "getShippingTemplateEntry")
   (:DESCRIPTION . "Retrieves a ShippingTemplateEntry by id.")
   (:URI         . "/shipping/templates/entries/:shipping_template_entry_id")
   (:PARAMS
    (:SHIPPING--TEMPLATE--ENTRY--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "ShippingTemplateEntry")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "updateShippingTemplateEntry")
   (:DESCRIPTION . "Updates a ShippingTemplateEntry")
   (:URI         . "/shipping/templates/entries/:shipping_template_entry_id")
   (:PARAMS
    (:SHIPPING--TEMPLATE--ENTRY--ID . "int")
    (:DESTINATION--COUNTRY--ID      . "int")
    (:PRIMARY--COST                 . "float")
    (:SECONDARY--COST               . "float"))
   (:DEFAULTS
    (:DESTINATION--COUNTRY--ID)
    (:PRIMARY--COST)
    (:SECONDARY--COST))
   (:TYPE         . "ShippingTemplateEntry")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))
     
  ((:NAME        . "deleteShippingTemplateEntry")
   (:DESCRIPTION . "Deletes a ShippingTemplateEntry")
   (:URI         . "/shipping/templates/entries/:shipping_template_entry_id")
   (:PARAMS
    (:SHIPPING--TEMPLATE--ENTRY--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ShippingTemplateEntry")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))
     
  ((:NAME        . "findAllShops")
   (:DESCRIPTION
    . "Finds all Shops.  If there is a keywords parameter, finds shops with shop_name starting with keywords.")
   (:URI         . "/shops")
   (:PARAMS
    (:SHOP--NAME    . "string (length >= 3)")
    (:LIMIT         . "int")
    (:OFFSET        . "int")
    (:PAGE          . "int")
    (:LAT           . "latitude")
    (:LON           . "longitude")
    (:DISTANCE--MAX . "float"))
   (:DEFAULTS
    (:SHOP--NAME)
    (:LIMIT         . 25)
    (:OFFSET        . 0)
    (:PAGE)
    (:LAT)
    (:LON)
    (:DISTANCE--MAX . 35))
   (:TYPE         . "Shop")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "getShop")
   (:DESCRIPTION . "Retrieves a Shop by id.")
   (:URI         . "/shops/:shop_id")
   (:PARAMS
    (:SHOP--ID . "array(shop_id_or_name)"))
   (:DEFAULTS)
   (:TYPE         . "Shop")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "updateShop")
   (:DESCRIPTION . "Updates a Shop")
   (:URI         . "/shops/:shop_id")
   (:PARAMS
    (:SHOP--ID              . "shop_id_or_name")
    (:TITLE                 . "string")
    (:ANNOUNCEMENT          . "text")
    (:IS--REFUSING--ALCHEMY . "boolean")
    (:ALCHEMY--MESSAGE      . "string")
    (:SALE--MESSAGE         . "text")
    (:POLICY--WELCOME       . "text")
    (:POLICY--PAYMENT       . "text")
    (:POLICY--SHIPPING      . "text")
    (:POLICY--REFUNDS       . "text")
    (:POLICY--ADDITIONAL    . "text")
    (:POLICY--SELLER--INFO  . "text"))
   (:DEFAULTS
    (:TITLE)
    (:ANNOUNCEMENT)
    (:IS--REFUSING--ALCHEMY)
    (:ALCHEMY--MESSAGE)
    (:SALE--MESSAGE)
    (:POLICY--WELCOME)
    (:POLICY--PAYMENT)
    (:POLICY--SHIPPING)
    (:POLICY--REFUNDS)
    (:POLICY--ADDITIONAL)
    (:POLICY--SELLER--INFO))
   (:TYPE         . "Shop")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))
     
  ((:NAME        . "uploadShopBanner")
   (:DESCRIPTION . "Upload a new shop banner image")
   (:URI         . "/shops/:shop_id/appearance/banner")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name")
    (:IMAGE    . "image"))
   (:DEFAULTS)
   (:TYPE         . "Shop")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))
     
  ((:NAME        . "deleteShopBanner")
   (:DESCRIPTION . "Deletes a shop banner image")
   (:URI         . "/shops/:shop_id/appearance/banner")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "Shop")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))
     
  ((:NAME        . "findAllShopCoupons")
   (:DESCRIPTION . "Retrieves all Shop_Coupons by shop_id")
   (:URI         . "/shops/:shop_id/coupons")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "Coupon")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "createCoupon")
   (:DESCRIPTION . "Creates a new Coupon.")
   (:URI         . "/shops/:shop_id/coupons")
   (:PARAMS
    (:SHOP--ID       . "shop_id_or_name")
    (:COUPON--CODE   . "string")
    (:PCT--DISCOUNT  . "int")
    (:SELLER--ACTIVE . "boolean")
    (:FREE--SHIPPING . "boolean")
    (:DOMESTIC--ONLY . "boolean"))
   (:DEFAULTS
    (:PCT--DISCOUNT)
    (:SELLER--ACTIVE . "false")
    (:FREE--SHIPPING . "false")
    (:DOMESTIC--ONLY . "false"))
   (:TYPE         . "Coupon")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))
     
  ((:NAME        . "findCoupon")
   (:DESCRIPTION . "Retrieves a Shop_Coupon by id and shop_id")
   (:URI         . "/shops/:shop_id/coupons/:coupon_id")
   (:PARAMS
    (:SHOP--ID   . "shop_id_or_name")
    (:COUPON--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Coupon")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))
     
  ((:NAME        . "updateCoupon")
   (:DESCRIPTION . "Updates a coupon")
   (:URI         . "/shops/:shop_id/coupons/:coupon_id")
   (:PARAMS
    (:SHOP--ID       . "shop_id_or_name")
    (:COUPON--ID     . "int")
    (:SELLER--ACTIVE . "boolean"))
   (:DEFAULTS
    (:SELLER--ACTIVE . "false"))
   (:TYPE         . "Coupon")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))
     
  ((:NAME        . "deleteCoupon")
   (:DESCRIPTION . "Deletes a coupon")
   (:URI         . "/shops/:shop_id/coupons/:coupon_id")
   (:PARAMS
    (:SHOP--ID   . "shop_id_or_name")
    (:COUPON--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Coupon")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))
     
  ((:NAME        . "findLedger")
   (:DESCRIPTION . "Get a Shop Payment Account Ledger")
   (:URI         . "/shops/:shop_id/ledger/")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "Ledger")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findLedgerEntries")
   (:DESCRIPTION . "Get a Shop Payment Account Ledger's Entries")
   (:URI         . "/shops/:shop_id/ledger/entries")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "LedgerEntry")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopListingsActive")
   (:DESCRIPTION . "Finds all active Listings associated with a Shop")
   (:URI         . "/shops/:shop_id/listings/active")
   (:PARAMS
    (:LIMIT           . "int")
    (:OFFSET          . "int")
    (:PAGE            . "int")
    (:SHOP--ID        . "shop_id_or_name")
    (:KEYWORDS        . "string")
    (:SORT--ON        . "enum(created, price, score)")
    (:SORT--ORDER     . "enum(up, down)")
    (:MIN--PRICE      . "float")
    (:MAX--PRICE      . "float")
    (:COLOR           . "color_triplet")
    (:COLOR--ACCURACY . "color_wiggle")
    (:TAGS            . "array(string)")
    (:MATERIALS       . "array(string)")
    (:CATEGORY        . "category"))
   (:DEFAULTS
    (:LIMIT           . 25)
    (:OFFSET          . 0)
    (:PAGE)
    (:KEYWORDS)
    (:SORT--ON        . "created")
    (:SORT--ORDER     . "down")
    (:MIN--PRICE)
    (:MAX--PRICE)
    (:COLOR)
    (:COLOR--ACCURACY . 0)
    (:TAGS)
    (:MATERIALS)
    (:CATEGORY))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopListingsDraft")
   (:DESCRIPTION . "Finds all of a Shop's draft listings")
   (:URI         . "/shops/:shop_id/listings/draft")
   (:PARAMS 
    (:SHOP--ID . "shop_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopListingsExpired")
   (:DESCRIPTION . "Retrieves Listings associated to a Shop that are expired")
   (:URI         . "/shops/:shop_id/listings/expired")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getShopListingExpired")
   (:DESCRIPTION . "Retrieves a Listing associated to a Shop that is inactive")
   (:URI         . "/shops/:shop_id/listings/expired/:listing_id")
   (:PARAMS
    (:SHOP--ID    . "shop_id_or_name")
    (:LISTING--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopListingsFeatured")
   (:DESCRIPTION . "Retrieves Listings associated to a Shop that are featured")
   (:URI         . "/shops/:shop_id/listings/featured")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopListingsInactive")
   (:DESCRIPTION . "Retrieves Listings associated to a Shop that are inactive")
   (:URI         . "/shops/:shop_id/listings/inactive")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getShopListingInactive")
   (:DESCRIPTION . "Retrieves a Listing associated to a Shop that is inactive")
   (:URI         . "/shops/:shop_id/listings/inactive/:listing_id")
   (:PARAMS
    (:SHOP--ID    . "shop_id_or_name")
    (:LISTING--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopReceipts")
   (:DESCRIPTION . "Retrieves a set of Receipt objects associated to a Shop.")
   (:URI         . "/shops/:shop_id/receipts")
   (:PARAMS
    (:SHOP--ID     . "shop_id_or_name")
    (:MIN--CREATED . "epoch")
    (:MAX--CREATED . "epoch")
    (:LIMIT        . "int")
    (:OFFSET       . "int")
    (:PAGE         . "int")
    (:WAS--PAID    . "boolean")
    (:WAS--SHIPPED . "boolean"))
   (:DEFAULTS
    (:MIN--CREATED)
    (:MAX--CREATED)
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE)
    (:WAS--PAID)
    (:WAS--SHIPPED))
   (:TYPE         . "Receipt")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopReceiptsByStatus")
   (:DESCRIPTION
    . "Retrieves a set of Receipt objects associated to a Shop based on the status.")
   (:URI         . "/shops/:shop_id/receipts/:status")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name")
    (:STATUS   . "enum(open, unshipped, unpaid, completed, processing, all)")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Receipt")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopSections")
   (:DESCRIPTION
    . "Retrieves a set of ShopSection objects associated to a Shop.")
   (:URI         . "/shops/:shop_id/sections")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "ShopSection")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "createShopSection")
   (:DESCRIPTION . "Creates a new ShopSection.")
   (:URI         . "/shops/:shop_id/sections")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name")
    (:TITLE    . "text")
    (:USER--ID . "int"))
   (:DEFAULTS
    (:TITLE)
    (:USER--ID))
   (:TYPE         . "ShopSection")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))

  ((:NAME        . "getShopSection")
   (:DESCRIPTION . "Retrieves a ShopSection by id and shop_id")
   (:URI         . "/shops/:shop_id/sections/:shop_section_id")
   (:PARAMS
    (:SHOP--ID          . "shop_id_or_name")
    (:SHOP--SECTION--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "ShopSection")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "updateShopSection")
   (:DESCRIPTION . "Updates a ShopSection with the given id.")
   (:URI         . "/shops/:shop_id/sections/:shop_section_id")
   (:PARAMS
    (:SHOP--ID          . "shop_id_or_name")
    (:SHOP--SECTION--ID . "int")
    (:TITLE             . "text")
    (:USER--ID          . "int")
    (:RANK              . "int"))
   (:DEFAULTS
    (:TITLE)
    (:USER--ID)
    (:RANK))
   (:TYPE         . "ShopSection")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))

  ((:NAME        . "deleteShopSection")
   (:DESCRIPTION . "Deletes the ShopSection with the given id.")
   (:URI         . "/shops/:shop_id/sections/:shop_section_id")
   (:PARAMS
    (:SHOP--ID          . "shop_id_or_name")
    (:SHOP--SECTION--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ShopSection")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))

  ((:NAME        . "findAllShopSectionListings")
   (:DESCRIPTION . "Finds all listings within a shop section")
   (:URI         . "/shops/:shop_id/sections/:shop_section_id/listings")
   (:PARAMS
    (:LIMIT             . "int")
    (:OFFSET            . "int")
    (:PAGE              . "int")
    (:SHOP--ID          . "shop_id_or_name")
    (:SHOP--SECTION--ID . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopSectionListingsActive")
   (:DESCRIPTION . "Finds all listings within a shop section")
   (:URI         . "/shops/:shop_id/sections/:shop_section_id/listings/active")
   (:PARAMS
    (:LIMIT             . "int")
    (:OFFSET            . "int")
    (:PAGE              . "int")
    (:SHOP--ID          . "shop_id_or_name")
    (:SHOP--SECTION--ID . "int")
    (:SORT--ON          . "enum(created, price)")
    (:SORT--ORDER       . "enum(up, down)"))
   (:DEFAULTS
    (:LIMIT       . 25)
    (:OFFSET      . 0)
    (:PAGE)
    (:SORT--ON    . "created")
    (:SORT--ORDER . "down"))
   (:TYPE         . "Listing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getShopTranslation")
   (:DESCRIPTION . "Retrieves a ShopSectionTranslation by shop_id and language")
   (:URI         . "/shops/:shop_id/sections/:shop_section_id/translations/:language")
   (:PARAMS
    (:SHOP--ID          . "shop_id_or_name")
    (:SHOP--SECTION--ID . "int")
    (:LANGUAGE          . "language"))
   (:DEFAULTS)
   (:TYPE         . "ShopSectionTranslation")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllShopTransactions")
   (:DESCRIPTION . "Retrieves a set of Transaction objects associated to a Shop.")
   (:URI         . "/shops/:shop_id/transactions")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Transaction")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getShopTranslation")
   (:DESCRIPTION . "Retrieves a ShopTranslation by shop_id and language")
   (:URI         . "/shops/:shop_id/translations/:language")
   (:PARAMS
    (:SHOP--ID . "shop_id_or_name")
    (:LANGUAGE . "language"))
   (:DEFAULTS)
   (:TYPE         . "ShopTranslation")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getShopSectionTranslationShopSection")
   (:DESCRIPTION . "Retrieves a set of ShopSection objects associated to a ShopSectionTranslation.")
   (:URI         . "/shopsectiontranslations/:shop_section_id/shopsection")
   (:PARAMS
    (:SHOP--SECTION--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "ShopSection")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllTopCategory")
   (:DESCRIPTION . "Retrieves all top-level Categories.")
   (:URI         . "/taxonomy/categories")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllTopCategoryChildren")
   (:DESCRIPTION . "Retrieves children of a top-level Category by tag.")
   (:URI         . "/taxonomy/categories/:tag")
   (:PARAMS
    (:TAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllSubCategoryChildren")
   (:DESCRIPTION . "Retrieves children of a second-level Category by tag and subtag.")
   (:URI         . "/taxonomy/categories/:tag/:subtag")
   (:PARAMS
    (:TAG    . "string")
    (:SUBTAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findSuggestedStyles")
   (:DESCRIPTION . "Retrieve all suggested styles.")
   (:URI         . "/taxonomy/styles")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "Style")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findPopularTags")
   (:DESCRIPTION . "DEPRECATED - Retrieves all related tags for the given tag set.")
   (:URI         . "/taxonomy/tags")
   (:PARAMS
    (:LIMIT . "int"))
   (:DEFAULTS
    (:LIMIT . 25))
   (:TYPE         . "Tag")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllRelatedTags")
   (:DESCRIPTION . "DEPRECATED - Retrieves all related tags for the given tag set.")
   (:URI         . "/taxonomy/tags/:tags")
   (:PARAMS
    (:TAGS  . "array(string)")
    (:LIMIT . "int"))
   (:DEFAULTS
    (:LIMIT . 25))
   (:TYPE         . "Tag")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllTeams")
   (:DESCRIPTION . "Returns all Teams")
   (:URI         . "/teams")
   (:PARAMS
    (:LIMIT  . "int")
    (:OFFSET . "int")
    (:PAGE   . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Team")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUsersForTeam")
   (:DESCRIPTION . "Returns a list of users for a specific team")
   (:URI         . "/teams/:team_id/users/")
   (:PARAMS
    (:TEAM--ID . "int")
    (:STATUS   . "enum(active, invited, pending)")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:STATUS . "active")
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "User")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findTeams")
   (:DESCRIPTION . "Returns specified team by ID or team name")
   (:URI         . "/teams/:team_ids/")
   (:PARAMS
    (:TEAM--IDS . "array(team_id_or_name)"))
   (:DEFAULTS)
   (:TYPE         . "Team")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getTransaction")
   (:DESCRIPTION . "Retrieves a Transaction by id.")
   (:URI         . "/transactions/:transaction_id")
   (:PARAMS
    (:TRANSACTION--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Transaction")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllTreasuries")
   (:DESCRIPTION . "Search Treasuries or else List all Treasuries")
   (:URI         . "/treasuries")
   (:PARAMS
    (:KEYWORDS    . "treasury_search_string")
    (:SORT--ON    . "enum(hotness, created)")
    (:SORT--ORDER . "enum(up, down)")
    (:LIMIT       . "int")
    (:OFFSET      . "int")
    (:PAGE        . "int"))
   (:DEFAULTS
    (:KEYWORDS)
    (:SORT--ON    . "hotness")
    (:SORT--ORDER . "down")
    (:LIMIT       . 25)
    (:OFFSET      . 0)
    (:PAGE))
   (:TYPE         . "Treasury")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "createTreasury")
   (:DESCRIPTION . "Create a Treasury")
   (:URI         . "/treasuries")
   (:PARAMS
    (:TITLE        . "treasury_title")
    (:DESCRIPTION  . "treasury_description")
    (:LISTING--IDS . "array(int)")
    (:TAGS         . "array(string)")
    (:PRIVATE      . "boolean"))
   (:DEFAULTS 
    (:TAGS    . "")
    (:PRIVATE . 0))
   (:TYPE         . "Treasury")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))

  ((:NAME        . "getTreasury")
   (:DESCRIPTION . "Get a Treasury")
   (:URI         . "/treasuries/:treasury_key")
   (:PARAMS
    (:TREASURY--KEY . "treasury_id"))
   (:DEFAULTS)
   (:TYPE         . "Treasury")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "deleteTreasury")
   (:DESCRIPTION . "Delete a Treasury")
   (:URI         . "/treasuries/:treasury_key")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "Treasury")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))

  ((:NAME        . "findTreasuryComments")
   (:DESCRIPTION . "Get a Treasury's Comments")
   (:URI         . "/treasuries/:treasury_key/comments")
   (:PARAMS
    (:TREASURY--KEY . "treasury_id")
    (:LIMIT         . "int")
    (:OFFSET        . "int")
    (:PAGE          . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "ForumPost")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "postTreasuryComment")
   (:DESCRIPTION . "Leave a comment on a Treasury List")
   (:URI         . "/treasuries/:treasury_key/comments")
   (:PARAMS
    (:MESSAGE . "forum_post"))
   (:DEFAULTS)
   (:TYPE         . "ForumPost")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))

  ((:NAME        . "deleteTreasuryComment")
   (:DESCRIPTION . "Delete a given comment on a Treasury List")
   (:URI         . "/treasuries/:treasury_key/comments/:comment_id")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "ForumPost")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))

  ((:NAME        . "describeOccasionEnum")
   (:DESCRIPTION . "Describes the legal values for Listing.occasion.")
   (:URI         . "/types/enum/occasion")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "DataType")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "describeRecipientEnum")
   (:DESCRIPTION . "Describes the legal values for Listing.recipient.")
   (:URI         . "/types/enum/recipient")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "DataType")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "describeWhenMadeEnum")
   (:DESCRIPTION . "Describes the legal values for Listing.when_made.")
   (:URI         . "/types/enum/when_made")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "DataType")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "describeWhoMadeEnum")
   (:DESCRIPTION . "Describes the legal values for Listing.who_made.")
   (:URI         . "/types/enum/who_made")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "DataType")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUsers")
      
   (:DESCRIPTION
    . "Finds all Users whose name or username match the keywords parameter.")
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
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getUser")
   (:DESCRIPTION . "Retrieves a User by id.")
   (:URI         . "/users/:user_id")
   (:PARAMS
    (:USER--ID . "array(user_id_or_name)"))
   (:DEFAULTS)
   (:TYPE         . "User")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserAddresses")
   (:DESCRIPTION . "Retrieves a set of UserAddress objects associated to a User.")
   (:URI         . "/users/:user_id/addresses")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "UserAddress")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "createUserAddress")
   (:DESCRIPTION . "Creates a new UserAddress.")
   (:URI         . "/users/:user_id/addresses/")
   (:PARAMS
    (:USER--ID     . "user_id_or_name")
    (:NAME         . "string")
    (:FIRST--LINE  . "string")
    (:SECOND--LINE . "string")
    (:CITY         . "string")
    (:STATE        . "string")
    (:ZIP          . "string")
    (:COUNTRY--ID  . "int"))
   (:DEFAULTS
    (:SECOND--LINE)
    (:STATE))
   (:TYPE         . "UserAddress")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))

  ((:NAME        . "getUserAddress")
   (:DESCRIPTION . "Retrieves a UserAddress by id.")
   (:URI         . "/users/:user_id/addresses/:user_address_id")
   (:PARAMS
    (:USER--ADDRESS--ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "UserAddress")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "deleteUserAddress")
   (:DESCRIPTION . "Deletes the UserAddress with the given id.")
   (:URI         . "/users/:user_id/addresses/:user_address_id")
   (:PARAMS
    (:USER--ADDRESS--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "UserAddress")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))

  ((:NAME        . "uploadAvatar")
   (:DESCRIPTION . "Upload a new user avatar image")
   (:URI         . "/users/:user_id/avatar")
   (:PARAMS
    (:SRC      . "string")
    (:USER--ID . "user_id_or_name")
    (:IMAGE    . "image"))
   (:DEFAULTS
    (:SRC)
    (:USER--ID)
    (:IMAGE))
   (:TYPE         . "Avatar")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))

  ((:NAME        . "getAvatarImgSrc")
   (:DESCRIPTION . "Get avatar image source")
   (:URI         . "/users/:user_id/avatar/src")
   (:PARAMS
    (:USER--ID . "user_id_or_name"))
   (:DEFAULTS
    (:USER--ID))
   (:TYPE         . "Avatar")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getUserBillingOverview")
   (:DESCRIPTION . "Retrieves the user's current balance.")
   (:URI         . "/users/:user_id/billing/overview")
   (:PARAMS
    (:USER--ID . "user_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "BillingOverview")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "getAllUserCarts")
   (:DESCRIPTION . "Get a user's Carts")
   (:URI         . "/users/:user_id/carts")
   (:PARAMS
    (:USER--ID . "user_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "Cart")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "addToCart")
   (:DESCRIPTION . "Add a listing to a cart")
   (:URI         . "/users/:user_id/carts")
   (:PARAMS
    (:USER--ID    . "user_id_or_name")
    (:LISTING--ID . "int")
    (:QUANTITY    . "int"))
   (:DEFAULTS
    (:QUANTITY . 1))
   (:TYPE         . "Cart")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))

  ((:NAME        . "updateCartListingQuantity")
   (:DESCRIPTION . "Update a cart listing purchase quantity")
   (:URI         . "/users/:user_id/carts")
   (:PARAMS
    (:USER--ID    . "user_id_or_name")
    (:LISTING--ID . "int")
    (:QUANTITY    . "int"))
   (:DEFAULTS)
   (:TYPE         . "Cart")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))

  ((:NAME        . "removeCartListing")
   (:DESCRIPTION . "Remove a listing from a cart")
   (:URI         . "/users/:user_id/carts")
   (:PARAMS
    (:USER--ID    . "user_id_or_name")
    (:LISTING--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "Cart")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))

  ((:NAME        . "getUserCart")
   (:DESCRIPTION . "Get a cart")
   (:URI         . "/users/:user_id/carts/:cart_id")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:CART--ID . "cart_id"))
   (:DEFAULTS)
   (:TYPE         . "Cart")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "updateCart")
   (:DESCRIPTION . "Update a cart")
   (:URI         . "/users/:user_id/carts/:cart_id")
   (:PARAMS
    (:USER--ID                 . "user_id_or_name")
    (:CART--ID                 . "cart_id")
    (:DESTINATION--COUNTRY--ID . "int")
    (:MESSAGE--TO--SELLER      . "text")
    (:COUPON--CODE             . "string"))
   (:DEFAULTS
    (:DESTINATION--COUNTRY--ID)
    (:MESSAGE--TO--SELLER)
    (:COUPON--CODE))
   (:TYPE         . "Cart")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "PUT"))

  ((:NAME        . "deleteCart")
   (:DESCRIPTION . "Delete a cart")
   (:URI         . "/users/:user_id/carts/:cart_id")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:CART--ID . "cart_id"))
   (:DEFAULTS)
   (:TYPE         . "Cart")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))

  ((:NAME        . "findAllCartListings")
   (:DESCRIPTION . "Finds all listings in a given Cart")
   (:URI         . "/users/:user_id/carts/:cart_id/listings")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:CART--ID . "cart_id"))
   (:DEFAULTS)
   (:TYPE         . "Listing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserCharges")
   (:DESCRIPTION
    . "Retrieves a set of BillCharge objects associated to a User.")
   (:URI         . "/users/:user_id/charges")
   (:PARAMS
    (:LIMIT        . "int")
    (:OFFSET       . "int")
    (:PAGE         . "int")
    (:USER--ID     . "user_id_or_name")
    (:SORT--ORDER  . "enum(up, down)")
    (:MIN--CREATED . "epoch")
    (:MAX--CREATED . "epoch"))
   (:DEFAULTS
    (:LIMIT       . 25)
    (:OFFSET      . 0)
    (:PAGE)
    (:SORT--ORDER . "up")
    (:MIN--CREATED)
    (:MAX--CREATED))
   (:TYPE         . "BillCharge")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserFavoredBy")
   (:DESCRIPTION . "Retrieves a set of FavoriteUser objects associated to a User.")
   (:URI         . "/users/:user_id/favored-by")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "FavoriteUser")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserFavoriteListings")
   (:DESCRIPTION . "Finds all favorite listings for a user")
   (:URI         . "/users/:user_id/favorites/listings")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "FavoriteListing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findUserFavoriteListings")
   (:DESCRIPTION . "Finds a favorite listing for a user")
   (:URI         . "/users/:user_id/favorites/listings/:listing_id")
   (:PARAMS
    (:USER--ID    . "user_id_or_name")
    (:LISTING--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "FavoriteListing")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "createUserFavoriteListings")
   (:DESCRIPTION . "Creates a new favorite listing for a user")
   (:URI         . "/users/:user_id/favorites/listings/:listing_id")
   (:PARAMS
    (:USER--ID    . "user_id_or_name")
    (:LISTING--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "FavoriteListing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))

  ((:NAME        . "deleteUserFavoriteListings")
   (:DESCRIPTION . "Delete a favorite listing for a user")
   (:URI         . "/users/:user_id/favorites/listings/:listing_id")
   (:PARAMS
    (:USER--ID    . "user_id_or_name")
    (:LISTING--ID . "int"))
   (:DEFAULTS)
   (:TYPE         . "FavoriteListing")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))

  ((:NAME        . "findAllUserFavoriteUsers")
   (:DESCRIPTION . "Finds all favorite users for a user")
   (:URI         . "/users/:user_id/favorites/users")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "FavoriteUser")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findUserFavoriteUsers")
   (:DESCRIPTION . "Finds a favorite user for a user")
   (:URI         . "/users/:user_id/favorites/users/:target_user_id")
   (:PARAMS
    (:USER--ID         . "user_id_or_name")
    (:TARGET--USER--ID . "user_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "FavoriteUser")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "createUserFavoriteUsers")
   (:DESCRIPTION . "Creates a new favorite listing for a user")
   (:URI         . "/users/:user_id/favorites/users/:target_user_id")
   (:PARAMS
    (:USER--ID         . "user_id_or_name")
    (:TARGET--USER--ID . "user_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "FavoriteUser")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "POST"))

  ((:NAME        . "deleteUserFavoriteUsers")
   (:DESCRIPTION . "Delete a favorite listing for a user")
   (:URI         . "/users/:user_id/favorites/users/:target_user_id")
   (:PARAMS
    (:USER--ID         . "user_id_or_name")
    (:TARGET--USER--ID . "user_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "FavoriteUser")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "DELETE"))

  ((:NAME        . "findAllUserFeedbackAsAuthor")
   (:DESCRIPTION . "Retrieves a set of Feedback objects associated to a User.")
   (:URI         . "/users/:user_id/feedback/as-author")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Feedback")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserFeedbackAsBuyer")
   (:DESCRIPTION . "Retrieves a set of Feedback objects associated to a User.")
   (:URI         . "/users/:user_id/feedback/as-buyer")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Feedback")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserFeedbackAsSeller")
   (:DESCRIPTION . "Retrieves a set of Feedback objects associated to a User.")
   (:URI         . "/users/:user_id/feedback/as-seller")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Feedback")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserFeedbackAsSubject")
   (:DESCRIPTION . "Retrieves a set of Feedback objects associated to a User.")
   (:URI         . "/users/:user_id/feedback/as-subject")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Feedback")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllFeedbackFromBuyers")
   (:DESCRIPTION . "Returns a set of FeedBack objects associated to a User.
                       This is essentially the union between the findAllUserFeedbackAsBuyer
                       and findAllUserFeedbackAsSubject methods.")
   (:URI         . "/users/:user_id/feedback/from-buyers")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:USER--ID)
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Feedback")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))
  
  ((:NAME        . "findAllFeedbackFromSellers")
   (:DESCRIPTION . "Returns a set of FeedBack objects associated to a User.
                    This is essentially the union between
                    the findAllUserFeedbackAsBuyer and findAllUserFeedbackAsSubject methods.")
   (:URI         . "/users/:user_id/feedback/from-sellers")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:USER--ID)
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Feedback")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserOrders")
   (:DESCRIPTION . "Retrieves a set of Order objects associated to a User.")
   (:URI         . "/users/:user_id/orders")
   (:PARAMS
    (:USER--ID     . "user_id_or_name")
    (:MIN--CREATED . "epoch")
    (:MAX--CREATED . "epoch")
    (:LIMIT        . "int")
    (:OFFSET       . "int")
    (:PAGE         . "int"))
   (:DEFAULTS
    (:MIN--CREATED)
    (:MAX--CREATED)
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Order")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserPayments")
   (:DESCRIPTION . "Retrieves a set of BillPayment objects associated to a User.")
   (:URI         . "/users/:user_id/payments")
   (:PARAMS
    (:LIMIT        . "int")
    (:OFFSET       . "int")
    (:PAGE         . "int")
    (:USER--ID     . "user_id_or_name")
    (:SORT--ORDER  . "enum(up, down)")
    (:MIN--CREATED . "epoch")
    (:MAX--CREATED . "epoch"))
   (:DEFAULTS
    (:LIMIT       . 25)
    (:OFFSET      . 0)
    (:PAGE)
    (:SORT--ORDER . "up")
    (:MIN--CREATED)
    (:MAX--CREATED))
   (:TYPE         . "BillPayment")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserPaymentTemplates")
   (:DESCRIPTION . "Retrieves a set of PaymentTemplate objects associated to a User.")
   (:URI         . "/users/:user_id/payments/templates")
   (:PARAMS
    (:USER--ID . "user_id_or_name"))
   (:DEFAULTS)
   (:TYPE         . "PaymentTemplate")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserBuyerReceipts")
   (:DESCRIPTION . "Retrieves a set of Receipt objects associated to a User.")
   (:URI         . "/users/:user_id/receipts")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Receipt")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserShippingTemplates")
   (:DESCRIPTION . "Retrieves a set of ShippingTemplate objects associated to a User.")
   (:URI         . "/users/:user_id/shipping/templates")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "ShippingTemplate")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserShops")
   (:DESCRIPTION . "Retrieves a set of Shop objects associated to a User.")
   (:URI         . "/users/:user_id/shops")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Shop")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllTeamsForUser")
   (:DESCRIPTION . "Returns a list of teams for a specific user")
   (:URI         . "/users/:user_id/teams")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Team")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserBuyerTransactions")
   (:DESCRIPTION . "Retrieves a set of Transaction objects associated to a User.")
   (:URI         . "/users/:user_id/transactions")
   (:PARAMS
    (:USER--ID . "user_id_or_name")
    (:LIMIT    . "int")
    (:OFFSET   . "int")
    (:PAGE     . "int"))
   (:DEFAULTS
    (:LIMIT  . 25)
    (:OFFSET . 0)
    (:PAGE))
   (:TYPE         . "Transaction")
   (:VISIBILITY   . "private")
   (:HTTP--METHOD . "GET"))

  ((:NAME        . "findAllUserTreasuries")
   (:DESCRIPTION . "Get a user's Treasuries")
   (:URI         . "/users/:user_id/treasuries")
   (:PARAMS
    (:USER--ID    . "user_id_or_name")
    (:SORT--ON    . "enum(hotness, created)")
    (:SORT--ORDER . "enum(up, down)")
    (:LIMIT       . "int")
    (:OFFSET      . "int")
    (:PAGE        . "int"))
   (:DEFAULTS
    (:SORT--ON    . "hotness")
    (:SORT--ORDER . "down")
    (:LIMIT       . 25)
    (:OFFSET      . 0)
    (:PAGE))
   (:TYPE         . "Treasury")
   (:VISIBILITY   . "public")
   (:HTTP--METHOD . "GET")))

 (:PARAMS)
 (:TYPE         . "ApiMethod")
 (:PAGINATION))
NIL


#|

 ;; v1 "method" wants v2 "ApiMethod"
 (demarshall-results
  (api-call "http://openapi.etsy.com/v2/"
            `(("api_key" . ,*API-KEY*)))
  "ApiMethod"
  'demarshall-method)

|#

;;; ==============================
;;; EOF
