;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-shipping-template-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/shippingtemplate')

----
API-ASSOCIATIONS

:association Entries
:visibility  private
:perm-scope  listings_r
:type        array(ShippingTemplateEntry)
:description "An array of shipping info entries that belong to this template."

----
API-METHODS

"createShippingTemplate"
"getShippingTemplate"
"updateShippingTemplate"
"deleteShippingTemplate"
"findAllUserShippingTemplates"

|#

(in-package #:cl-etsy)

;; ShippingTemplate
(defclass shipping-template (base-etsy)
  (;; shipping_template_id
   (shipping-template-id
    :initarg :shipping-template-id
    :accessor shipping-template-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The numeric ID of this shipping template.")

   (title
    :initarg :title
    :accessor title
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type string
    :documentation "The name of this shipping template.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility private
    ;; :perm-scope listings_r
    ;; :type int
    :documentation "The numeric ID of the user who owns this shipping template."))
 
  ;; (:default-initargs 
  ;;  :shipping-template-id nil :title nil :user-id nil)

  (:documentation "Represents a template used to set a listing's shipping information.
See documentation of shipping-info for discussion w/r/t the interaction of
shipping-info shipping-template and shipping-template-entry.

 (URL `http://www.etsy.com/developers/documentation/reference/shippingtemplate')"))


;;; ==============================
;;; EOF
