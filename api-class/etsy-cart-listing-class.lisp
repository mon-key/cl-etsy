;;; :FILE-CREATED <Timestamp: #{2012-07-10T22:58:27-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-cart-listing-class.lisp
;;; ==============================

#|
 (URL `http://www.etsy.com/developers/documentation/reference/cartlisting')

----
 (closer-mop:class-finalized-p (find-class 'cart-listing))
 (api-class-slot-names-as-underscored-strings  'cart-listing)

|#

(in-package #:cl-etsy)

;; CartListing
(defclass cart-listing (base-etsy)
  (;; listing_id 
   (listing-id 
    :initarg :listing-id 
    :accessor listing-id 
    ;; :visibility private 
    ;; :perm-scope cart_rw 
    ;; :type int 
    :documentation "The numeric ID of the listing.")

   ;; purchase_quantity
   (purchase-quantity
    :initarg :purchase-quantity
    :accessor purchase-quantity
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type int
    :documentation "The quantity of the listing being purchased.")

   ;; :NOTE Shouldn't this be an enum, e.g.:
   ;;  enum(valid, invalid_quantity, invalid_shipping, not_active, edited, invalid_currency, invalid_shipping_currency)
   ;;
   ;; purchase_state
   (purchase-state
    :initarg :purchase-state
    :accessor purchase-state
    ;; :visibility private
    ;; :perm-scope cart_rw
    ;; :type string
    :documentation "The purchase state of the listing, possible values:
 valid not_active edited 
 invalid_quantity invalid_shipping 
 invalid_currency invalid_shipping_currency"))
  ;; (:default-initargs :listing-id nil :purchase-quantity nil :purchase-state nil)
  (:documentation "Represents the purchase quantity and state for a cart listing.
 (URL `http://www.etsy.com/developers/documentation/reference/cartlisting')"))

;;; ==============================
;;; EOF
