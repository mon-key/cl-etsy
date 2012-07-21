;;; :FILE-CREATED <Timestamp: #{2012-06-28T13:10:53-04:00Z}#{12264} - by MON>
;;; :FILE cl-etsy/specials.lisp
;;; ==============================


(in-package #:cl-etsy)

;; v1 "http://beta-api.etsy.com/v1"
(defvar *base-url* "http://openapi.etsy.com/v2" ; "http://sandbox.openapi.etsy.com/v2"
  
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
:SEE-ALSO `set-etsy-environment', `etsy-environment'.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_entry_points')")

(defvar *api-key* "You need to set your *API-KEY*"
"This can be found at: (URL `https://www.etsy.com/developers/your-apps')
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*', `make-api-consumer-token', `set-api-consumer-token'.")

(defvar *api-shared-secret* "You need to set your *api-shared-secret*"
"This can be found at: (URL `https://www.etsy.com/developers/your-apps')
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`make-api-consumer-token', `set-api-consumer-token'.")

(defvar *api-consumer-token* nil
  "A `cl-auth:consumer-token' object generated with `make-api-consumer-token'.
Value should be set at runtime with `set-api-consumer-token'.
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`make-api-consumer-token', `set-api-consumer-token'.")

(defvar *api-request-token* nil)

(defvar *api-access-token* nil)

(defvar *api-default-permission-scope* 
  (list "email_r" "listings_r" "listings_w" "listings_d" "transactions_r"
        "transactions_w" "billing_r" "profile_r" "profile_w" "address_r" "address_w"
        "favorites_rw" "shops_rw" "cart_rw" "recommend_rw" "feedback_r" "treasury_w")
  "The default permission-scope's we request authorization to consume.
For use with `get-default-permission-scope-parameter'.")

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

(defun set-api-consumer-token ()
  "Set value of `*api-consumer-token*' to return value of `make-api-consumer-token'.
:EXAMPLE
 (and (set-api-consumer-token)
      (equal (slot-value  *api-consumer-token* 'cl-oauth::key) *api-key*)
      (equal (slot-value  *api-consumer-token* 'cl-oauth::secret) *api-shared-secret*))
:SEE-ALSO `*api-shared-secret*',`*api-consumer-token*', `*api-key*',
`make-api-consumer-token', `set-api-consumer-token'."
  (setf *api-consumer-token* (make-api-consumer-token)))

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
    finally (return ht)))

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
    finally (return ht)))

(defparameter *api-response-string-symbol-hash-for-object-key-fn* (make-hash-table :test #'equal)
  "Hash-table mapping Etsy API strings to Lispy symbols/keywords.
:EXAMPLE
 \(gethash \"type\" *api-response-string-symbol-hash-for-object-key-fn*\)
 \(gethash :type *api-response-string-symbol-hash-for-object-key-fn*\)")


;;; ==============================
;;; EOF
