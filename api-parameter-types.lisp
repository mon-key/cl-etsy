;;; :FILE-CREATED <Timestamp: #{2012-07-10T15:24:54-04:00Z}#{12282} - by MON>
;;; :FILE #P"cl-etsy/api-parameter-types.lisp"
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

; :NOTE yason parses floats for us already
; :SEE lon slot of class `country'
latitude
"A valid numeric latitude, between -90.0 and 90.0"

; :NOTE yason parses floats for us already
; :SEE lon slot of class `country'
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


purchase-state slot of class `cart-listing'
 valid, invalid_quantity, invalid_shipping, 
 not_active, edited, invalid_currency, invalid_shipping_currency

---
:NOTE TreasuryListing and Treasury both specify that creation_tsz is an Int
whereas all of the other representations specifty it as a float:

Avatar
creation_tsz 	public 	none 	float 	The time that the avatar was uploaded. 

BillCharge
creation_tsz 	private 	billing_r 	float 	Creation time, in epoch seconds. 

BillPayment
creation_tsz 	private 	billing_r 	float 	Creation time, in epoch seconds. 

FavoriteListing
Creation_tsz 	public 	none 	float 	(DEPRECATED - use 'create_date') The date and time that the listing was favorited. 

FavoriteUser
creation_tsz 	public 	none 	float 	The date and time that the user was favorited.

Feedback
creation_tsz 	public 	none 	float 	Creation time, in epoch seconds. 

Listing
creation_tsz 	public 	none 	float 	Creation time, in epoch seconds. 

ListingImage
creation_tsz 	public 	none 	float 	Creation time, in epoch seconds. 

Order
creation_tsz 	private 	transactions_r 	float 	Creation time, in epoch seconds. 

Receipt
creation_tsz 	private 	transactions_r 	float 	Creation time, in epoch seconds. 

Shop
creation_tsz 	public 	none 	float 	The date and time the shop was created, in epoch seconds.

Transaction
creation_tsz 	public 	none 	float 	The date and time the transaction was created, in epoch seconds

Treasury
creation_tsz 	public 	none 	int 	Time this collection was created, in epoch seconds 

TreasuryListing
creation_tsz 	public 	none 	int 	Time the listing was added to this Treasury, in epoch seconds

User
creation_tsz 	public 	none 	float 	The date and time the user was created, in epoch seconds. 

|#
(in-package #:cl-etsy)

;; (deftype epoch ()
;;   'integer)


(deftype api-request-offset-range ()
  "The valid integer range for the OFFSET parameter of an Etsy API call.
Indicates to skip the first N records before returning results of API call. 
May be combined with api-request-limit-range for pagination.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')"
  '(mod 50001))

(deftype api-request-limit-range ()
"The valid integer range for the LIMIT parameter of an Etsy API call.
Indicates the maximum number of records to return.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')"
  '(integer 1 100))

(deftype api-request-page-range ()
"The valid integer range for the PAGE parameter of an Etsy API call.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')"
  '(integer 1 2001))

(deftype api-request-visibility ()
  "The lispy version of an Etsy API method's visibility level is either :public or :private.
This is presented as \"Requires Oauth\" in the \"Methods\" section of the web documentation of a resource.
Methods marked \"private\" may be entailed by a permission-scope and require Oauth-1 authentication.
:SEE-ALSO `api-method-public-p'."
  (and (typep :private 'api-request-visibility)
       (null (typep nil 'api-request-visibility)))
  '(member :private :public))

(deftype parsed-object-type ()
  "The valid parameter values for yason :object-as keywords 
`yason:*parse-object-as*'"
  '(member :hash-table :plist :alist))

(deftype int ()
  'integer)

(deftype int-or-string ()
  '(or string int))

;; (and (typep "88" 'int-or-int-string) (null (typep "88.0" 'int-or-int-string )))
(deftype int-or-int-string ()
  '(or int (satisfies int-string-p)))

(deftype region ()
  "An Etsy region type which the API docs define thusly:
 \"region
  An ISO 3166-1 alpha 2 country code.
  Currently supported values: US, CA, AU, GB, DE, FR, NL\"
For the sake of completeness we define all ISO-3166-1 ALPHA-2 codes.
:EXAMPLE
 \(typep \"us\" 'region\)
 \(typep \"US\" 'region\)
:SEE-ALSO `language-code-p', `iso-4217-code-p', `iso-3166-1-alpha-2-code-p',
`*iso-4217-codes*' `*iso-3166-1-alpha-2-codes*' `language', `currency',
`region'."
  '(satisfies iso-3166-1-alpha-2-code-p))

(deftype currency ()
  "An Etsy currency type which the API docs define thusly:
 \"currency
  A 3-letter ISO 4217 code.\"
:EXAMPLE
 \(typep \"USD\" 'currency\)
 \(null \(typep \"usd\" 'currency\)\)
:SEE-ALSO `language-code-p', `iso-4217-code-p', `iso-3166-1-alpha-2-code-p',
`*iso-4217-codes*' `*iso-3166-1-alpha-2-codes*' `language', `currency',
`region'."
  '(satisfies iso-4217-code-p))

(deftype language ()
  "An Etsy currency type which the API docs define thusly:
 \"language
  An IETF language code.
  Currently supported values: en, de, fr\"
 :EXAMPLE
 \(typep \"us\" 'language\)
 \(null \(typep \"US\" 'language\)\)
:SEE-ALSO `language-code-p', `iso-4217-code-p', `iso-3166-1-alpha-2-code-p',
`*iso-4217-codes*' `*iso-3166-1-alpha-2-codes*' `language', `currency',
`region'."
  '(satisfies language-code-p))

(defun language-code-p (maybe-language-code)
  (and (stringp maybe-language-code)
       (eql (length maybe-language-code) 2)
       (or (string= maybe-language-code "en")
           (string= maybe-language-code "de")
           (string= maybe-language-code "fr"))
       t))

(defun iso-3166-1-alpha-2-code-p (maybe-iso-code)
  "Whether MAYBE-ISO-CODE is a string present as hashtable key of `*iso-3166-1-alpha-2-codes*'.
:EXAMPLE
 \(and \(iso-3166-1-alpha-2-code-p \"US\"\)
      \(null \(iso-3166-1-alpha-2-code-p \"us\"\)\)
      \(null \(iso-3166-1-alpha-2-code-p 42\)\)\)
:SEE-ALSO `language-code-p', `iso-4217-code-p', `iso-3166-1-alpha-2-code-p',
`*iso-4217-codes*' `*iso-3166-1-alpha-2-codes*' `language', `currency',
`region'."
  (and (stringp maybe-iso-code)
       (eql (length maybe-iso-code) 2)
       (gethash maybe-iso-code *iso-3166-1-alpha-2-codes*)
       t))

(defun iso-4217-code-p (maybe-iso-code)
  "Whether MAYBE-ISO-CODE is a string present as hashtable key of `*iso-4217-codes*'
:EXAMPLE
 \(and \(iso-4217-code-p \"USD\"\)
      \(null \(iso-3166-1-alpha-2-code-p \"usd\"\)\)
      \(null \(iso-3166-1-alpha-2-code-p 42\)\)\)
:SEE-ALSO `language-code-p', `iso-4217-code-p', `iso-3166-1-alpha-2-code-p',
`*iso-4217-codes*' `*iso-3166-1-alpha-2-codes*' `language', `currency',
`region'."
  (and (stringp maybe-iso-code)
       (eql (length maybe-iso-code) 2)
       (gethash maybe-iso-code *iso-4217-codes*)
       t))

;; (and (int-string-p "88") (null (int-string-p "88.0")))
(defun int-string-p (maybe-int-string)
  (and (stringp maybe-int-string)
       (not (zerop (length maybe-int-string)))
       (every #'digit-char-p maybe-int-string)
       t))

(defun int-or-int-string-p (maybe-int-or-int-string)
  (typep maybe-int-or-int-string 'int-or-int-string))

(defun int-to-int-string (int &optional stream)
  (declare (int int))
  (check-type int int)
  (if stream
      (princ int stream)
      (princ-to-string int)))

(defun int-string-to-int (int-string)
  (assert (int-string-p int-string))
  (parse-integer int-string :radix 10))

;; (and (ensure-int "42") (ensure-int 42))
(defun ensure-int (int-or-int-string)
  (declare (int-or-int-string int-or-int-string))
  (check-type int-or-int-string int-or-int-string)
  (if (typep int-or-int-string 'int) 
      int-or-int-string
      (int-string-to-int int-or-int-string)))

(defun ensure-int-string (int-or-int-string)
  (declare (int-or-int-string int-or-int-string))
  (check-type int-or-int-string int-or-int-string)
  (if (stringp int-or-int-string)
      int-or-int-string
      (int-to-int-string int-or-int-string)))

(defun id-or-name-for-etsy (int-or-string)
  "Convert int-or-string (an int or string) to an Etsy representation."
  (declare (int-or-string int-or-string))
  (check-type int-or-string int-or-string)
  (if (stringp int-or-string)
      int-or-string
      (int-to-int-string int-or-string)))

(defun array-id-or-name-for-etsy (seq-of-id-or-names)
  "Convert SEQ-OF-ID-OR-NAMES to an Etsy array(id-or-name) representation.
Intersperse each element of SEQ-OF-ID-OR-NAMES with a #\\, converting any
positive integer values to their string equivalent.
:EXAMPLE
 \(array-id-or-name-for-etsy  \(list \"id-a\" 1 \"id-b\" 10 \"id-c\" 100\)\)
The Etsy API defines an array thusly:
 \"array\(type\)
  A list of values, separated by commas \(#\\,\).
  Do not include parentheses or brackets. 
  Each value must be a valid instance of <TYPE>.\"
Relavant for (at least) the following Etsy parameter types:
 array(string)
 array(int)
 array(shop_id_or_name)
 array(team_id_or_name)
 array(user_id_or_name)
"
  (declare (list seq-of-id-or-names))
  (unless (null seq-of-id-or-names)
    (loop 
      for int-or-int-string in seq-of-id-or-names
      for ensured = (id-or-name-for-etsy int-or-int-string)
      collect ensured into gthr
      finally (return (format nil "~{~A~^,~}" gthr)))))


;;; ==============================
;;; EOF
