;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:05:35-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-data-type-class.lisp
;;; ==============================

;; (URL `http://www.etsy.com/developers/documentation/reference/datatype')
;;
;; "describeOccasionEnum"
;; - Describes the legal values for Listing.occasion.
;;
;; "describeRecipientEnum"
;; - Describes the legal values for Listing.recipient.
;;
;; "describeWhenMadeEnum
;; - Describes the legal values for Listing.when_made.
;;
;; "describeWhoMadeEnum"
;; - Describes the legal values for Listing.who_made.
;;
;;
;; The data-type who-made, when-made are so-called "Marketplace Attributes" that
;; help buyers locate a Listing under the headings Handmade, Vintage and Supplies.
;; When creating new Listings, these parameters are required. As of this
;; writing, not all Listings on Etsy have their Marketplace Attributes set. 
;; These Listings will return null in these fields.
;; (URL `http://www.etsy.com/developers/documentation/reference/listing#section_marketplace_attributes')

(in-package #:cl-etsy)


(def-api-class data-type ()
  ((type
    :level medium ;???
    :type string
    :doc "Base type of data.")
   (values
    :level medium ;???
    :type "array(string)"
    :doc "Allowable values (for an enum).")))
   

;; (defmethod print-object ((x data-type) stream)
;;   (dumb-printing stream x "~A" type))


;;; ==============================
;;; EOF
