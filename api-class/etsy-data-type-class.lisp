;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:05:35-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-data-type-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/datatype')

----
API-METHODS

 "describeOccasionEnum"
 - Describes the legal values for Listing.occasion.

 "describeRecipientEnum"
 - Describes the legal values for Listing.recipient.

 "describeWhenMadeEnum
 - Describes the legal values for Listing.when_made.

 "describeWhoMadeEnum"
 - Describes the legal values for Listing.who_made.


|#

(in-package #:cl-etsy)

;; DataType
(defclass data-type (base-etsy)
  (
   ;; :NOTE This symbol conflicts with CL:TYPE
   ;; Consider using data-type-type instead?
   ;; esp. as none of the api-methods accept a TYPE parameter
   (type
    :initarg :type
    :accessor :type
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Base type of data for the enum.")

   ;; :NOTE this is actually "values" but that symbol is extremely overloaded in CL
   ;; and we're not ready to shadow CL:VALUES just yet.
   (data-type-values
    :initarg :data-type-values
    :accessor data-type-values
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(string)
    :documentation "Allowable values for the enum."))

   ;; (:default-initargs :data-type-values nil :type nil)
   
  (:documentation "Represents the input type and allowable values for an Etsy API enum.
Currently only applicable for the following enums:
 ooccasion recipient when-made who-made
 The data-type who-made, when-made are so-called \"Marketplace Attributes\" that
 help buyers locate a Listing under the headings Handmade, Vintage and Supplies.
 When creating new Listings, these parameters are required. As of this
 writing, not all Listings on Etsy have their Marketplace Attributes set. 
 These Listings will return null in these fields.
 (URL `http://www.etsy.com/developers/documentation/reference/listing#section_marketplace_attributes')
 (URL `http://www.etsy.com/developers/documentation/reference/datatype')"))

;; :NOTE We need to transform the "values" field of returned results to ``data-type-values''
;; (caaadr (assoc "results" (describe-occasion-enum) :test #'string=))
(defun describe-occasion-enum (&key
                               (object-as :alist))
  "Describes the legal values for use as the occasion slot-value of class `listing'.
Result when non-nil should contain fields which map to the slots of a `data-type' class.
:EXAMPLE
 (describe-occasion-enum)
:API-METHOD \"describeOccasionEnum\"
"
  (yason:parse 
   (api-call (concatenate 'string 
                          *base-url*
                          "/types/enum/occasion"))
   :object-as object-as))

;; "describeRecipientEnum"
(defun describe-recipient-enum (&key
                                (object-as :alist))
  "Describes the legal values for use as the recipient slot-value of class `listing'.
Result when non-nil should contain fields which map to the slots of a `data-type' class.
:EXAMPLE
 (describe-recipient-enum)
:API-METHOD \"describeRecipientEnum\""
  (yason:parse 
   (api-call (concatenate 'string 
                          *base-url*
                          "/types/enum/recipient"
                          ))
   :object-as object-as))

;; "describeWhenMadeEnum" 
(defun describe-when-made-enum (&key
                                (object-as :alist))
  "Describes the legal values for use as the when-made slot-value of class `listing'.
Result when non-nil should contain fields which map to the slots of a `data-type' class.
:EXAMPLE
 (describe-when-made-enum)
:API-METHOD \"describeWhenMadeEnum\""
  (yason:parse 
   (api-call (concatenate 'string 
                          *base-url*
                          "/types/enum/when_made"
                          ))
   :object-as object-as))

;; "describeWhoMadeEnum" 
(defund describe-who-made-enum (&key
                                (object-as :alist))
  "Describes the legal values for use as the who-made slot-value of class `listing'.
Result when non-nil should contain fields which map to the slots of a `data-type' class.
:EXAMPLE
 (describe-who-made-enum)
:API-METHOD \"describeWhoMadeEnum\""
  (yason:parse 
   (api-call (concatenate 'string 
                          *base-url*
                          "/types/enum/who_made"
                          ))
   :object-as object-as))


#|

 ((:NAME        . "describeOccasionEnum")
  (:DESCRIPTION . "Describes the legal values for Listing.occasion.")
  (:URI         . "/types/enum/occasion")
  (:PARAMS)
  (:DEFAULTS)
  (:TYPE         . "DataType")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD  . "GET"))


  ((:NAME        . "describeRecipientEnum")
   (:DESCRIPTION . "Describes the legal values for Listing.recipient.")
   (:URI         . "/types/enum/recipient")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "DataType")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD  . "GET"))

  ((:NAME        . "describeWhenMadeEnum")
   (:DESCRIPTION . "Describes the legal values for Listing.when_made.")
   (:URI         . "/types/enum/when_made")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "DataType")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD  . "GET"))

  ((:NAME        . "describeWhoMadeEnum")
   (:DESCRIPTION . "Describes the legal values for Listing.who_made.")
   (:URI         . "/types/enum/who_made")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "DataType")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD  . "GET"))

---
 
|#



;;; ==============================
;;; EOF
