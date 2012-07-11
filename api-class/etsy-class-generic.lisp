;;; :FILE-CREATED <Timestamp: #{2012-07-10T15:45:10-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-class-generic.lisp
;;; ==============================

#|

;;; ==============================

;; We should have 42 class definitions corresponding to 42
;; api-class/etsy-<FOO>-class.lisp files when we're finished.

;; avatar
;; (avatar-id hex-code red green blue hue saturation brightness is-black-and-white creation-tsz user-id)

;; bill-charge
;; (bill-charge-id creation-tsz type type-id user-id amount currency-code
;;  creation-year creation-month last-modified-tsz)

;; billing-overview
;; (is-overdue currency-code overdue-balance balance-due total-balance date-due  date-overdue)

;; bill-payment
;; (bill-payment-id creation-tsz type type-id user-id amount currency-code creation-month creation-year)

;; category
;; (category-id name meta-title meta-keywords meta-description page-description
;;  page-title category-name short-name long-name num-children)

;; cart
;; (cart-id shop-name message-to-seller destination-country-id coupon-code
;;  currency-code total subtotal shipping-cost tax-cost discount-amount
;;  shipping-discount-amount tax-discount-amount url listings)

;; cart-listing
;; (listing-id purchase-quantity purchase-state)

;; country
;; (country-id iso-country-code world-bank-country-code name slug lat lon)

;; coupon
;; (coupon-id coupon-code seller-active pct-discount free-shipping domestic-only)

;; data-type
;; (type data-type-values)

;; favorite-listing
;; (listing-id user-id listing-state create-date state creation-tsz favorite-listing-id)

;; favorite-user
;; (user-id favorite-user-id target-user-id creation-tsz)

;; featured-treasury
;; (treasury-id treasury-owner-id url region active-date)

;; feedback
;; (feedback-id transaction-id creator-user-id target-user-id seller-user-id
;;  buyer-user-id creation-tsz message value image-feedback-id image-url-25x25
;;  image-url-155x125 image-url-fullxfull)

;; feedback-info
;; (count score)

;; forum-post
;; (thread-id post-id post user-id last-edit-time create-date)

;; listing
;; (listing-id state user-id category-id title description creation-tsz ending-tsz
;;  original-creation-tsz last-modified-tsz price currency-code quantity tags
;;  category-path materials shop-section-id featured-rank state-tsz hue saturation
;;  brightness is-black-and-white url views num-favorers who-made is-supply
;;  when-made recipient occasion style)

;; listing-image
;; (listing-image-id hex-code red green blue hue saturation brightness
;;  is-black-and-white creation-tsz listing-id rank url-75x75 url-170x135
;;  url-570xn url-fullxfull full-height full-width)

;; listing-translation
;; (listing-id language title description tags)

;; order
;; (order-id user-id creation-tsz)

;; param-list
;; (param-name)

;; payment-template
;; (payment-template-id allow-bt allow-check allow-mo allow-other allow-paypal
;;  allow-cc paypal-email name first-line second-line city state zip country-id
;;  user-id listing-payment-id)

;; receipt
;; (receipt-id order-id seller-user-id buyer-user-id creation-tsz
;;  last-modified-tsz name first-line second-line city state zip country-id
;;  payment-method payment-email message-from-seller message-from-buyer was-paid
;;  total-tax-cost total-price total-shipping-cost currency-code
;;  message-from-payment was-shipped buyer-email seller-email discount-amt
;;  subtotal grandtotal shipping-tracking-code shipping-tracking-url
;;  shipping-carrier shipping-note)

;; region
;; (region-id region-name)

;; shipping-info
;; (shipping-info-id origin-country-id destination-country-id currency-code
;;  primary-cost secondary-cost listing-id region-id origin-country-name
;;  destination-country-name)

;; shipping-template
;; (shipping-template-id title user-id)

;; shipping-template-entry
;; (shipping-template-entry-id shipping-template-id currency-code origin-country-id
;;  destination-country-id destination-region-id primary-cost secondary-cost)

;; shop
;; (shop-id shop-name first-line second-line city state zip country-id user-id
;;  creation-tsz title announcement currency-code is-vacation vacation-message
;;  sale-message last-updated-tsz listing-active-count login-name lat lon
;;  alchemy-message is-refusing-alchemy policy-welcome policy-payment
;;  policy-shipping policy-refunds policy-additional policy-seller-info
;;  policy-updated-tsz vacation-autoreply ga-code name url image-url-760x100
;;  num-favorers languages)

;; shop-section
;; (shop-section-id title rank user-id active-listing-count)

;; shop-section-translation
;; (shop-section-id language title)

;; shop-translation
;; (shop-id language announcement policy-welcome policy-payment policy-shipping
;;  policy-refunds policy-additional policy-seller-info sale-message title
;;  vacation-autoreply vacation-message)

;; style
;; (style-id style)

;; tag
;; (tag name num-listings weight)

;; transaction
;; (transaction-id title description seller-user-id buyer-user-id creation-tsz
;;  paid-tsz shipped-tsz price currency-code quantity tags materials
;;  image-listing-id receipt-id shipping-cost listing-id seller-feedback-id
;;  buyer-feedback-id transaction-type url)

;; treasury
;; (id title description homepage mature locale comment-count tags counts hotness
;;  hotness-color user-id user-name user-avatar-id listings creation-tsz)

;; treasury-counts
;; (clicks views shares reports)

;; treasury-listing 
;; (data creation-tsz)

;; treasury-listing-data
;; (user-id title price listing-id state shop-name image-id)

;; user
;; (user-id login-name primary-email creation-tsz referred-by-user-id  feedback-info) 

;; user-address
;; (user-address-id user-id name first-line second-line city state zip country-id  country-name)

;; user-profile
;; (user-profile-id user-id login-name bio gender birth-month birth-day birth-year
;;  join-tsz materials country-id region city location avatar-id lat lon
;;  transaction-buy-count transaction-sold-count is-seller image-url-75x75
;;  first-name last-name)







|#

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
