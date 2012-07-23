;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:05:35-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-data-type-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/datatype')

----
API-METHODS

 "describeOccasionEnum"
 "describeRecipientEnum"
 "describeWhenMadeEnum
 "describeWhoMadeEnum"

 --- 
 Get mapping for their lispy string equivalent to Etsy enums string values:

 (loop 
   for describe-fun in '(describe-occasion-enum describe-recipient-enum
                         describe-who-made-enum describe-when-made-enum)
   for etsy-name = (cdaadr (assoc "results" (funcall describe-fun) :test #'string=))
   for lisp-name = (map 'list #'symbol-munger:underscores->lisp-name etsy-name)
   collect (list (symbol-name describe-fun) 
                 (sort 
                  (loop
                    for (lisp . etsy) in (pairlis lisp-name etsy-name)
                    collect (if (string=  lisp etsy)
                                (list lisp)
                                (cons lisp etsy )))
                  #'string< :key #'car)))

 ---
 Dump output from above to a csv file

 (with-open-file (elc #P"/<PATH-TO-DUMP/<FILE-NAME>.csv"
                     :if-exists :supersede
                     :if-does-not-exist :create
                     :direction :output) 
  (format elc "~{~A~%~}"
          ;; this version dumps the ugly_underscore_variant of the Etsy values
          ;; (mapcar #'(lambda (x) (if (cdr x) (cdr x) (car x)))
          ;; this version dumps a pretty-lispy-version instead
          (mapcar #'car 
                  '( <KEY-VALUE-CONSES> ))))

----
 (closer-mop:class-finalized-p (find-class 'data-type))
 (api-class-slot-names-as-underscored-strings 'data-type)

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
;;  e.g. (assoc "values" (car (describe-occasion-enum)) :test #'string=)
(defun describe-occasion-enum (&key
                               (object-as :alist))
  "Describes the legal values for use as the occasion slot-value of class `listing'.
Result when non-nil should contain fields which map to the slots of a `data-type' class.
:EXAMPLE
 (describe-occasion-enum)
:API-METHOD \"describeOccasionEnum\""
  (parsed-api-call (concatenate 'string *base-url* "/types/enum/occasion")
                   :object-as object-as))

;; "describeRecipientEnum"
(defun describe-recipient-enum (&key
                                (object-as :alist))
  "Describes the legal values for use as the recipient slot-value of class `listing'.
Result when non-nil should contain fields which map to the slots of a `data-type' class.
:EXAMPLE
 (describe-recipient-enum)
:API-METHOD \"describeRecipientEnum\""
  (parsed-api-call (concatenate 'string *base-url* "/types/enum/recipient")
                   :object-as object-as))

;; "describeWhenMadeEnum" 
(defun describe-when-made-enum (&key
                                (object-as :alist))
  "Describes the legal values for use as the when-made slot-value of class `listing'.
Result when non-nil should contain fields which map to the slots of a `data-type' class.
:EXAMPLE
 (describe-when-made-enum)
:API-METHOD \"describeWhenMadeEnum\""
  (parsed-api-call (concatenate 'string *base-url* "/types/enum/when_made")
                   :object-as object-as))

;; "describeWhoMadeEnum" 
(defun describe-who-made-enum (&key
                                (object-as :alist))
  "Describes the legal values for use as the who-made slot-value of class `listing'.
Result when non-nil should contain fields which map to the slots of a `data-type' class.
:EXAMPLE
 (describe-who-made-enum)
:API-METHOD \"describeWhoMadeEnum\""
  (parsed-api-call (concatenate 'string *base-url* "/types/enum/who_made")
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
