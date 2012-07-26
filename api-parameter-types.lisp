;;; :FILE-CREATED <Timestamp: #{2012-07-10T15:24:54-04:00Z}#{12282} - by MON>
;;; :FILE #P"cl-etsy/api-parameter-types.lisp"
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_parameter_types')

:Parameter-Types

Many API methods take one or more parameters, either as query parameters of the
URL itself, or as POST parameters. The documentation for each method references
these standard types:

;; api-string
string
"Any string (up to 255 characters)."

;; api-int
; deftype exists
int
"A whole number value."

epoch
"A whole number value representing UNIX epoch time, or any string accepted by
PHP's strtotime() function."

;; api-float
float
"A number with or without a decimal point. 
Represented in output as a string, to avoid precision errors."

;; api-boolean
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

 Return all 41 unique parameter types
 (api-method-unique-parameter-types)

 ("boolean"
  "cart_id"
  "category"
  "color_triplet"
  "color_wiggle"
  "epoch"
  "float"
  "forum_post"
  "image"
  "int"
  "language"
  "latitude"
  "longitude"
  "region"
  "shop_id_or_name"
  "string"
  "string (length >= 3)"
  "text"
  "treasury_description"
  "treasury_id"
  "treasury_search_string"
  "treasury_title"
  "user_id_or_name"
  "array(int)"
  "array(shop_id_or_name)"
  "array(string)"
  "array(team_id_or_name)"
  "array(user_id_or_name)"
  "enum(active, draft)"
  "enum(active, inactive, draft)"
  "enum(active, invited, pending)"
  "enum(anniversary, baptism, bar_or_bat_mitzvah, birthday, canada_day, chinese_new_year, cinco_de_mayo, confirmation, christmas, day_of_the_dead, easter, eid, engagement, fathers_day, get_well, graduation, halloween, hanukkah, housewarming, kwanza, prom, july_4th, mothers_day, new_baby, new_years, quinceanera, retirement, st_patricks_day, sweet_16, sympathy, thanksgiving, valentines, wedding)"
  "enum(city, state, country)"
  "enum(created, price)"
  "enum(created, price, score)"
  "enum(hotness, created)"
  "enum(i_did, collective, someone_else)"
  "enum(made_to_order, 2010_2012, 2000_2009, 1993_1999, before_1993, 1990_1992, 1980s, 1970s, 1960s, 1950s, 1940s, 1930s, 1920s, 1910s, 1900s, 1800s, 1700s, before_1700)"
  "enum(men, women, unisex_adults, teen_boys, teen_girls, teens, boys, girls, children, baby_boys, baby_girls, babies, birds, cats, dogs, pets)"
  "enum(open, unshipped, unpaid, completed, processing, all)"
  "enum(up, down)"
)

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


----

 By redefining the following two function `yason:parse' and
 `yason::parse-constant' and adding a new variable
 `*parse-json-null-as-keyword*' we can parse JSON "null" as the keyowrd :NULL.

 We opened an issue suggesting this change be incorporated in yason as:
  "Feature Request - enable yason:parse to parse JSON null as the keyword :NULL"
  (URL `https://github.com/hanshuebner/yason/issues/13')
 and issued a pull request with our interpretation as to how this might be implemented:
  (URL `https://github.com/hanshuebner/yason/pull/14')

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

(deftype api-request-parse-object-as ()
  "The valid parameter values for yason :object-as keywords 
`yason:*parse-object-as*'"
  '(member :hash-table :plist :alist))

;; (deftype api-request-parsed-object-type ()
;;   "The valid types of objects returned by `yason:parse' as per the OBJECT-AS keyword.
;; Either hash-table or list."
;;   '(or list hash-table))

;; (deftype api-null ()
;;   (or :null null))

(deftype int ()
  "An Etsy API integer type
The documentation describes an int as:
 \"A whole number value.\"
Following returns the API methods with parameter-types declared as type \"int\":
\(api-method-find-methods-with-param-type *api-method-table* \"int\"\)
"
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
  "Whether MAYBE-ISO-CODE is a valid Etsy API language code.
A valid language code is a two character string 
which is string= one of:
 \"en\" \"de\" \"fr\"
:EXAMPLE
 \(and \(language-code-p \"en\"\)
      \(every #'null \(list \(language-code-p \"EN\"\)
                          \(language-code-p \"En\"\)
                          \(language-code-p \"eN\"\)\)\)\)
:NOTE Currently we return true of MAYBE-LANGUAGE-CODE only if each character of
satisfies `cl:lower-case-p'. The Etsy API documentation does not clarify if
case-insensitivity is a concern so we assume it isn't.
:SEE-ALSO `language-code-p', `iso-4217-code-p', `iso-3166-1-alpha-2-code-p',
`*iso-4217-codes*' `*iso-3166-1-alpha-2-codes*' `language', `currency',
`region'."
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

(deftype listing-state ()
  "A value declared as permissible for the state field of a `listing' object.
  active removed sold_out expired alchemy edit create private unavailable
 (URL `http://www.etsy.com/developers/documentation/reference/listing#section_fields')
:SEE-ALSO `listing-state-p'"
  '(and string
    (satisfies listing-state-p)))

(defun listing-state-p (state)
  "Whether STATE is one of the valid values declared as permissible for the state field of a listing object.
True when state is one of:
 active removed sold_out expired alchemy edit create private unavailable
:SEE (URL `http://www.etsy.com/developers/documentation/reference/listing#section_fields')"
  (and (stringp state) 
       (>= (length state) 4)
       (loop for x in '("active" "removed" "sold_out"
                        "expired" "alchemy" "edit" "create"
                        "private" "unavailable")
             thereis (equal state x))))


;; (deftype api-boolean ()
;; "A
;; \(api-method-find-methods-with-param-type *api-method-table* \"boolean\"\)"
;; '(...))
;;
;; one of either "false" or "true"
;; The api-classes with slots declared to be an etsy-boolean.
;; ((avatar (is-black-and-white ))
;;  (billing-overview (is-overdue))
;;  (coupon (is-overdue seller-active free-shipping domestic-only))
;;  (listing (is-black-and-white is-supply))
;;  (listing-image (is-black-and-white))
;;  (payment-template (allow-bt allow-check allow-mo allow-other allow-paypal allow-cc))
;;  (receipt (was-paid was-shipped))
;;  (shop (is-vacation is-refusing-alchemy))
;;  (treasury (mature))
;;  (user-profile (is-seller)))

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

(defun %each-a-string-p (string-list)
  ;; api-string-or-symbol-list-hash-for-object-key-fn
  (every #'(lambda (x) (and (stringp x) 
                            (not (zerop (length x)))))
         string-list))

(defun %each-a-symbol-p (symbol-list)
  ;; api-string-or-symbol-list-hash-for-object-key-fn
  (every #'(lambda (sym) (and (symbolp t) 
                              (not (typep sym 'cl:boolean))))
             symbol-list))

#|
 
 (defun api-method-param-type-lookup (parameter-type)
  (declare (or null string parameter-type))
  (when parameter-type
    (let ((array-or-enum (subseq parameter-type 0 3)))
      (cond ((string= array-or-enum "arr")
             (etsy-array-type-to-lisp-type parameter-type))
            ((string= array-or-enum "enu")
             (etsy-enum-type-to-lisp-type parameter-type))
            (t 
             )))))

|#

;;; ==============================
;;; EOF
