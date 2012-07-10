;;; :FILE-CREATED <Timestamp: #{2012-07-10T15:45:10-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-class-generic.lisp
;;; ==============================


;; tag
;; (tag name num-listings weight)

;; user-profile
;; (user-profile-id user-id login-name bio gender birth-month birth-day birth-year
;;  join-tsz materials country-id region city location avatar-id lat lon
;;  transaction-buy-count transaction-sold-count is-seller image-url-75x75
;;  first-name last-name)

;; user-address
;; (user-address-id user-id name first-line second-line city state zip country-id  country-name)

;; treasury-listing-data
;; (user-id title price listing-id state shop-name image-id)

;; treasury-listing 
;; (data creation-tsz)

;; treasury-counts
;; (clicks views shares reports)

;; treasury
;; (id title description homepage mature locale comment-count tags counts hotness
;;  hotness-color user-id user-name user-avatar-id listings creation-tsz)

;; transaction
;; (transaction-id title description seller-user-id buyer-user-id creation-tsz
;;  paid-tsz shipped-tsz price currency-code quantity tags materials
;;  image-listing-id receipt-id shipping-cost listing-id seller-feedback-id
;;  buyer-feedback-id transaction-type url)

(in-package #:cl-etsy)

;; user user-profile treasury-listing-data
(defgeneric user-id (object))
(defgeneric (setf user-id) (user-id object))

;; user user-profile
(defgeneric login-name (object))
(defgeneric (setf login-name) (login-name object))

;; user-profile
(defgeneric image-url-75x75 (object))
(defgeneric (setf image-url-75x75) (image-url-75x75 object))

;; user-profile
(defgeneric lat (object))
(defgeneric (setf lat) (lat object))

;; user-profile
(defgeneric lon (object))
(defgeneric (setf lon) (lon object))

;; user-profile user-address
(defgeneric country-id (object))
(defgeneric (setf country-id) (country-id object))

;; user-profile user-address
(defgeneric city (object))
(defgeneric (setf city) (city object))

;; user-profile user-address treasury-listing-data
;; :NOTE a geographical entity or an indication of a transient value
(defgeneric state (object))
(defgeneric (setf state) (state object))

;; tag user-address
(defgeneric name (object))
(defgeneric (setf name) (name object))


;;; ==============================
;;; EOF
