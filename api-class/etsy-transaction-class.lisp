;;; :FILE-CREATED <Timestamp: #{2012-07-10T16:49:09-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-transaction-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/transaction')

----
API-ASSOCIATIONS

:association Buyer
:visibility private
:perm-scope transactions_r
:type User
:documentation "The buyer that is associated with this transaction."

:association MainImage
:visibility public
:perm-scope none
:type ListingImage
:documentation "The primary listing image for this transaction."

:association Listing
:visibility public
:perm-scope none
:type Listing
:documentation "The listing that is associated with this transaction."

:association Seller
:visibility public
:perm-scope none
:type User
:documentation "The seller that is associated with this transaction."

:association Receipt
:visibility private
:perm-scope transactions_r
:type Receipt
:documentation "The receipt that is associated with this transaction. "

----
API-METHODS

"getTransaction"
"findAllReceiptTransactions"
"findAllShopTransactions"
"findAllUserBuyerTransactions"


|#

(in-package #:cl-etsy)

(defclass transaction (base-etsy)
    (
     ;; transaction_id
     (transaction-id
      :initarg :transaction-id
      :accessor transaction-id
      ;; :visibility public
      ;; :perm-scope none
      ;; :type int
      :documentation "The numeric ID for this transaction.")

     (title
      :initarg :title
      :accessor title
      ;; :visibility public
      ;; :perm-scope none
      ;; :type string
      :documentation "The title of the listing for this transaction.")

     (description
      :initarg :description
      :accessor description
      ;; :visibility public
      ;; :perm-scope none
      ;; :type string
      :documentation "The description of the listing for this transaction.")

     ;; seller_user_id
     (seller-user-id
      :initarg :seller-user-id
      :accessor seller-user-id
      ;; :visibility public
      ;; :perm-scope none
      ;; :type int
      :documentation "The numeric ID for the seller of this transaction.")

     ;; buyer_user_id
     (buyer-user-id
      :initarg :buyer-user-id
      :accessor buyer-user-id
      ;; :visibility private
      ;; :perm-scope transactions_r
      ;; :type int
      :documentation "The numeric ID for the buyer of this transaction.")

     ;; creation_tsz
     (creation-tsz
      :initarg :creation-tsz
      :accessor creation-tsz
      ;; :visibility public
      ;; :perm-scope none
      ;; :type float
      :documentation "The date and time the transaction was created, in epoch seconds.")

     ;; paid_tsz
     (paid-tsz
      :initarg :paid-tsz
      :accessor paid-tsz
      ;; :visibility private
      ;; :perm-scope transactions_r
      ;; :type float
      :documentation "The date and time the transaction was paid, in epoch seconds.")

     ;; shipped_tsz
     (shipped-tsz
      :initarg :shipped-tsz
      :accessor shipped-tsz
      ;; :visibility private
      ;; :perm-scope transactions_r
      ;; :type float
      :documentation "The date and time the transaction was shipped, in epoch seconds.")

     (price
      :initarg :price
      :accessor price
      ;; :visibility private
      ;; :perm-scope transactions_r
      ;; :type float
      :documentation "The price of the transaction.")

     ;; currency_code
     (currency-code
      :initarg :currency-code
      :accessor currency-code
      ;; :visibility private
      ;; :perm-scope transactions_r
      ;; :type string
      :documentation "The ISO code (alphabetic) for the seller's native currency.")

     (quantity
      :initarg :quantity
      :accessor quantity
      ;; :visibility private
      ;; :perm-scope transactions_r
      ;; :type int
      :documentation "The quantity of items in this transaction.")

     (tags
      :initarg :tags
      :accessor tags
      ;; :visibility public
      ;; :perm-scope none
      ;; :type array(string)
      :documentation "The tags in the listing for this transaction.")

     (materials
      :initarg :materials
      :accessor materials
      ;; :visibility public
      ;; :perm-scope none
      ;; :type array(string)
      :documentation "The materials in the listing for this transaction.")

     ;; image_listing_id
     (image-listing-id
      :initarg :image-listing-id
      :accessor image-listing-id
      ;; :visibility public
      ;; :perm-scope none
      ;; :type int
      :documentation "The numeric ID of the primary listing image for this transaction.")

     ;; receipt_id
     (receipt-id
      :initarg :receipt-id
      :accessor receipt-id
      ;; :visibility private
      ;; :perm-scope transactions_r
      ;; :type int
      :documentation "The numeric ID for the receipt associated to this transaction.")

     ;; shipping_cost
     (shipping-cost
      :initarg :shipping-cost
      :accessor shipping-cost
      ;; :visibility private
      ;; :perm-scope transactions_r
      ;; :type float
      :documentation "The shipping cost for this transaction.")

     ;; listing_id
     (listing-id
      :initarg :listing-id
      :accessor listing-id
      ;; :visibility public
      ;; :perm-scope none
      ;; :type int
      :documentation "The numeric ID for this listing associated to this transaction.")

     ;; seller_feedback_id
     (seller-feedback-id
      :initarg :seller-feedback-id
      :accessor seller-feedback-id
      ;; :visibility public
      ;; :perm-scope none
      ;; :type int
      :documentation "The numeric ID of seller's feedback.")

     ;; buyer_feedback_id
     (buyer-feedback-id
      :initarg :buyer-feedback-id
      :accessor buyer-feedback-id
      ;; :visibility public
      ;; :perm-scope none
      ;; :type int
      :documentation "The numeric ID for the buyer's feedback.")

     ;; transaction_type
     (transaction-type
      :initarg :transaction-type
      :accessor transaction-type
      ;; :visibility private
      ;; :perm-scope transactions_r
      ;; :type string
      :documentation "The type of transaction, usually \"listing\".")

     (url
      :initarg :url
      :accessor url
      ;; :visibility public
      ;; :perm-scope none
      ;; :type string
      :documentation "URL of this transaction.")
     )

  ;; (:default-initargs
  ;;  :transaction-id nil :title nil :description nil :seller-user-id nil
  ;;  :buyer-user-id nil :creation-tsz nil :paid-tsz nil :shipped-tsz nil
  ;;  :price nil :currency-code nil :quantity nil :tags nil :materials nil
  ;;  :image-listing-id nil :receipt-id nil :shipping-cost nil
  ;;  :listing-id nil :seller-feedback-id nil :buyer-feedback-id nil
  ;;  :transaction-type nil :url nil)
  (:documentation 
   "Represents the sale of a single item.
 (URL `http://www.etsy.com/developers/documentation/reference/transaction')"))




;;; ==============================
;;; EOF
