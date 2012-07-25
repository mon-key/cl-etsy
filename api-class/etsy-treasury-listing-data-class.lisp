;;; :FILE-CREATED <Timestamp: #{2012-07-10T16:24:55-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-treasury-listing-data-class.lisp
;;; ==============================


#|

 (URL `http://www.etsy.com/developers/documentation/reference/treasurylistingdata')

----
 (closer-mop:class-finalized-p (find-class 'treasury-listing-data))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'treasury-listing-data)

|#

(in-package #:cl-etsy)


;; TreasuryListingData
(defclass treasury-listing-data (base-etsy)
  (;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the user who posted the item.")
 
   (title
    :initarg :title
    :accessor title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The listing's title.")

   (price
    :initarg :price
    :accessor price
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The item's price (private for sold listings).")

   ;; listing_id
   (listing-id
    :initarg :listing-id
    :accessor listing-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The ID of the listing.")

   (state
    :initarg :state
    :accessor state
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Whether the listing is active or not.")

   ;; shop_name
   (shop-name
    :initarg :shop-name
    :accessor shop-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The shop to which the listing belongs.")

   ;; image_id
   (image-id
    :initarg :image-id
    :accessor image-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The ID of the image of the listing."))

  ;; (:default-initargs :user-id nil :title nil :price nil :listing-id nil :state nil :shop-name nil :image-id nil) 

  (:documentation "The detailed fields of a TreasuryListing.
 (URL `http://www.etsy.com/developers/documentation/reference/treasurylistingdata')"))


;;; ==============================
;;; EOF
