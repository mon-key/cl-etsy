;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-country-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/country')

----
API-ASSOCIATIONS

----
API-METHODS

"findAllCountry"
"getCountry"

----
 (closer-mop:class-finalized-p (find-class 'country))
 (api-implicit-class-direct-slot-names-as-underscored-strings  'country)

----
:NOTE  On 2012-07-25 we learned that some countries (mostly Islands) do not have a lat or lon values
 (loop 
   for country in (parsed-api-call (concatenate 'string *base-url* "/countries") :object-as :alist)
   for lon-float = (cdr (assoc :lon country))
   for lat-float = (cdr (assoc :lat country))
  ;; collect (list lon-float lat-float))
  when (or (null lon-float)
           (null lat-float))
  collect (cdr (assoc :name country)))

   
=> ("American Samoa" "Andorra" "Anguilla" "Antigua and Barbuda" "Aruba" "Bahamas"
     "Bahrain" "Barbados" "Bouvet Island" "British Indian Ocean Territory"
     "British Virgin Islands" "Cayman Islands" "Christmas Island"
     "Cocos (Keeling) Islands" "Comoros" "Cook Islands" "Dominica"
     "Falkland Islands (Malvinas)" "Faroe Islands" "Fiji" "French Polynesia"
     "French Southern Territories" "Gibraltar" "Grenada" "Guadeloupe" "Guam"
     "Heard Island and McDonald Islands" "Holy See (Vatican City State)"
     "Isle of Man" "Kiribati" "Kosovo" "Liechtenstein" "Macao" "Maldives" "Malta"
     "Marshall Islands" "Martinique" "Mauritius" "Mayotte"
     "Micronesia, Federated States of" "Monaco" "Montserrat" "Nauru"
     "Netherlands Antilles" "New Caledonia" "Niue" "Norfolk Island"
     "Northern Mariana Islands" "Palau" "Palestinian Territory, Occupied"
     "Saint Helena" "Saint Kitts and Nevis" "Saint Lucia"
     "Saint Martin (French part)" "Saint Pierre and Miquelon"
     "Saint Vincent and the Grenadines" "Samoa" "San Marino"
     "Sao Tome and Principe" "Seychelles" "Solomon Islands"
     "South Georgia and the South Sandwich Islands" "Svalbard and Jan Mayen"
     "Timor-Leste" "Tokelau" "Tonga" "Turks and Caicos Islands" "Tuvalu"
     "United States Minor Outlying Islands" "U.S. Virgin Islands")

 (parsed-api-call (concatenate 'string *base-url* "/listings/active")
                 :parameters '(;; Mali
                               ;; ("lat" . "-3.31")
                               ;; ("lon" . "17.33")
                               ;; France
                               ("lon" . "2.72")
                               ("lat" . "46.53"))
                 :object-as :alist) 
 

|#



(in-package #:cl-etsy)

;; Country
(defclass country (base-etsy)
  (;; country_id
   (country-id
    :initarg :country-id
    :accessor country-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The country's numeric ID.")

   ;; iso_country_code
   (iso-country-code
    :initarg :iso-country-code
    :accessor iso-country-code
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The two-letter country code according to ISO 3166-1-alpha-2.")

   ;; world_bank_country_code
   (world-bank-country-code
    :initarg :world-bank-country-code
    :accessor world-bank-country-code
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The three-letter country code according to the World Bank.")

   ;; name
   (name
    :initarg :name
    :accessor name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The country's plain-English name.")

   ;; slug
   (slug
    :initarg :slug
    :accessor slug
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The country's plain-English name slugified; suitable for interpolation into a URL.")

   ;; lat
   (lat
    :initarg :lat
    :accessor lat
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The country's latitude.
:NOTE on 2012-07-25 we notice that some countries (mostly islands) have a null value.")

   ;; lon
   (lon
    :initarg :lon
    :accessor lon
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The country's longitude.
:NOTE on 2012-07-25 we notice that some countries (mostly islands) have a null value."))

  ;; (:default-initargs 
  ;;  :country-id nil :iso-country-code nil :world-bank-country-code nil :name nil
  ;;  :slug nil :lat nil :lon nil)

  (:documentation "Represents a geographical country and its location.
 (URL `http://www.etsy.com/developers/documentation/reference/country')"))

#|

  | (parsed-api-call (concatenate 'string *base-url* "/countries") :object-as :alist)

  ((:NAME        . "findAllCountry")
   (:DESCRIPTION . "Finds all Country.")
   (:URI         . "/countries")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "Country")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

 | (parsed-api-call (concatenate 'string *base-url* "/countries/" "302") :object-as :alist)

  ((:NAME        . "getCountry")
   (:DESCRIPTION . "Retrieves a Country by id.")
   (:URI         . "/countries/:country_id")
   (:PARAMS
    (:COUNTRY-ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "Country")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

|#

;;; ==============================
;;; EOF
