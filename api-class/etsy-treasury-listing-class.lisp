;;; :FILE-CREATED <Timestamp: #{2012-07-10T16:32:37-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-treasury-listing-class.lisp
;;; ==============================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/treasurylisting')

----
 (closer-mop:class-finalized-p (find-class 'treasury-listing))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'treasury-listing)

|#

(in-package #:cl-etsy)

;; TreasuryListing
(defclass treasury-listing (base-etsy)
  ((data
    :initarg :data
    :accessor data
    ;; :visibility public
    ;; :perm-scope none
    ;; :type treasury-listing-data
    :documentation "The detailed fields of the listing.
The fields of a listing are as per the slots of `treasury-listing-data', these are:
 user-id title price listing-id state shop-name image-id")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int  ;; :NOTE all other classes other than Treasury and TreasuryListing have this as float
    :documentation "Time the listing was added to this Treasury, in epoch seconds."))

  ;; (:default-initargs :data nil :creation-tsz nil)
  
  (:documentation "A subset of the Listing resource stored in a Treasury.
Each listings slot of class treasury contains one or more `treasury-listing's.
 (URL `http://www.etsy.com/developers/documentation/reference/treasurylisting')"))


;;; ==============================
;;; EOF
