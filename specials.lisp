;;; :FILE-CREATED <Timestamp: #{2012-06-28T13:10:53-04:00Z}#{12264} - by MON>
;;; :FILE cl-etsy/specials.lisp
;;; ==============================

#|

|#

(in-package #:cl-etsy)

;; :NOTE The v1 Etsy API had the following URL: "http://beta-api.etsy.com/v1"
(defvar *base-url* "http://openapi.etsy.com/v2"  ; :production endpoint-type
  ;; "http://sandbox.openapi.etsy.com/v2" ; :sandbox endpoint-type
"Value should be a string referencing a URL for an Etsy API endpoint.
Valid settings are either:

 \"http://openapi.etsy.com/v2\"         - production endpoint
 \"http://sandbox.openapi.etsy.com/v2\" - sandbox endpoint

 \"The production entry point provides general access to public data using the
  standard parameter api_key for authentication, or protected access to private
  member data using OAuth for authentication. All fields and associations listed
  below as \"private\" will be unavailable without OAuth authentication.

  The sandbox entry point works similarly to the production entry point, but uses
  an isolated database with no real Etsy data. The sandbox provides developers
  with a way to test API methods that write data to Etsy, without disturbing real
  Etsy data or incurring fees for listing on Etsy.

  Developers will need to authenticate their OAuth-based apps separately against the sandbox API.
  OAuth tokens obtained from the sandbox API will not work with the production API.\"
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_entry_points')
:SEE-ALSO `set-etsy-environment', `etsy-environment', `endpoint-type'.")

(defvar *api-key* "You need to set your *API-KEY*"
"This can be found at: (URL `https://www.etsy.com/developers/your-apps')
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`*api-default-permission-scope*', `make-api-consumer-token',
`set-api-consumer-token'.")

(defvar *api-shared-secret* "You need to set your *api-shared-secret*"
"This can be found at: (URL `https://www.etsy.com/developers/your-apps')
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`*api-default-permission-scope*', `make-api-consumer-token',
`set-api-consumer-token'.")

(defvar *api-consumer-token* nil
  "A `cl-auth:consumer-token' object generated with `make-api-consumer-token'.
Value should be set at runtime with `set-api-consumer-token'.
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`*api-default-permission-scope*', `make-api-consumer-token', `set-api-consumer-token'.")

(defvar *api-default-permission-scope*
  ;; (list 
  '("email_r" "listings_r" "listings_w" "listings_d" "transactions_r"
    "transactions_w" "billing_r" "profile_r" "profile_w" "address_r" "address_w"
    "favorites_rw" "shops_rw" "cart_rw" "recommend_rw" "feedback_r" "treasury_w")
  "The default Etsy API permission-scope's we request authorization for API method calls to consume.
For use with `get-default-permission-scope-parameter'.
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`*api-default-permission-scope*', `make-api-consumer-token', `set-api-consumer-token'.")

(defvar *api-request-token* nil)

(defvar *api-access-token* nil)

;; :NOTE make-api-consumer-token and set-api-consumer-token should stay with
;; this file b/c they depend on the initial string values of *api-key* and
;; *api-shared-secret*
(defun make-api-consumer-token ()
  "Generate a consumer token as if by `cl-oauth:make-consumer-token'
When non-nil `*api-key*' and `*api-shared-secret*' are used as arguments for
KEY and SECRET keyword arguments of `cl-oauth:make-consumer-token'.
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`make-api-consumer-token', `set-api-consumer-token'."
  (if (or (null *api-shared-secret*)
          (equal *api-shared-secret* "You need to set your *api-shared-secret*"))
      (values nil *api-shared-secret*)
      (if (or (null *api-key*)
              (equal *api-key* "You need to set your *API-KEY*"))
          (values nil *api-key*)
          (cl-oauth:make-consumer-token :key *api-key* :secret *api-shared-secret*))))

(defparameter *api-method-table-json-pathname* nil
  "For use with `set-api-method-table-from-parsed-json-pathname'.")

(defparameter *api-method-table* nil
  "An a list containing the api-method's of Etsy API \"getMethodTable\" method after parsing with `yason:parsed'.
Use for caching retrieved api-methods for automagically building cl-etsy.
:SEE-ALSO `api-method-unique-parameter-types', `api-method-find-methods-with-param-type', `get-method-table',
`api-method-unique-parameter-names', `api-method-unique-parameter-names-hashed-verify-all-keyword-p', `api-method'.")

(defvar *iso-3166-1-alpha-2-codes* 
  (loop 
    with ht = (make-hash-table  :size 251 :test #'equal) 
    for (code . country) in 
    '(("AF" . "AFGHANISTAN") ("AX" . "ÅLAND ISLANDS") ("AL" . "ALBANIA")
      ("DZ" . "ALGERIA") ("AS" . "AMERICAN SAMOA") ("AD" . "ANDORRA")
      ("AO" . "ANGOLA") ("AI" . "ANGUILLA") ("AQ" . "ANTARCTICA")
      ("AG" . "ANTIGUA AND BARBUDA") ("AR" . "ARGENTINA") ("AM" . "ARMENIA")
      ("AW" . "ARUBA") ("AU" . "AUSTRALIA") ("AT" . "AUSTRIA") ("AZ" . "AZERBAIJAN")
      ("BS" . "BAHAMAS") ("BH" . "BAHRAIN") ("BD" . "BANGLADESH")
      ("BB" . "BARBADOS") ("BY" . "BELARUS") ("BE" . "BELGIUM") ("BZ" . "BELIZE")
      ("BJ" . "BENIN") ("BM" . "BERMUDA") ("BT" . "BHUTAN")
      ("BO" . "BOLIVIA, PLURINATIONAL STATE OF")
      ("BQ" . "BONAIRE, SINT EUSTATIUS AND SABA") ("BA" . "BOSNIA AND HERZEGOVINA")
      ("BW" . "BOTSWANA") ("BV" . "BOUVET ISLAND") ("BR" . "BRAZIL")
      ("IO" . "BRITISH INDIAN OCEAN TERRITORY") ("BN" . "BRUNEI DARUSSALAM")
      ("BG" . "BULGARIA") ("BF" . "BURKINA FASO") ("BI" . "BURUNDI")
      ("KH" . "CAMBODIA") ("CM" . "CAMEROON") ("CA" . "CANADA")
      ("CV" . "CAPE VERDE") ("KY" . "CAYMAN ISLANDS")
      ("CF" . "CENTRAL AFRICAN REPUBLIC") ("TD" . "CHAD") ("CL" . "CHILE")
      ("CN" . "CHINA") ("CX" . "CHRISTMAS ISLAND")
      ("CC" . "COCOS (KEELING) ISLANDS") ("CO" . "COLOMBIA") ("KM" . "COMOROS")
      ("CG" . "CONGO") ("CD" . "CONGO, THE DEMOCRATIC REPUBLIC OF THE")
      ("CK" . "COOK ISLANDS") ("CR" . "COSTA RICA") ("CI" . "CÔTE D'IVOIRE")
      ("HR" . "CROATIA") ("CU" . "CUBA") ("CW" . "CURAÇAO") ("CY" . "CYPRUS")
      ("CZ" . "CZECH REPUBLIC") ("DK" . "DENMARK") ("DJ" . "DJIBOUTI")
      ("DM" . "DOMINICA") ("DO" . "DOMINICAN REPUBLIC") ("EC" . "ECUADOR")
      ("EG" . "EGYPT") ("SV" . "EL SALVADOR") ("GQ" . "EQUATORIAL GUINEA")
      ("ER" . "ERITREA") ("EE" . "ESTONIA") ("ET" . "ETHIOPIA")
      ("FK" . "FALKLAND ISLANDS (MALVINAS)") ("FO" . "FAROE ISLANDS")
      ("FJ" . "FIJI") ("FI" . "FINLAND") ("FR" . "FRANCE") ("GF" . "FRENCH GUIANA")
      ("PF" . "FRENCH POLYNESIA") ("TF" . "FRENCH SOUTHERN TERRITORIES")
      ("GA" . "GABON") ("GM" . "GAMBIA") ("GE" . "GEORGIA") ("DE" . "GERMANY")
      ("GH" . "GHANA") ("GI" . "GIBRALTAR") ("GR" . "GREECE") ("GL" . "GREENLAND")
      ("GD" . "GRENADA") ("GP" . "GUADELOUPE") ("GU" . "GUAM") ("GT" . "GUATEMALA")
      ("GG" . "GUERNSEY") ("GN" . "GUINEA") ("GW" . "GUINEA-BISSAU")
      ("GY" . "GUYANA") ("HT" . "HAITI")
      ("HM" . "HEARD ISLAND AND MCDONALD ISLANDS")
      ("VA" . "HOLY SEE (VATICAN CITY STATE)") ("HN" . "HONDURAS")
      ("HK" . "HONG KONG") ("HU" . "HUNGARY") ("IS" . "ICELAND") ("IN" . "INDIA")
      ("ID" . "INDONESIA") ("IR" . "IRAN, ISLAMIC REPUBLIC OF") ("IQ" . "IRAQ")
      ("IE" . "IRELAND") ("IM" . "ISLE OF MAN") ("IL" . "ISRAEL") ("IT" . "ITALY")
      ("JM" . "JAMAICA") ("JP" . "JAPAN") ("JE" . "JERSEY") ("JO" . "JORDAN")
      ("KZ" . "KAZAKHSTAN") ("KE" . "KENYA") ("KI" . "KIRIBATI")
      ("KP" . "KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF")
      ("KR" . "KOREA, REPUBLIC OF") ("KW" . "KUWAIT") ("KG" . "KYRGYZSTAN")
      ("LA" . "LAO PEOPLE'S DEMOCRATIC REPUBLIC") ("LV" . "LATVIA")
      ("LB" . "LEBANON") ("LS" . "LESOTHO") ("LR" . "LIBERIA") ("LY" . "LIBYA")
      ("LI" . "LIECHTENSTEIN") ("LT" . "LITHUANIA") ("LU" . "LUXEMBOURG")
      ("MO" . "MACAO") ("MK" . "MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF")
      ("MG" . "MADAGASCAR") ("MW" . "MALAWI") ("MY" . "MALAYSIA")
      ("MV" . "MALDIVES") ("ML" . "MALI") ("MT" . "MALTA")
      ("MH" . "MARSHALL ISLANDS") ("MQ" . "MARTINIQUE") ("MR" . "MAURITANIA")
      ("MU" . "MAURITIUS") ("YT" . "MAYOTTE") ("MX" . "MEXICO")
      ("FM" . "MICRONESIA, FEDERATED STATES OF") ("MD" . "MOLDOVA, REPUBLIC OF")
      ("MC" . "MONACO") ("MN" . "MONGOLIA") ("ME" . "MONTENEGRO")
      ("MS" . "MONTSERRAT") ("MA" . "MOROCCO") ("MZ" . "MOZAMBIQUE")
      ("MM" . "MYANMAR") ("NA" . "NAMIBIA") ("NR" . "NAURU") ("NP" . "NEPAL")
      ("NL" . "NETHERLANDS") ("NC" . "NEW CALEDONIA") ("NZ" . "NEW ZEALAND")
      ("NI" . "NICARAGUA") ("NE" . "NIGER") ("NG" . "NIGERIA") ("NU" . "NIUE")
      ("NF" . "NORFOLK ISLAND") ("MP" . "NORTHERN MARIANA ISLANDS")
      ("NO" . "NORWAY") ("OM" . "OMAN") ("PK" . "PAKISTAN") ("PW" . "PALAU")
      ("PS" . "PALESTINIAN TERRITORY, OCCUPIED") ("PA" . "PANAMA")
      ("PG" . "PAPUA NEW GUINEA") ("PY" . "PARAGUAY") ("PE" . "PERU")
      ("PH" . "PHILIPPINES") ("PN" . "PITCAIRN") ("PL" . "POLAND")
      ("PT" . "PORTUGAL") ("PR" . "PUERTO RICO") ("QA" . "QATAR") ("RE" . "RÉUNION")
      ("RO" . "ROMANIA") ("RU" . "RUSSIAN FEDERATION") ("RW" . "RWANDA")
      ("BL" . "SAINT BARTHÉLEMY")
      ("SH" . "SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA")
      ("KN" . "SAINT KITTS AND NEVIS") ("LC" . "SAINT LUCIA")
      ("MF" . "SAINT MARTIN (FRENCH PART)") ("PM" . "SAINT PIERRE AND MIQUELON")
      ("VC" . "SAINT VINCENT AND THE GRENADINES") ("WS" . "SAMOA")
      ("SM" . "SAN MARINO") ("ST" . "SAO TOME AND PRINCIPE") ("SA" . "SAUDI ARABIA")
      ("SN" . "SENEGAL") ("RS" . "SERBIA") ("SC" . "SEYCHELLES")
      ("SL" . "SIERRA LEONE") ("SG" . "SINGAPORE")
      ("SX" . "SINT MAARTEN (DUTCH PART)") ("SK" . "SLOVAKIA") ("SI" . "SLOVENIA")
      ("SB" . "SOLOMON ISLANDS") ("SO" . "SOMALIA") ("ZA" . "SOUTH AFRICA")
      ("GS" . "SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS") ("SS" . "SOUTH SUDAN")
      ("ES" . "SPAIN") ("LK" . "SRI LANKA") ("SD" . "SUDAN") ("SR" . "SURINAME")
      ("SJ" . "SVALBARD AND JAN MAYEN") ("SZ" . "SWAZILAND") ("SE" . "SWEDEN")
      ("CH" . "SWITZERLAND") ("SY" . "SYRIAN ARAB REPUBLIC")
      ("TW" . "TAIWAN, PROVINCE OF CHINA") ("TJ" . "TAJIKISTAN")
      ("TZ" . "TANZANIA, UNITED REPUBLIC OF") ("TH" . "THAILAND")
      ("TL" . "TIMOR-LESTE") ("TG" . "TOGO") ("TK" . "TOKELAU") ("TO" . "TONGA")
      ("TT" . "TRINIDAD AND TOBAGO") ("TN" . "TUNISIA") ("TR" . "TURKEY")
      ("TM" . "TURKMENISTAN") ("TC" . "TURKS AND CAICOS ISLANDS") ("TV" . "TUVALU")
      ("UG" . "UGANDA") ("UA" . "UKRAINE") ("AE" . "UNITED ARAB EMIRATES")
      ("GB" . "UNITED KINGDOM") ("US" . "UNITED STATES")
      ("UM" . "UNITED STATES MINOR OUTLYING ISLANDS") ("UY" . "URUGUAY")
      ("UZ" . "UZBEKISTAN") ("VU" . "VANUATU")
      ("VE" . "VENEZUELA, BOLIVARIAN REPUBLIC OF") ("VN" . "VIET NAM")
      ("VG" . "VIRGIN ISLANDS, BRITISH") ("VI" . "VIRGIN ISLANDS, U.S.")
      ("WF" . "WALLIS AND FUTUNA") ("EH" . "WESTERN SAHARA") ("YE" . "YEMEN")
      ("ZM" . "ZAMBIA") ("ZW" . "ZIMBABWE"))
    do (setf (gethash code ht) country)
    finally (return ht))
"A proper alist of ISO 3166 Country codes.
Each element of alist is acons of the form:
 \(\"<AA>\" . \"<COUNTRY-NAME>\"\)
Element at car of each cons is a string comprised of two characters representing
the country code of a country with each character of the string satisfying
`cl:upper-case-p'.
Element at cdr of each cons is a string designating the country name to which
the country code corresponds with each character of the string satisfying
`cl:upper-case-p'.
:NOTE The Etsy API may not recognize all elements of this list as valid country codes.
:SEE-ALSO `language-code-p', `iso-4217-code-p', `iso-3166-1-alpha-2-code-p',
`*iso-4217-codes*' `*iso-3166-1-alpha-2-codes*' `language', `currency',
`region'.")

(defvar *iso-4217-codes* 
  (loop 
    with ht = (make-hash-table  :size 251 :test #'equal) 
    for (code . country) in 
       '(("AED" . "United Arab Emirates Dirham") ("AFN" . "Afghanistan Afghani")
         ("ALL" . "Albania Lek") ("AMD" . "Armenia Dram")
         ("ANG" . "Netherlands Antilles Guilder") ("AOA" . "Angola Kwanza")
         ("ARS" . "Argentina Peso") ("AUD" . "Australia Dollar")
         ("AWG" . "Aruba Guilder") ("AZN" . "Azerbaijan New Manat")
         ("BAM" . "Bosnia and Herzegovina Convertible Marka")
         ("BBD" . "Barbados Dollar") ("BDT" . "Bangladesh Taka")
         ("BGN" . "Bulgaria Lev") ("BHD" . "Bahrain Dinar") ("BIF" . "Burundi Franc")
         ("BMD" . "Bermuda Dollar") ("BND" . "Brunei Darussalam Dollar")
         ("BOB" . "Bolivia Boliviano") ("BRL" . "Brazil Real")
         ("BSD" . "Bahamas Dollar") ("BTN" . "Bhutan Ngultrum")
         ("BWP" . "Botswana Pula") ("BYR" . "Belarus Ruble") ("BZD" . "Belize Dollar")
         ("CAD" . "Canada Dollar") ("CDF" . "Congo/Kinshasa Franc")
         ("CHF" . "Switzerland Franc") ("CLP" . "Chile Peso")
         ("CNY" . "China Yuan Renminbi") ("COP" . "Colombia Peso")
         ("CRC" . "Costa Rica Colon") ("CUC" . "Cuba Convertible Peso")
         ("CUP" . "Cuba Peso") ("CVE" . "Cape Verde Escudo")
         ("CZK" . "Czech Republic Koruna") ("DJF" . "Djibouti Franc")
         ("DKK" . "Denmark Krone") ("DOP" . "Dominican Republic Peso")
         ("DZD" . "Algeria Dinar") ("EGP" . "Egypt Pound") ("ERN" . "Eritrea Nakfa")
         ("ETB" . "Ethiopia Birr") ("EUR" . "Euro Member Countries")
         ("FJD" . "Fiji Dollar") ("FKP" . "Falkland Islands (Malvinas) Pound")
         ("GBP" . "United Kingdom Pound") ("GEL" . "Georgia Lari")
         ("GGP" . "Guernsey Pound") ("GHS" . "Ghana Cedi") ("GIP" . "Gibraltar Pound")
         ("GMD" . "Gambia Dalasi") ("GNF" . "Guinea Franc")
         ("GTQ" . "Guatemala Quetzal") ("GYD" . "Guyana Dollar")
         ("HKD" . "Hong Kong Dollar") ("HNL" . "Honduras Lempira")
         ("HRK" . "Croatia Kuna") ("HTG" . "Haiti Gourde") ("HUF" . "Hungary Forint")
         ("IDR" . "Indonesia Rupiah") ("ILS" . "Israel Shekel")
         ("IMP" . "Isle of Man Pound") ("INR" . "India Rupee") ("IQD" . "Iraq Dinar")
         ("IRR" . "Iran Rial") ("ISK" . "Iceland Krona") ("JEP" . "Jersey Pound")
         ("JMD" . "Jamaica Dollar") ("JOD" . "Jordan Dinar") ("JPY" . "Japan Yen")
         ("KES" . "Kenya Shilling") ("KGS" . "Kyrgyzstan Som")
         ("KHR" . "Cambodia Riel") ("KMF" . "Comoros Franc")
         ("KPW" . "Korea (North) Won") ("KRW" . "Korea (South) Won")
         ("KWD" . "Kuwait Dinar") ("KYD" . "Cayman Islands Dollar")
         ("KZT" . "Kazakhstan Tenge") ("LAK" . "Laos Kip") ("LBP" . "Lebanon Pound")
         ("LKR" . "Sri Lanka Rupee") ("LRD" . "Liberia Dollar")
         ("LSL" . "Lesotho Loti") ("LTL" . "Lithuania Litas") ("LVL" . "Latvia Lat")
         ("LYD" . "Libya Dinar") ("MAD" . "Morocco Dirham") ("MDL" . "Moldova Leu")
         ("MGA" . "Madagascar Ariary") ("MKD" . "Macedonia Denar")
         ("MMK" . "Myanmar (Burma) Kyat") ("MNT" . "Mongolia Tughrik")
         ("MOP" . "Macau Pataca") ("MRO" . "Mauritania Ouguiya")
         ("MUR" . "Mauritius Rupee") ("MVR" . "Maldives (Maldive Islands) Rufiyaa")
         ("MWK" . "Malawi Kwacha") ("MXN" . "Mexico Peso") ("MYR" . "Malaysia Ringgit")
         ("MZN" . "Mozambique Metical") ("NAD" . "Namibia Dollar")
         ("NGN" . "Nigeria Naira") ("NIO" . "Nicaragua Cordoba")
         ("NOK" . "Norway Krone") ("NPR" . "Nepal Rupee")
         ("NZD" . "New Zealand Dollar") ("OMR" . "Oman Rial") ("PAB" . "Panama Balboa")
         ("PEN" . "Peru Nuevo Sol") ("PGK" . "Papua New Guinea Kina")
         ("PHP" . "Philippines Peso") ("PKR" . "Pakistan Rupee")
         ("PLN" . "Poland Zloty") ("PYG" . "Paraguay Guarani") ("QAR" . "Qatar Riyal")
         ("RON" . "Romania New Leu") ("RSD" . "Serbia Dinar") ("RUB" . "Russia Ruble")
         ("RWF" . "Rwanda Franc") ("SAR" . "Saudi Arabia Riyal")
         ("SBD" . "Solomon Islands Dollar") ("SCR" . "Seychelles Rupee")
         ("SDG" . "Sudan Pound") ("SEK" . "Sweden Krona") ("SGD" . "Singapore Dollar")
         ("SHP" . "Saint Helena Pound") ("SLL" . "Sierra Leone Leone")
         ("SOS" . "Somalia Shilling") ("SRD" . "Suriname Dollar")
         ("STD" . "São Tomé and Príncipe Dobra") ("SVC" . "El Salvador Colon")
         ("SYP" . "Syria Pound") ("SZL" . "Swaziland Lilangeni")
         ("THB" . "Thailand Baht") ("TJS" . "Tajikistan Somoni")
         ("TMT" . "Turkmenistan Manat") ("TND" . "Tunisia Dinar")
         ("TOP" . "Tonga Pa'anga") ("TRY" . "Turkey Lira")
         ("TTD" . "Trinidad and Tobago Dollar") ("TVD" . "Tuvalu Dollar")
         ("TWD" . "Taiwan New Dollar") ("TZS" . "Tanzania Shilling")
         ("UAH" . "Ukraine Hryvna") ("UGX" . "Uganda Shilling")
         ("USD" . "United States Dollar") ("UYU" . "Uruguay Peso")
         ("UZS" . "Uzbekistan Som") ("VEF" . "Venezuela Bolivar Fuerte")
         ("VND" . "Viet Nam Dong") ("VUV" . "Vanuatu Vatu") ("WST" . "Samoa Tala")
         ("XAF" . "Communauté Financière Africaine (BEAC) CFA Franc BEAC")
         ("XCD" . "East Caribbean Dollar")
         ("XDR" . "International Monetary Fund (IMF) Special Drawing Rights")
         ("XOF" . "Communauté Financière Africaine (BCEAO) Franc")
         ("XPF" . "Comptoirs Français du Pacifique (CFP) Franc") ("YER" . "Yemen Rial")
         ("ZAR" . "South Africa Rand") ("ZMK" . "Zambia Kwacha")
         ("ZWD" . "Zimbabwe Dollar"))
    do (setf (gethash code ht) country)
    finally (return ht))
"A proper alist of ISO 4217 currency codes.
Each element of alist is a cons with the format:
 \(\"<AAA>\" . \"<COUNTRY-NAME>\"\)
The element at car of each cons is a string comprised of three characters
representing the currency code of a country each character of string should
satisfy `cl:upper-case-p'.
The element at cdr of each cons is a string designating the long form name of the
currency to which the currency code corresponds.
:NOTE The Etsy API may not recognize all elements of this list as valid currency codes.
:SEE-ALSO `language-code-p', `iso-4217-code-p', `iso-3166-1-alpha-2-code-p',
`*iso-4217-codes*' `*iso-3166-1-alpha-2-codes*' `language', `currency',
`region'.")

(defparameter *api-classes-and-slots*
  '((api-method
     (name uri params defaults type http-method visibility))

    (avatar
     (avatar-id hex-code red green blue hue 
      saturation brightness is-black-and-white creation-tsz user-id))

    (bill-charge
     (bill-charge-id creation-tsz type type-id user-id amount currency-code
      creation-year creation-month last-modified-tsz))

    (billing-overview
     (is-overdue currency-code overdue-balance balance-due total-balance date-due date-overdue))

    (bill-payment
     (bill-payment-id creation-tsz type type-id user-id
      amount currency-code creation-month creation-year))

    (category
     (category-id name meta-title meta-keywords meta-description page-description
      page-title category-name short-name long-name num-children))

    (cart
     (cart-id shop-name message-to-seller destination-country-id coupon-code
      currency-code total subtotal shipping-cost tax-cost discount-amount
      shipping-discount-amount tax-discount-amount url listings))

    (cart-listing
     (listing-id purchase-quantity purchase-state))

    (country
     (country-id iso-country-code world-bank-country-code name slug lat lon))

    (coupon
     (coupon-id coupon-code seller-active pct-discount free-shipping domestic-only))

    (data-type
     (type 
      ;; this field is named values but we can't tolerate it.
      data-type-values)) 

    (favorite-listing
     (listing-id user-id listing-state create-date state creation-tsz favorite-listing-id))

    (favorite-user
     (user-id favorite-user-id target-user-id creation-tsz))

    (featured-treasury
     (treasury-id treasury-owner-id url region active-date))

    (feedback
     (feedback-id transaction-id creator-user-id target-user-id seller-user-id
      buyer-user-id creation-tsz message value image-feedback-id image-url-25x25
      image-url-155x125 image-url-fullxfull))

    (feedback-info
     (count score))

    (forum-post
     (thread-id post-id post user-id last-edit-time create-date))

    (ledger 
     (ledger-id shop-id currency create-date update-date))

    ;; :NOTE sequence is a build-in-class and type specifier
    (ledger-entry
     (ledger-entry-id ledger-id sequence credit-amount debit-amount entry-type
      reference-id running-balance create-date))

    (listing
     (listing-id state user-id category-id title description creation-tsz ending-tsz
      original-creation-tsz last-modified-tsz price currency-code quantity tags
      category-path materials shop-section-id featured-rank state-tsz hue saturation
      brightness is-black-and-white url views num-favorers who-made is-supply
      when-made recipient occasion style))

    (listing-image
     (listing-image-id hex-code red green blue hue saturation brightness
      is-black-and-white creation-tsz listing-id rank url-75x75 url-170x135
      url-570xn url-fullxfull full-height full-width))

    (listing-translation
     (listing-id language title description tags))

    (order
     (order-id user-id creation-tsz))

    (payment
     (payment-id buyer-user-id shop-id receipt-id amount-gross amount-fees
      amount-net posted-gross posted-fees posted-net adjusted-gross
      adjusted-fees adjusted-net currency shipping-user-id
      shipping-address-id billing-address-id status shipped-date
      create-date update-date))

    (param-list
     (param-name))

    (payment-template
     (payment-template-id allow-bt allow-check allow-mo allow-other allow-paypal
      allow-cc paypal-email name first-line second-line city state zip country-id
      user-id listing-payment-id))

    (receipt
     (receipt-id order-id seller-user-id buyer-user-id creation-tsz
      last-modified-tsz name first-line second-line city state zip country-id
      payment-method payment-email message-from-seller message-from-buyer was-paid
      total-tax-cost total-price total-shipping-cost currency-code
      message-from-payment was-shipped buyer-email seller-email discount-amt
      subtotal grandtotal shipping-tracking-code shipping-tracking-url
      shipping-carrier shipping-note))

    (region
     (region-id region-name))

    (shipping-info
     (shipping-info-id origin-country-id destination-country-id currency-code
      primary-cost secondary-cost listing-id region-id origin-country-name
      destination-country-name))

    (shipping-template
     (shipping-template-id title user-id))

    (shipping-template-entry
     (shipping-template-entry-id shipping-template-id currency-code origin-country-id
      destination-country-id destination-region-id primary-cost secondary-cost))

    (shop
     (shop-id shop-name first-line second-line city state zip country-id user-id
      creation-tsz title announcement currency-code is-vacation vacation-message
      sale-message last-updated-tsz listing-active-count login-name lat lon
      alchemy-message is-refusing-alchemy policy-welcome policy-payment
      policy-shipping policy-refunds policy-additional policy-seller-info
      policy-updated-tsz vacation-autoreply ga-code name url image-url-760x100
      num-favorers languages))

    (shop-section
     (shop-section-id title rank user-id active-listing-count))

    (shop-section-translation
     (shop-section-id language title))

    (shop-translation
     (shop-id language announcement policy-welcome policy-payment policy-shipping
      policy-refunds policy-additional policy-seller-info sale-message title
      vacation-autoreply vacation-message))

    (style
     (style-id style))

    (tag
     (tag name num-listings weight))

    (team
     (group-id name create-date update-date tags))

    (transaction
     (transaction-id title description seller-user-id buyer-user-id creation-tsz
      paid-tsz shipped-tsz price currency-code quantity tags materials
      image-listing-id receipt-id shipping-cost listing-id seller-feedback-id
      buyer-feedback-id transaction-type url))

    (treasury
     (id title description homepage mature locale comment-count tags counts hotness
      hotness-color user-id user-name user-avatar-id listings creation-tsz))

    (treasury-counts
     (clicks views shares reports))

    (treasury-listing
     (data creation-tsz))

    (treasury-listing-data
     (user-id title price listing-id state shop-name image-id))

    (user
     (user-id login-name primary-email creation-tsz referred-by-user-id feedback-info))

    (user-address
     (user-address-id user-id name first-line second-line city state zip country-id country-name))

    (user-profile
     (user-profile-id user-id login-name bio gender birth-month birth-day birth-year
      join-tsz materials country-id region city location avatar-id lat lon
      transaction-buy-count transaction-sold-count is-seller image-url-75x75
      first-name last-name)))
  "A proper list of containing symbols designating api-classes and the slots they are comprised of.
Each element of the proper-list of has the form:
 (<API-CLASS> (<SLOTS-OF-API-CLASS> ...))
<API-CLASS> is a symbol designating a class modeling some aspect of an Etsy API response
<SLOTS-OF-API-CLASS> is a list of symbols designating the the slots of <API-CLASS>.
Used for generating defgeneric forms of cl-etsy/api-class/etsy-class-generic.lisp
with `api-explicit-class-output-defgeneric-forms'
:SEE-ALSO `api-class-all-slot-names-unique', `api-class-all-slot-name-stats',
`api-explicit-class-output-defgeneric-forms', `*api-classes-and-slots*'.")

(defparameter *api-response-string-symbol-hash-for-object-key-fn* (make-hash-table :test #'equal)
  "Hash-table mapping Etsy API strings to Lispy symbols/keywords.
:EXAMPLE
 \(gethash \"type\" *api-response-string-symbol-hash-for-object-key-fn*\)
 \(gethash :type *api-response-string-symbol-hash-for-object-key-fn*\)")


;;; ==============================
;;; EOF
