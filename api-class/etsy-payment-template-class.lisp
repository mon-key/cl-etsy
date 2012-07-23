;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-payment-template-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/paymenttemplate')

----
API-ASSOCIATIONS

:association Country
:visibility  private
:perm-scope  listings_r
:type        Country
:description "The full Country record of the shop's country."

:association User
:visibility  private
:perm-scope  listings_r
:type        User
:description "The User that owns this payment template."


----
API-METHODS

"createPaymentTemplate"
"getPaymentTemplate"
"updatePaymentTemplate"
"findAllUserPaymentTemplates"

----
 (closer-mop:class-finalized-p (find-class 'payment-template))
 (api-class-slot-names-as-underscored-strings 'payment-template)

|#

(in-package #:cl-etsy)

;; PaymentTemplate
(defclass payment-template (base-etsy)
  (;; payment_template_id
   (payment-template-id
    :initarg :payment-template-id
    :accessor payment-template-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID for this payment template.")

   ;; allow_bt
   (allow-bt
    :initarg :allow-bt
    :accessor allow-bt
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the seller accepts bank transfers for payment.")

   ;; allow_check
   (allow-check
    :initarg :allow-check
    :accessor allow-check
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the seller accepts checks for payment.")

   ;; allow_mo
   (allow-mo
    :initarg :allow-mo
    :accessor allow-mo
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the seller accepts money order payments.")

   ;; allow_other
   (allow-other
    :initarg :allow-other
    :accessor allow-other
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the seller accepts other payments.")

   ;; allow_paypal
   (allow-paypal
    :initarg :allow-paypal
    :accessor allow-paypal
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the seller accepts paypal payments.")

   ;; allow_cc
   (allow-cc
    :initarg :allow-cc
    :accessor allow-cc
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the seller accepts credit card payments.")

   ;; paypal_email
   (paypal-email
    :initarg :paypal-email
    :accessor paypal-email
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The users paypal email address.")

   (name
    :initarg :name
    :accessor name
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The name of the seller.")

   ;; first_line
   (first-line
    :initarg :first-line
    :accessor first-line
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The first line of the seller's address.")

   ;; second_line
   (second-line
    :initarg :second-line
    :accessor second-line
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The second line of the seller's address.")

   (city
    :initarg :city
    :accessor city
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The seller's city.")

   (state
    :initarg :state
    :accessor state
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The seller's state.")

   (zip
    :initarg :zip
    :accessor zip
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The seller's zip code.")

   ;; country_id
   (country-id
    :initarg :country-id
    :accessor country-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The seller's country.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The user's numeric ID.")

   ;; listing_payment_id
   (listing-payment-id
    :initarg :listing-payment-id
    :accessor listing-payment-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Provided for backward compatibility with listingPayment.
This will return the same value as payment-template-id."))
   
  ;; (:default-initargs 
  ;;  :payment-template-id nil :allow-bt nil :allow-check nil :allow-mo nil
  ;;  :allow-other nil :allow-paypal nil :allow-cc nil :paypal-email nil :name nil
  ;;  :first-line nil :second-line nil :city nil :state nil :zip nil :country-id nil
  ;;  :user-id nil :listing-payment-id nil)

  (:documentation "A payment template for a user.
 (URL `http://www.etsy.com/developers/documentation/reference/paymenttemplate')"))

#|

 ((:NAME        . "createPaymentTemplate")
  (:DESCRIPTION . "Creates a new PaymentTemplate")
  (:URI         . "/payments/templates")
  (:PARAMS
   (:ALLOW-CHECK  . "boolean")
   (:ALLOW-MO     . "boolean")
   (:ALLOW-OTHER  . "boolean")
   (:ALLOW-PAYPAL . "boolean")
   (:ALLOW-CC     . "boolean")
   (:PAYPAL-EMAIL . "string")
   (:NAME          . "string")
   (:FIRST-LINE   . "string")
   (:SECOND-LINE  . "string")
   (:CITY          . "string")
   (:STATE         . "string")
   (:ZIP           . "string")
   (:COUNTRY-ID   . "int"))
  (:DEFAULTS
   (:ALLOW-CHECK)
   (:ALLOW-MO)
   (:ALLOW-OTHER)
   (:ALLOW-PAYPAL)
   (:ALLOW-CC)
   (:PAYPAL-EMAIL)
   (:NAME)
   (:FIRST-LINE)
   (:SECOND-LINE)
   (:CITY)
   (:STATE)
   (:ZIP)
   (:COUNTRY-ID))
  (:TYPE         . "PaymentTemplate")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "POST"))
     
  ((:NAME        . "getPaymentTemplate")
   (:DESCRIPTION . "Retrieves a PaymentTemplate by id.")
   (:URI         . "/payments/templates/:payment_template_id")
   (:PARAMS
    (:PAYMENT-TEMPLATE-ID . "array(int)"))
   (:DEFAULTS)
   (:TYPE         . "PaymentTemplate")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "GET"))
     
  ((:NAME        . "updatePaymentTemplate")
   (:DESCRIPTION . "Updates a PaymentTemplate")
   (:URI         . "/payments/templates/:payment_template_id")
   (:PARAMS
    (:ALLOW-CHECK          . "boolean")
    (:ALLOW-MO             . "boolean")
    (:ALLOW-OTHER          . "boolean")
    (:ALLOW-PAYPAL         . "boolean")
    (:ALLOW-CC             . "boolean")
    (:PAYPAL-EMAIL         . "string")
    (:NAME                  . "string")
    (:FIRST-LINE           . "string")
    (:SECOND-LINE          . "string")
    (:CITY                  . "string")
    (:STATE                 . "string")
    (:ZIP                   . "string")
    (:COUNTRY-ID           . "int")
    (:PAYMENT-TEMPLATE-ID . "int"))
   (:DEFAULTS
    (:ALLOW-CHECK)
    (:ALLOW-MO)
    (:ALLOW-OTHER)
    (:ALLOW-PAYPAL)
    (:ALLOW-CC)
    (:PAYPAL-EMAIL)
    (:NAME)
    (:FIRST-LINE)
    (:SECOND-LINE)
    (:CITY)
    (:STATE)
    (:ZIP)
    (:COUNTRY-ID))
   (:TYPE         . "PaymentTemplate")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "PUT"))

 ((:NAME        . "findAllUserPaymentTemplates")
  (:DESCRIPTION . "Retrieves a set of PaymentTemplate objects associated to a User.")
  (:URI         . "/users/:user_id/payments/templates")
  (:PARAMS
   (:USER-ID . "user_id_or_name"))
  (:DEFAULTS)
  (:TYPE         . "PaymentTemplate")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

|#

;;; ==============================
;;; EOF
