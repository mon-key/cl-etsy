;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-listing-translation-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/listingtranslation')

----
API-METHODS
"getListingTranslation"

----
 (closer-mop:class-finalized-p (find-class 'listing-translation))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'listing-translation)

|#

(in-package #:cl-etsy)

;; ListingTranslation
(defclass listing-translation (base-etsy)
  (;; listing_id
   (listing-id
    :initarg :listing-id
    :accessor listing-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID for the Listing.")

   (language
    :initarg :language
    :accessor language
    ;; :visibility public
    ;; :perm-scope none
    ;; :type language
    :documentation "The IETF language tag (e.g. 'fr') for the language of this translation.")

   (title
    :initarg :title
    :accessor title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The title of the Listing of this Translation.")

   (description
    :initarg :description
    :accessor description
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The description of the Listing of this Translation.")

   (tags
    :initarg :tags
    :accessor tags
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(string)
    :documentation "The description of the Listing of this Translation."))

  ;; (:default-initargs 
  ;;  :listing-id nil :language nil :title nil :description nil :tags nil)

  (:documentation "Represents the translation data for a Listing.
 (URL `http://www.etsy.com/developers/documentation/reference/listingtranslation')"))


#|

 ((:NAME        . "getListingTranslation")
  (:DESCRIPTION . "Retrieves a ListingTranslation by listing_id and language")
  (:URI         . "/listings/:listing_id/translations/:language")
  (:PARAMS
   (:LISTING-ID . "int")
   (:LANGUAGE    . "language"))
  (:DEFAULTS)
  (:TYPE         . "ListingTranslation")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

|#

;;; ==============================
;;; EOF
