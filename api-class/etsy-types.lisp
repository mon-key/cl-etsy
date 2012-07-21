;;; :FILE-CREATED <Timestamp: #{2012-07-10T15:24:54-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-types.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_parameter_types')

:Parameter-Types

Many API methods take one or more parameters, either as query parameters of the
URL itself, or as POST parameters. The documentation for each method references
these standard types:

string
"Any string (up to 255 characters)."

; deftype exists
int
"A whole number value."

epoch
"A whole number value representing UNIX epoch time, or any string accepted by
PHP's strtotime() function."

float
"A number with or without a decimal point. 
Represented in output as a string, to avoid precision errors."

boolean
"A logical true or false value. 
May be passed to API requests as the strings "true" or "false" or "1" and "0".
In JSON output, symbolic constants are used."

user_id_or_name
"Either a user's numeric ID or login name."

shop_id_or_name
"Either a shop's numeric ID or login name. 
 (Note: shop IDs are not interchangeable with user IDs.)"

team_id_or_name
"Either a teams's numeric ID or full name, including spaces and punctuation. 
 (Note: Team captains may change the name of a team.)"

treasury_description
"A string 255 characters long or less."

treasury_id
"A string that uniquely identifies a treasury."

treasury_search_string
"In the general case, this can be any string. However, there are four special
prefixes that can be used.
 shop:    will look for lists where one of the shop's listings is included.
 curator: will find all the lists created by the person specified.
 title:  will find lists with a specific title. 
 tags:, listing_title:, listing_tags: follow the same pattern.
Because the colon ":" is used as a special character to separate the special
prefixes, you may only have 1 colon in your search string, and the text that
comes before the colon must match one of the prefixes stated above."

treasury_title
"A string 127 characters long or less"

enum(values)
"A predefined list of string values, for example true and false.
Any value not in the list will result in an error."
:NOTE see data-type class.

array(type)
"A list of values, separated by commas (#\,).
Do not include parentheses or brackets. 
Each value must be a valid instance of <TYPE>."

color_triplet
"Either an HSV color specified as an array in the range [0;0;0 , 360;100;100] or an
RGB color specified in hexadecimal notation in the range [#000000 , #FFFFFF].
:NOTE RGB colors are converted to HSV internally, which may result in small
rounding errors.  They may omit the leading "#", or use the three-digit form."

color_wiggle
"Specify the degree of tolerance for color matching where 0 is the most accurate, and 30 is the least."

latitude
"A valid numeric latitude, between -90.0 and 90.0"

longitude
"A valid numeric longitude, between -180.0 and 180.0"

image
"An image file; see Uploading Images"

; deftype exists
region
"An ISO 3166-1 alpha 2 country code. Currently supported values: US, CA, AU, GB, DE, FR, NL"

; deftype exists
currency
"A 3-letter ISO 4217 code."

; deftype exists
language
"An IETF language code. Currently supported values: en, de, fr"


---
enums
 when-made - see method "describeWhenMadeEnum" for class data-type
 who-made  - see method "describeWhoMadeEnum" for class data-type
 recipient - see method "describeRecipientEnum" for class data-type
 occassion - see method "describeOccasionEnum" for class data-type

 state     "enum(active, draft)"
           "enum(active, inactive, draft)"
 sort-on   "enum(created, price, score)"
           "enum(hotness, created)"
 sort-order "enum(up, down)"
 geo-level  "enum(city, state, country)"
 status     "enum(open, unshipped, unpaid, completed, processing, all)"
            "enum(active, invited, pending)"


 "enum(active, invited, pending)" ; ``status'' parameter - find-all-users-for-team public GET API method
 "enum(city, state, country)" ; ``geo-level'' parameter - find-all-listing-active public GET API method
 "enum(created, price)" ; ``sort-on'' parameter - find-all-shop-section-listings-active public GET
 "enum(created, price, score)" ; ``sort-on'' parameter - find-all-listing-active public GET - find-all-shop-listings-active parameter public GET
 "enum(hotness, created)" ; "findAllTreasuries" public GET - find-all-user-treasuries public GET
 "enum(up, down)" ; `sort-order' parameter - find-all-listing-active public GET - find-all-shop-listings-active public GET
                 ; find-all-shop-section-listings-active public GET - find-all-treasuries public GET - find-all-user-treasuries public GET
                 ;  find-all-user-charges private GET - "findAllUserPayments" private GET
 "enum(active, draft)" ; ``state'' parameter - create-listing of private POST API method
 "enum(active, inactive, draft)" ; ``state'' parameter - update-listing of private PUT API method
 "enum(open, unshipped, unpaid, completed, processing, all)" ; ``status'' parameter --find-all-shop-receipts-by-status private GET API method

|#
(in-package #:cl-etsy)

;; (deftype epoch ()
;;   'integer)

;;; ==============================
;;; EOF
