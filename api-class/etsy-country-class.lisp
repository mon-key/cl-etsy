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

|#

(in-package #:cl-etsy)

;; Country
(defclass country (base-etsy)
  (
   ;; country_id
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
    :documentation "The country's plain-English name slugified; suitable for interpolation into a url.")

   ;; lat
   (lat
    :initarg :lat
    :accessor lat
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The country's latitude.")

   ;; lon
   (lon
    :initarg :lon
    :accessor lon
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The country's longitude.")
   )
  ;; (:default-initargs 
  ;;  :country-id nil :iso-country-code nil :world-bank-country-code nil :name nil
  ;;  :slug nil :lat nil :lon nil)
  (:documentation "Represents a geographical country and its location.
 (URL `http://www.etsy.com/developers/documentation/reference/country')"))


;;; ==============================
;;; EOF
