;;; :FILE-CREATED <Timestamp: #{2012-07-10T15:45:10-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-class-generic.lisp
;;; ==============================

#|

|#

(in-package #:cl-etsy)

  
;;; ==============================
;;
;; We should run an after method on make-instance of api-type subclasses that
;; adds the api-name/api-symbol to a hash-table(s)
;; subclasses of api-type
;; (defgeneric api-name (object))
;; (defgeneric (setf api-name) (api-name object))

;; We should run an after method on make-instance of api-type subclasses that
;; adds the api-name/api-symbol to a hash-table(s)
;; subclasses of api-type
;; (defgeneric api-symbol (object))
;; (defgeneric (setf api-symbol) (api-symbol object))

;; (defgeneric permission-scope (object))
;; (defgeneric (setf permission-scope) (permission-scope object))

;;; ==============================

;; Following are specific to api-method and may be moved.

;; 1 classes: api-method
(defgeneric uri (object))
(defgeneric (setf uri) (url object))

;; 1 classes: api-method
(defgeneric http-method (object))
(defgeneric (setf http-method) (http-method object))

;; 1 classes: api-method
(defgeneric visibility (object))
(defgeneric (setf visibility) (visibility object))

;; 1 classes: api-method
(defgeneric params (object))
(defgeneric (setf params) (params object))

;; 1 classes: api-method
(defgeneric defaults (object))
(defgeneric (setf defaults) (defaults object))

;;; ==============================

;; Following are slots which are in a transitional state due to deprecation announcements:

;; [DEPRECATED] To be removed as of 2012/08/14
;; 1 classes: shop
(defgeneric alchemy-message (object))
(defgeneric (setf alchemy-message) (alchemy-message object))

;; [DEPRECATED] To be removed as of 2012/08/14
;; 1 classes: shop
(defgeneric is-refusing-alchemy (object))
(defgeneric (setf is-refusing-alchemy) (is-refusing-alchemy object))

;; :NOTE As of 2012/08/14 supersedes/replaces `is-refusing-alchemy' which is to be deprecated/removed 
;; 1 classes: shop
(defgeneric accepts-custom-requests (object))
(defgeneric (setf accepts-custom-requests) (accepts-custom-requests object))


;;; ==============================

;; 1 classes: featured-treasury
(defgeneric active-date (object))
(defgeneric (setf active-date) (active-date object))

;; 1 classes: shop-section
(defgeneric active-listing-count (object))
(defgeneric (setf active-listing-count) (active-listing-count object))

;; 1 classes: payment
(defgeneric adjusted-fees (object))
(defgeneric (setf adjusted-fees) (adjusted-fees object))

;; 1 classes: payment
(defgeneric adjusted-gross (object))
(defgeneric (setf adjusted-gross) (adjusted-gross object))

;; 1 classes: payment
(defgeneric adjusted-net (object))
(defgeneric (setf adjusted-net) (adjusted-net object))

;; 1 classes: payment-adjustment-item
(defgeneric adjustment-type (object))
(defgeneric (setf adjustment-type) (adjustment-type object))

;; 1 classes: payment-template
(defgeneric allow-bt (object))
(defgeneric (setf allow-bt) (allow-bt object))

;; 1 classes: payment-template
(defgeneric allow-cc (object))
(defgeneric (setf allow-cc) (allow-cc object))

;; 1 classes: payment-template
(defgeneric allow-check (object))
(defgeneric (setf allow-check) (allow-check object))

;; 1 classes: payment-template
(defgeneric allow-mo (object))
(defgeneric (setf allow-mo) (allow-mo object))

;; 1 classes: payment-template
(defgeneric allow-other (object))
(defgeneric (setf allow-other) (allow-other object))

;; 1 classes: payment-template
(defgeneric allow-paypal (object))
(defgeneric (setf allow-paypal) (allow-paypal object))

;; 3 classes: bill-charge bill-payment payment-adjustment-item
(defgeneric amount (object))
(defgeneric (setf amount) (amount object))

;; 1 classes: payment
(defgeneric amount-fees (object))
(defgeneric (setf amount-fees) (amount-fees object))

;; 1 classes: payment
(defgeneric amount-gross (object))
(defgeneric (setf amount-gross) (amount-gross object))

;; 1 classes: payment
(defgeneric amount-net (object))
(defgeneric (setf amount-net) (amount-net object))

;; 2 classes: shop shop-translation
(defgeneric announcement (object))
(defgeneric (setf announcement) (announcement object))

;; 2 classes: avatar user-profile
(defgeneric avatar-id (object))
(defgeneric (setf avatar-id) (avatar-id object))

;; 1 classes: billing-overview
(defgeneric balance-due (object))
(defgeneric (setf balance-due) (balance-due object))

;; 1 classes: bill-charge
(defgeneric bill-charge-id (object))
(defgeneric (setf bill-charge-id) (bill-charge-id object))

;; 1 classes: bill-payment
(defgeneric bill-payment-id (object))
(defgeneric (setf bill-payment-id) (bill-payment-id object))

;; 1 classes: payment
(defgeneric billing-address-id (object))
(defgeneric (setf billing-address-id) (billing-address-id object))

;; 1 classes: user-profile
(defgeneric bio (object))
(defgeneric (setf bio) (bio object))

;; 1 classes: user-profile
(defgeneric birth-day (object))
(defgeneric (setf birth-day) (birth-day object))

;; 1 classes: user-profile
(defgeneric birth-month (object))
(defgeneric (setf birth-month) (birth-month object))

;; 1 classes: user-profile
(defgeneric birth-year (object))
(defgeneric (setf birth-year) (birth-year object))

;; 2 classes: avatar listing-image
(defgeneric blue (object))
(defgeneric (setf blue) (blue object))

;; 3 classes: avatar listing listing-image
(defgeneric brightness (object))
(defgeneric (setf brightness) (brightness object))

;; 1 classes: receipt
(defgeneric buyer-email (object))
(defgeneric (setf buyer-email) (buyer-email object))

;; 1 classes: transaction
(defgeneric buyer-feedback-id (object))
(defgeneric (setf buyer-feedback-id) (buyer-feedback-id object))

;; 4 classes: feedback receipt transaction payment
(defgeneric buyer-user-id (object))
(defgeneric (setf buyer-user-id) (buyer-user-id object))

;; 1 classes: cart
(defgeneric cart-id (object))
(defgeneric (setf cart-id) (cart-id object))

;; 2 classes: category listing
(defgeneric category-id (object))
(defgeneric (setf category-id) (category-id object))

;; 1 classes: category
(defgeneric category-name (object))
(defgeneric (setf category-name) (category-name object))

;; 1 classes: listing
(defgeneric category-path (object))
(defgeneric (setf category-path) (category-path object))

;; 5 classes: payment-template receipt shop user-address user-profile
(defgeneric city (object))
(defgeneric (setf city) (city object))

;; 1 classes: treasury-counts
(defgeneric clicks (object))
(defgeneric (setf clicks) (clicks object))

;; 1 classes: treasury
(defgeneric comment-count (object))
(defgeneric (setf comment-count) (comment-count object))

;; We shadow CL:COUNT symbol
;; 1 classes: feedback-info
(defgeneric count (object))
(defgeneric (setf count) (count object))

;; 6 classes: country payment-template receipt shop user-address user-profile
(defgeneric country-id (object))
(defgeneric (setf country-id) (country-id object))

;; 1 classes: user-address
(defgeneric country-name (object))
(defgeneric (setf country-name) (country-name object))

;; 1 classes: treasury
(defgeneric counts (object))
(defgeneric (setf counts) (counts object))

;; 2 classes: cart coupon
(defgeneric coupon-code (object))
(defgeneric (setf coupon-code) (coupon-code object))

;; 1 classes: coupon
(defgeneric coupon-id (object))
(defgeneric (setf coupon-id) (coupon-id object))

;; 8 classes: favorite-listing forum-post ledger ledger-entry payment payment-adjustment payment-adjustment-item team
(defgeneric create-date (object))
(defgeneric (setf create-date) (create-date object))

;; 2 classes: bill-charge bill-payment
(defgeneric creation-month (object))
(defgeneric (setf creation-month) (creation-month object))

;; 15 classes: avatar bill-charge bill-payment favorite-listing favorite-user
;; feedback listing listing-image order receipt shop transaction treasury
;; treasury-listing user
(defgeneric creation-tsz (object))
(defgeneric (setf creation-tsz) (creation-tsz object))

;; 2 classes: bill-charge bill-payment
(defgeneric creation-year (object))
(defgeneric (setf creation-year) (creation-year object))

;; 1 classes: feedback
(defgeneric creator-user-id (object))
(defgeneric (setf creator-user-id) (creator-user-id object))

;; 1 classes: ledger-entry
(defgeneric credit-amount (object))
(defgeneric (setf credit-amount) (credit-amount object))

;; 2 classes: ledger payment
(defgeneric currency (object))
(defgeneric (setf currency) (currency object))

;; 10 classes: bill-charge bill-payment billing-overview cart listing receipt
;; shipping-info shipping-template-entry shop transaction
(defgeneric currency-code (object))
(defgeneric (setf currency-code) (currency-code object))

;; 1 classes: treasury-listing
(defgeneric data (object))
(defgeneric (setf data) (data object))

;; 1 classes: data-type
(defgeneric data-type-values (object))
(defgeneric (setf data-type-values) (data-type-values object))

;; 1 classes: billing-overview
(defgeneric date-due (object))
(defgeneric (setf date-due) (date-due object))

;; 1 classes: billing-overview
(defgeneric date-overdue (object))
(defgeneric (setf date-overdue) (date-overdue object))

;; 1 classes: ledger-entry
(defgeneric debit-amount (object))
(defgeneric (setf debit-amount) (debit-amount object))

;; 4 classes: listing listing-translation transaction treasury
(defgeneric description (object))
(defgeneric (setf description) (description object))

;; 3 classes: cart shipping-info shipping-template-entry
(defgeneric destination-country-id (object))
(defgeneric (setf destination-country-id) (destination-country-id object))

;; 1 classes: shipping-info
(defgeneric destination-country-name (object))
(defgeneric (setf destination-country-name) (destination-country-name object))

;; 1 classes: shipping-template-entry
(defgeneric destination-region-id (object))
(defgeneric (setf destination-region-id) (destination-region-id object))

;; 1 classes: cart
(defgeneric discount-amount (object))
(defgeneric (setf discount-amount) (discount-amount object))

;; 1 classes: receipt
(defgeneric discount-amt (object))
(defgeneric (setf discount-amt) (discount-amt object))

;; 1 classes: coupon
(defgeneric domestic-only (object))
(defgeneric (setf domestic-only) (domestic-only object))

;; 1 classes: listing
(defgeneric ending-tsz (object))
(defgeneric (setf ending-tsz) (ending-tsz object))

;; 1 classes: ledger-entry
(defgeneric entry-type (object))
(defgeneric (setf entry-type) (entry-type object))

;; 1 classes: favorite-listing
(defgeneric favorite-listing-id (object))
(defgeneric (setf favorite-listing-id) (favorite-listing-id object))

;; 1 classes: favorite-user
(defgeneric favorite-user-id (object))
(defgeneric (setf favorite-user-id) (favorite-user-id object))

;; 1 classes: listing
(defgeneric featured-rank (object))
(defgeneric (setf featured-rank) (featured-rank object))

;; 1 classes: feedback
(defgeneric feedback-id (object))
(defgeneric (setf feedback-id) (feedback-id object))

;; 1 classes: user
(defgeneric feedback-info (object))
(defgeneric (setf feedback-info) (feedback-info object))

;; 4 classes: payment-template receipt shop user-address
(defgeneric first-line (object))
(defgeneric (setf first-line) (first-line object))

;; 1 classes: user-profile
(defgeneric first-name (object))
(defgeneric (setf first-name) (first-name object))

;; 1 classes: coupon
(defgeneric free-shipping (object))
(defgeneric (setf free-shipping) (free-shipping object))

;; 1 classes: listing-image
(defgeneric full-height (object))
(defgeneric (setf full-height) (full-height object))

;; 1 classes: listing-image
(defgeneric full-width (object))
(defgeneric (setf full-width) (full-width object))

;; 1 classes: shop
(defgeneric ga-code (object))
(defgeneric (setf ga-code) (ga-code object))

;; 1 classes: user-profile
(defgeneric gender (object))
(defgeneric (setf gender) (gender object))

;; 1 classes: receipt
(defgeneric grandtotal (object))
(defgeneric (setf grandtotal) (grandtotal object))

;; 2 classes: avatar listing-image
(defgeneric green (object))
(defgeneric (setf green) (green object))

;; 1 classes: team
(defgeneric group-id (object))
(defgeneric (setf group-id) (group-id object))

;; 2 classes: avatar listing-image
(defgeneric hex-code (object))
(defgeneric (setf hex-code) (hex-code object))

;; 1 classes: treasury
(defgeneric homepage (object))
(defgeneric (setf homepage) (homepage object))

;; 1 classes: treasury
(defgeneric hotness (object))
(defgeneric (setf hotness) (hotness object))

;; 1 classes: treasury
(defgeneric hotness-color (object))
(defgeneric (setf hotness-color) (hotness-color object))

;; 3 classes: avatar listing listing-image
(defgeneric hue (object))
(defgeneric (setf hue) (hue object))

;; 1 classes: treasury
(defgeneric id (object))
(defgeneric (setf id) (id object))

;; 1 classes: feedback
(defgeneric image-feedback-id (object))
(defgeneric (setf image-feedback-id) (image-feedback-id object))

;; 1 classes: treasury-listing-data
(defgeneric image-id (object))
(defgeneric (setf image-id) (image-id object))

;; 1 classes: transaction
(defgeneric image-listing-id (object))
(defgeneric (setf image-listing-id) (image-listing-id object))

;; 1 classes: feedback
(defgeneric image-url-155x125 (object))
(defgeneric (setf image-url-155x125) (image-url-155x125 object))

;; 1 classes: feedback
(defgeneric image-url-25x25 (object))
(defgeneric (setf image-url-25x25) (image-url-25x25 object))

;; 1 classes: user-profile
(defgeneric image-url-75x75 (object))
(defgeneric (setf image-url-75x75) (image-url-75x75 object))

;; 1 classes: shop
(defgeneric image-url-760x100 (object))
(defgeneric (setf image-url-760x100) (image-url-760x100 object))

;; 1 classes: feedback
(defgeneric image-url-fullxfull (object))
(defgeneric (setf image-url-fullxfull) (image-url-fullxfull object))

;; 3 classes: avatar listing listing-image
(defgeneric is-black-and-white (object))
(defgeneric (setf is-black-and-white) (is-black-and-white object))

;; 1 classes: billing-overview
(defgeneric is-overdue (object))
(defgeneric (setf is-overdue) (is-overdue object))

;; 1 classes: user-profile
(defgeneric is-seller (object))
(defgeneric (setf is-seller) (is-seller object))

;; 1 classes: listing
(defgeneric is-supply (object))
(defgeneric (setf is-supply) (is-supply object))

;; 1 classes: shop
(defgeneric is-vacation (object))
(defgeneric (setf is-vacation) (is-vacation object))

;; 1 classes: country
(defgeneric iso-country-code (object))
(defgeneric (setf iso-country-code) (iso-country-code object))

;; 1 classes: user-profile
(defgeneric join-tsz (object))
(defgeneric (setf join-tsz) (join-tsz object))

;; 3 classes: listing-translation shop-section-translation shop-translation
(defgeneric language (object))
(defgeneric (setf language) (language object))

;; 1 classes: shop
(defgeneric languages (object))
(defgeneric (setf languages) (languages object))

;; 1 classes: forum-post
(defgeneric last-edit-time (object))
(defgeneric (setf last-edit-time) (last-edit-time object))

;; 3 classes: bill-charge listing receipt
(defgeneric last-modified-tsz (object))
(defgeneric (setf last-modified-tsz) (last-modified-tsz object))

;; 1 classes: user-profile
(defgeneric last-name (object))
(defgeneric (setf last-name) (last-name object))

;; 1 classes: shop
(defgeneric last-updated-tsz (object))
(defgeneric (setf last-updated-tsz) (last-updated-tsz object))

;; 3 classes: country shop user-profile
(defgeneric lat (object))
(defgeneric (setf lat) (lat object))

;; 1 classes: ledger-entry
(defgeneric ledger-entry-id (object))
(defgeneric (setf ledger-entry-id) (ledger-entry-id object))

;; 2 classes: ledger ledger-entry
(defgeneric ledger-id (object))
(defgeneric (setf ledger-id) (ledger-id object))

;; 1 classes: shop
(defgeneric listing-active-count (object))
(defgeneric (setf listing-active-count) (listing-active-count object))

;; 8 classes: cart-listing favorite-listing listing listing-image
;; listing-translation shipping-info transaction treasury-listing-data
(defgeneric listing-id (object))
(defgeneric (setf listing-id) (listing-id object))

;; 1 classes: listing-image
(defgeneric listing-image-id (object))
(defgeneric (setf listing-image-id) (listing-image-id object))

;; 1 classes: payment-template
(defgeneric listing-payment-id (object))
(defgeneric (setf listing-payment-id) (listing-payment-id object))

;; 1 classes: favorite-listing
(defgeneric listing-state (object))
(defgeneric (setf listing-state) (listing-state object))

;; 2 classes: cart treasury
(defgeneric listings (object))
(defgeneric (setf listings) (listings object))

;; 1 classes: treasury
(defgeneric locale (object))
(defgeneric (setf locale) (locale object))

;; 1 classes: user-profile
(defgeneric location (object))
(defgeneric (setf location) (location object))

;; 3 classes: shop user user-profile
(defgeneric login-name (object))
(defgeneric (setf login-name) (login-name object))

;; 3 classes: country shop user-profile
(defgeneric lon (object))
(defgeneric (setf lon) (lon object))

;; 1 classes: category
(defgeneric long-name (object))
(defgeneric (setf long-name) (long-name object))

;; 3 classes: listing transaction user-profile
(defgeneric materials (object))
(defgeneric (setf materials) (materials object))

;; 1 classes: treasury
(defgeneric mature (object))
(defgeneric (setf mature) (mature object))

;; 1 classes: feedback
(defgeneric message (object))
(defgeneric (setf message) (message object))

;; 1 classes: receipt
(defgeneric message-from-buyer (object))
(defgeneric (setf message-from-buyer) (message-from-buyer object))

;; 1 classes: receipt
(defgeneric message-from-payment (object))
(defgeneric (setf message-from-payment) (message-from-payment object))

;; 1 classes: receipt
(defgeneric message-from-seller (object))
(defgeneric (setf message-from-seller) (message-from-seller object))

;; 1 classes: cart
(defgeneric message-to-seller (object))
(defgeneric (setf message-to-seller) (message-to-seller object))

;; 1 classes: category
(defgeneric meta-description (object))
(defgeneric (setf meta-description) (meta-description object))

;; 1 classes: category
(defgeneric meta-keywords (object))
(defgeneric (setf meta-keywords) (meta-keywords object))

;; 1 classes: category
(defgeneric meta-title (object))
(defgeneric (setf meta-title) (meta-title object))

;; 9 classes: api-method category country 
;; payment-template receipt shop tag team user-address
(defgeneric name (object))
(defgeneric (setf name) (name object))

;; 1 classes: category
(defgeneric num-children (object))
(defgeneric (setf num-children) (num-children object))

;; 2 classes: listing shop
(defgeneric num-favorers (object))
(defgeneric (setf num-favorers) (num-favorers object))

;; 1 classes: tag
(defgeneric num-listings (object))
(defgeneric (setf num-listings) (num-listings object))

;; 1 classes: listing
(defgeneric occasion (object))
(defgeneric (setf occasion) (occasion object))

;; 2 classes: order receipt
(defgeneric order-id (object))
(defgeneric (setf order-id) (order-id object))

;; 2 classes: shipping-info shipping-template-entry
(defgeneric origin-country-id (object))
(defgeneric (setf origin-country-id) (origin-country-id object))

;; 1 classes: shipping-info
(defgeneric origin-country-name (object))
(defgeneric (setf origin-country-name) (origin-country-name object))

;; 1 classes: listing
(defgeneric original-creation-tsz (object))
(defgeneric (setf original-creation-tsz) (original-creation-tsz object))

;; 1 classes: billing-overview
(defgeneric overdue-balance (object))
(defgeneric (setf overdue-balance) (overdue-balance object))

;; 1 classes: category
(defgeneric page-description (object))
(defgeneric (setf page-description) (page-description object))

;; 1 classes: category
(defgeneric page-title (object))
(defgeneric (setf page-title) (page-title object))

;; 1 classes: transaction
(defgeneric paid-tsz (object))
(defgeneric (setf paid-tsz) (paid-tsz object))

;; 1 classes: param-list
(defgeneric param-name (object))
(defgeneric (setf param-name) (param-name object))

;; 2 classes: payment-adjustment payment-adjustment-item
(defgeneric payment-adjustment-id (object))
(defgeneric (setf payment-adjustment-id) (payment-adjustment-id object))

;; 1 classes: payment-adjustment-item
(defgeneric payment-adjustment-item-id (object))
(defgeneric (setf payment-adjustment-item-id) (payment-adjustment-item-id object))

;; 1 classes: receipt
(defgeneric payment-email (object))
(defgeneric (setf payment-email) (payment-email object))

;; 2 classes: payment payment-adjustment
(defgeneric payment-id (object))
(defgeneric (setf payment-id) (payment-id object))

;; 1 classes: receipt
(defgeneric payment-method (object))
(defgeneric (setf payment-method) (payment-method object))

;; 1 classes: payment-template
(defgeneric payment-template-id (object))
(defgeneric (setf payment-template-id) (payment-template-id object))

;; 1 classes: payment-template
(defgeneric paypal-email (object))
(defgeneric (setf paypal-email) (paypal-email object))

;; 1 classes: coupon
(defgeneric pct-discount (object))
(defgeneric (setf pct-discount) (pct-discount object))

;; 2 classes: shop shop-translation
(defgeneric policy-additional (object))
(defgeneric (setf policy-additional) (policy-additional object))

;; 2 classes: shop shop-translation
(defgeneric policy-payment (object))
(defgeneric (setf policy-payment) (policy-payment object))

;; 2 classes: shop shop-translation
(defgeneric policy-refunds (object))
(defgeneric (setf policy-refunds) (policy-refunds object))

;; 2 classes: shop shop-translation
(defgeneric policy-seller-info (object))
(defgeneric (setf policy-seller-info) (policy-seller-info object))

;; 2 classes: shop shop-translation
(defgeneric policy-shipping (object))
(defgeneric (setf policy-shipping) (policy-shipping object))

;; 1 classes: shop
(defgeneric policy-updated-tsz (object))
(defgeneric (setf policy-updated-tsz) (policy-updated-tsz object))

;; 2 classes: shop shop-translation
(defgeneric policy-welcome (object))
(defgeneric (setf policy-welcome) (policy-welcome object))

;; 1 classes: forum-post
(defgeneric post (object))
(defgeneric (setf post) (post object))

;; 1 classes: forum-post
(defgeneric post-id (object))
(defgeneric (setf post-id) (post-id object))

;; 1 classes: payment
(defgeneric posted-fees (object))
(defgeneric (setf posted-fees) (posted-fees object))

;; 1 classes: payment
(defgeneric posted-gross (object))
(defgeneric (setf posted-gross) (posted-gross object))

;; 1 classes: payment
(defgeneric posted-net (object))
(defgeneric (setf posted-net) (posted-net object))

;; 3 classes: listing transaction treasury-listing-data
(defgeneric price (object))
(defgeneric (setf price) (price object))

;; 2 classes: shipping-info shipping-template-entry
(defgeneric primary-cost (object))
(defgeneric (setf primary-cost) (primary-cost object))

;; 1 classes: user
(defgeneric primary-email (object))
(defgeneric (setf primary-email) (primary-email object))

;; 1 classes: cart-listing
(defgeneric purchase-quantity (object))
(defgeneric (setf purchase-quantity) (purchase-quantity object))

;; 1 classes: cart-listing
(defgeneric purchase-state (object))
(defgeneric (setf purchase-state) (purchase-state object))

;; 2 classes: listing transaction
(defgeneric quantity (object))
(defgeneric (setf quantity) (quantity object))

;; 2 classes: listing-image shop-section
(defgeneric rank (object))
(defgeneric (setf rank) (rank object))

;; 1 classes: payment-adjustment
(defgeneric reason-code (object))
(defgeneric (setf reason-code) (reason-code object))

;; 3 classes: receipt payment transaction
(defgeneric receipt-id (object))
(defgeneric (setf receipt-id) (receipt-id object))

;; 1 classes: listing
(defgeneric recipient (object))
(defgeneric (setf recipient) (recipient object))

;; 2 classes: avatar listing-image
(defgeneric red (object))
(defgeneric (setf red) (red object))

;; 1 classes: ledger-entry
(defgeneric reference-id (object))
(defgeneric (setf reference-id) (reference-id object))

;; 1 classes: user
(defgeneric referred-by-user-id (object))
(defgeneric (setf referred-by-user-id) (referred-by-user-id object))

;; 2 classes: featured-treasury user-profile
(defgeneric region (object))
(defgeneric (setf region) (region object))

;; 2 classes: region shipping-info
(defgeneric region-id (object))
(defgeneric (setf region-id) (region-id object))

;; 1 classes: region
(defgeneric region-name (object))
(defgeneric (setf region-name) (region-name object))

;; 1 classes: treasury-counts
(defgeneric reports (object))
(defgeneric (setf reports) (reports object))

;; 1 classes: ledger-entry
(defgeneric running-balance (object))
(defgeneric (setf running-balance) (running-balance object))

;; 2 classes: shop shop-translation
(defgeneric sale-message (object))
(defgeneric (setf sale-message) (sale-message object))

;; 3 classes: avatar listing listing-image
(defgeneric saturation (object))
(defgeneric (setf saturation) (saturation object))

;; 1 classes: feedback-info
(defgeneric score (object))
(defgeneric (setf score) (score object))

;; 4 classes: payment-template receipt shop user-address
(defgeneric second-line (object))
(defgeneric (setf second-line) (second-line object))

;; 2 classes: shipping-info shipping-template-entry
(defgeneric secondary-cost (object))
(defgeneric (setf secondary-cost) (secondary-cost object))

;; 1 classes: coupon
(defgeneric seller-active (object))
(defgeneric (setf seller-active) (seller-active object))

;; 1 classes: receipt
(defgeneric seller-email (object))
(defgeneric (setf seller-email) (seller-email object))

;; 1 classes: transaction
(defgeneric seller-feedback-id (object))
(defgeneric (setf seller-feedback-id) (seller-feedback-id object))

;; 3 classes: feedback receipt transaction
(defgeneric seller-user-id (object))
(defgeneric (setf seller-user-id) (seller-user-id object))

;; :NOTE sequence is a built in CL system class
;; 1 classes: ledger-entry
(defgeneric sequence (object))
(defgeneric (setf sequence) (sequence object))

;; 1 classes: treasury-counts
(defgeneric shares (object))
(defgeneric (setf shares) (shares object))

;; 1 classes: payment
(defgeneric shipped-date (object))
(defgeneric (setf shipped-date) (shipped-date object))

;; 1 classes: transaction
(defgeneric shipped-tsz (object))
(defgeneric (setf shipped-tsz) (shipped-tsz object))

;; 1 classes: payment
(defgeneric shipping-address-id (object))
(defgeneric (setf shipping-address-id) (shipping-address-id object))

;; 1 classes: receipt
(defgeneric shipping-carrier (object))
(defgeneric (setf shipping-carrier) (shipping-carrier object))

;; 2 classes: cart transaction
(defgeneric shipping-cost (object))
(defgeneric (setf shipping-cost) (shipping-cost object))

;; 1 classes: cart
(defgeneric shipping-discount-amount (object))
(defgeneric (setf shipping-discount-amount) (shipping-discount-amount object))

;; 1 classes: shipping-info
(defgeneric shipping-info-id (object))
(defgeneric (setf shipping-info-id) (shipping-info-id object))

;; 1 classes: receipt
(defgeneric shipping-note (object))
(defgeneric (setf shipping-note) (shipping-note object))

;; 1 classes: shipping-template-entry
(defgeneric shipping-template-entry-id (object))
(defgeneric (setf shipping-template-entry-id) (shipping-template-entry-id object))

;; 2 classes: shipping-template shipping-template-entry
(defgeneric shipping-template-id (object))
(defgeneric (setf shipping-template-id) (shipping-template-id object))

;; 1 classes: receipt
(defgeneric shipping-tracking-code (object))
(defgeneric (setf shipping-tracking-code) (shipping-tracking-code object))

;; 1 classes: receipt
(defgeneric shipping-tracking-url (object))
(defgeneric (setf shipping-tracking-url) (shipping-tracking-url object))

;; 1 classes: payment
(defgeneric shipping-user-id (object))
(defgeneric (setf shipping-user-id) (shipping-user-id object))

;; 4 classes: ledger payment shop shop-translation
(defgeneric shop-id (object))
(defgeneric (setf shop-id) (shop-id object))

;; 3 classes: cart shop treasury-listing-data
(defgeneric shop-name (object))
(defgeneric (setf shop-name) (shop-name object))

;; 3 classes: listing shop-section shop-section-translation
(defgeneric shop-section-id (object))
(defgeneric (setf shop-section-id) (shop-section-id object))

;; 1 classes: category
(defgeneric short-name (object))
(defgeneric (setf short-name) (short-name object))

;; 1 classes: country
(defgeneric slug (object))
(defgeneric (setf slug) (slug object))

;; 7 classes: favorite-listing listing payment-template receipt shop
;; treasury-listing-data user-address
(defgeneric state (object))
(defgeneric (setf state) (state object))

;; 1 classes: listing
(defgeneric state-tsz (object))
(defgeneric (setf state-tsz) (state-tsz object))

;; 2 classes: payment payment-adjustment
(defgeneric status (object))
(defgeneric (setf status) (status object))

;; 2 classes: listing style
(defgeneric style (object))
(defgeneric (setf style) (style object))

;; 1 classes: style
(defgeneric style-id (object))
(defgeneric (setf style-id) (style-id object))

;; 2 classes: cart receipt
(defgeneric subtotal (object))
(defgeneric (setf subtotal) (subtotal object))

;; 1 classes: tag
(defgeneric tag (object))
(defgeneric (setf tag) (tag object))

;; 5 classes: listing listing-translation team transaction treasury
(defgeneric tags (object))
(defgeneric (setf tags) (tags object))

;; 2 classes: favorite-user feedback
(defgeneric target-user-id (object))
(defgeneric (setf target-user-id) (target-user-id object))

;; 1 classes: cart
(defgeneric tax-cost (object))
(defgeneric (setf tax-cost) (tax-cost object))

;; 1 classes: cart
(defgeneric tax-discount-amount (object))
(defgeneric (setf tax-discount-amount) (tax-discount-amount object))

;; 1 classes: forum-post
(defgeneric thread-id (object))
(defgeneric (setf thread-id) (thread-id object))

;; 10 classes: listing listing-translation shipping-template shop shop-section
;; shop-section-translation shop-translation transaction treasury
;; treasury-listing-data
(defgeneric title (object))
(defgeneric (setf title) (title object))

;; 1 classes: cart
(defgeneric total (object))
(defgeneric (setf total) (total object))

;; 1 classes: payment-adjustment
(defgeneric total-adjustment-amount (object))
(defgeneric (setf total-adjustment-amount) (total-adjustment-amount object))

;; 1 classes: billing-overview
(defgeneric total-balance (object))
(defgeneric (setf total-balance) (total-balance object))

;; 1 classes: payment-adjustment
(defgeneric total-fee-adjustment-amount (object))
(defgeneric (setf total-fee-adjustment-amount) (total-fee-adjustment-amount object))

;; 1 classes: receipt
(defgeneric total-price (object))
(defgeneric (setf total-price) (total-price object))

;; 1 classes: receipt
(defgeneric total-shipping-cost (object))
(defgeneric (setf total-shipping-cost) (total-shipping-cost object))

;; 1 classes: receipt
(defgeneric total-tax-cost (object))
(defgeneric (setf total-tax-cost) (total-tax-cost object))

;; 1 classes: user-profile
(defgeneric transaction-buy-count (object))
(defgeneric (setf transaction-buy-count) (transaction-buy-count object))

;; 3 classes: feedback payment-adjustment-item transaction
(defgeneric transaction-id (object))
(defgeneric (setf transaction-id) (transaction-id object))

;; 1 classes: user-profile
(defgeneric transaction-sold-count (object))
(defgeneric (setf transaction-sold-count) (transaction-sold-count object))

;; 1 classes: transaction
(defgeneric transaction-type (object))
(defgeneric (setf transaction-type) (transaction-type object))

;; 1 classes: featured-treasury
(defgeneric treasury-id (object))
(defgeneric (setf treasury-id) (treasury-id object))

;; 1 classes: featured-treasury
(defgeneric treasury-owner-id (object))
(defgeneric (setf treasury-owner-id) (treasury-owner-id object))

;; we shadow CL:TYPE 
;; 4 classes: api-method bill-charge bill-payment data-type
;; Possible variant names:
;; bill-charge  - charge-type bill-charge-type
;; bill-payment - payment-type bill-payment-type
;; data-type    - data-type-type
(defgeneric type (object))
(defgeneric (setf type) (type object))

;; 2 classes: bill-charge bill-payment
(defgeneric type-id (object))
(defgeneric (setf type-id) (type-id object))

;; 4 classes: ledger payment payment-adjustment team
(defgeneric update-date (object))
(defgeneric (setf update-date) (update-date object))

;; 5 classes: cart featured-treasury listing shop transaction
(defgeneric url (object))
(defgeneric (setf url) (url object))

;; 1 classes: listing-image
(defgeneric url-170x135 (object))
(defgeneric (setf url-170x135) (url-170x135 object))

;; 1 classes: listing-image
(defgeneric url-570xn (object))
(defgeneric (setf url-570xn) (url-570xn object))

;; 1 classes: listing-image
(defgeneric url-75x75 (object))
(defgeneric (setf url-75x75) (url-75x75 object))

;; 1 classes: listing-image
(defgeneric url-fullxfull (object))
(defgeneric (setf url-fullxfull) (url-fullxfull object))

;; 1 classes: user-address
(defgeneric user-address-id (object))
(defgeneric (setf user-address-id) (user-address-id object))

;; 1 classes: treasury
(defgeneric user-avatar-id (object))
(defgeneric (setf user-avatar-id) (user-avatar-id object))

;; 18 classes: avatar bill-charge bill-payment
;; favorite-listing favorite-user forum-post
;; listing order payment-adjustment payment-template
;; shipping-template shop shop-section treasury treasury-listing-data
;; user user-address user-profile
(defgeneric user-id (object))
(defgeneric (setf user-id) (user-id object))

;; 1 classes: treasury
(defgeneric user-name (object))
(defgeneric (setf user-name) (user-name object))

;; 1 classes: user-profile
(defgeneric user-profile-id (object))
(defgeneric (setf user-profile-id) (user-profile-id object))

;; 2 classes: shop shop-translation
(defgeneric vacation-autoreply (object))
(defgeneric (setf vacation-autoreply) (vacation-autoreply object))

;; 2 classes: shop shop-translation
(defgeneric vacation-message (object))
(defgeneric (setf vacation-message) (vacation-message object))

;; 1 classes: feedback
(defgeneric value (object))
(defgeneric (setf value) (value object))

;; 2 classes: listing treasury-counts
(defgeneric views (object))
(defgeneric (setf views) (views object))

;; 1 classes: receipt
(defgeneric was-paid (object))
(defgeneric (setf was-paid) (was-paid object))

;; 1 classes: receipt
(defgeneric was-shipped (object))
(defgeneric (setf was-shipped) (was-shipped object))

;; 1 classes: tag
(defgeneric weight (object))
(defgeneric (setf weight) (weight object))

;; 1 classes: listing
(defgeneric when-made (object))
(defgeneric (setf when-made) (when-made object))

;; 1 classes: listing
(defgeneric who-made (object))
(defgeneric (setf who-made) (who-made object))

;; 1 classes: country
(defgeneric world-bank-country-code (object))
(defgeneric (setf world-bank-country-code) (world-bank-country-code object))

;; 4 classes: payment-template receipt shop user-address
(defgeneric zip (object))
(defgeneric (setf zip) (zip object))

#|

 ---
 Output some defgenerics four each of our 42 etsy v2 API classes:
  (api-explicit-class-output-defgeneric-forms :output-stream t)

 ---
 We should have 46 class definitions each corresponding to a 
 api-class/etsy-<FOO>-class.lisp files when we're finished.

 (length (mapcar #'car *api-classes-and-slots*))

 ---
 Some stats re the slot names of all api-classes (last evaluated 2012-07-25):

  (api-class-all-slot-name-stats)

  ((:n-slot-names 1 :occurred-n-times 17 :slot-occurrences (user-id))
  (:n-slot-names 1 :occurred-n-times 15 :slot-occurrences (creation-tsz))
  (:n-slot-names 2 :occurred-n-times 10 :slot-occurrences (currency-code title))
  (:n-slot-names 1 :occurred-n-times 9 :slot-occurrences  (name))
  (:n-slot-names 1 :occurred-n-times 8 :slot-occurrences  (listing-id))
  (:n-slot-names 1 :occurred-n-times 7 :slot-occurrences  (state))
  (:n-slot-names 2 :occurred-n-times 6 :slot-occurrences  (country-id create-date))
  (:n-slot-names 3 :occurred-n-times 5 :slot-occurrences  (city tags url))
  (:n-slot-names 7 :occurred-n-times 4 :slot-occurrences  (buyer-user-id description first-line second-line shop-id type zip))
  (:n-slot-names 17 :occurred-n-times 3 :slot-occurrences
   (brightness destination-country-id hue is-black-and-white language
    last-modified-tsz lat login-name lon materials price receipt-id
    saturation seller-user-id shop-name shop-section-id update-date))
  (:n-slot-names 40 :occurred-n-times 2 :slot-occurrences
   (amount announcement avatar-id blue category-id coupon-code creation-month
    creation-year currency green hex-code ledger-id listings num-favorers
    order-id origin-country-id policy-additional policy-payment
    policy-refunds policy-seller-info policy-shipping policy-welcome
    primary-cost quantity rank red region region-id sale-message
    secondary-cost shipping-cost shipping-template-id style subtotal
    target-user-id transaction-id type-id vacation-autoreply
    vacation-message views))
  (:n-slot-names 188 :occurred-n-times 1 :slot-occurrences
   (active-date active-listing-count adjusted-fees adjusted-gross adjusted-net
    alchemy-message allow-bt allow-cc allow-check allow-mo
    allow-other allow-paypal amount-fees amount-gross amount-net
    balance-due bill-charge-id bill-payment-id billing-address-id
    bio birth-day birth-month birth-year buyer-email
    buyer-feedback-id cart-id category-name category-path clicks
    comment-count count country-name counts coupon-id
    creator-user-id credit-amount data data-type-values date-due
    date-overdue debit-amount defaults destination-country-name
    destination-region-id discount-amount discount-amt domestic-only
    ending-tsz entry-type favorite-listing-id favorite-user-id
    featured-rank feedback-id feedback-info first-name free-shipping
    full-height full-width ga-code gender grandtotal group-id
    homepage hotness hotness-color http-method id image-feedback-id
    image-id image-listing-id image-url-155x125 image-url-25x25
    image-url-75x75 image-url-760x100 image-url-fullxfull is-overdue
    is-refusing-alchemy is-seller is-supply is-vacation
    iso-country-code join-tsz languages last-edit-time last-name
    last-updated-tsz ledger-entry-id listing-active-count
    listing-image-id listing-payment-id listing-state locale
    location long-name mature message message-from-buyer
    message-from-payment message-from-seller message-to-seller
    meta-description meta-keywords meta-title num-children
    num-listings occasion origin-country-name original-creation-tsz
    overdue-balance page-description page-title paid-tsz param-name
    params payment-email payment-id payment-method
    payment-template-id paypal-email pct-discount policy-updated-tsz
    post post-id posted-fees posted-gross posted-net primary-email
    purchase-quantity purchase-state recipient reference-id
    referred-by-user-id region-name reports running-balance score
    seller-active seller-email seller-feedback-id
    common-lisp:sequence shares shipped-date shipped-tsz
    shipping-address-id shipping-carrier shipping-discount-amount
    shipping-info-id shipping-note shipping-template-entry-id
    shipping-tracking-code shipping-tracking-url shipping-user-id
    short-name slug state-tsz status style-id tag tax-cost
    tax-discount-amount thread-id total total-balance total-price
    total-shipping-cost total-tax-cost transaction-buy-count
    transaction-sold-count transaction-type treasury-id
    treasury-owner-id uri url-170x135 url-570xn url-75x75
    url-fullxfull user-address-id user-avatar-id user-name
    user-profile-id value visibility was-paid was-shipped weight
    when-made who-made world-bank-country-code)))
  (:unique-slots-count 450
   :total-slots-count 264
   :unique-slots
   (active-date active-listing-count adjusted-fees adjusted-gross adjusted-net
    alchemy-message allow-bt allow-cc allow-check allow-mo
    allow-other allow-paypal amount amount-fees amount-gross
    amount-net announcement avatar-id balance-due bill-charge-id
    bill-payment-id billing-address-id bio birth-day birth-month
    birth-year blue brightness buyer-email buyer-feedback-id
    buyer-user-id cart-id category-id category-name category-path
    city clicks comment-count count country-id country-name counts
    coupon-code coupon-id create-date creation-month creation-tsz
    creation-year creator-user-id credit-amount currency
    currency-code data data-type-values date-due date-overdue
    debit-amount defaults description destination-country-id
    destination-country-name destination-region-id discount-amount
    discount-amt domestic-only ending-tsz entry-type
    favorite-listing-id favorite-user-id featured-rank feedback-id
    feedback-info first-line first-name free-shipping full-height
    full-width ga-code gender grandtotal green group-id hex-code
    homepage hotness hotness-color http-method hue id
    image-feedback-id image-id image-listing-id image-url-155x125
    image-url-25x25 image-url-75x75 image-url-760x100
    image-url-fullxfull is-black-and-white is-overdue
    is-refusing-alchemy is-seller is-supply is-vacation
    iso-country-code join-tsz language languages last-edit-time
    last-modified-tsz last-name last-updated-tsz lat ledger-entry-id
    ledger-id listing-active-count listing-id listing-image-id
    listing-payment-id listing-state listings locale location
    login-name lon long-name materials mature message
    message-from-buyer message-from-payment message-from-seller
    message-to-seller meta-description meta-keywords meta-title name
    num-children num-favorers num-listings occasion order-id
    origin-country-id origin-country-name original-creation-tsz
    overdue-balance page-description page-title paid-tsz param-name
    params payment-email payment-id payment-method
    payment-template-id paypal-email pct-discount policy-additional
    policy-payment policy-refunds policy-seller-info policy-shipping
    policy-updated-tsz policy-welcome post post-id posted-fees
    posted-gross posted-net price primary-cost primary-email
    purchase-quantity purchase-state quantity rank receipt-id
    recipient red reference-id referred-by-user-id region region-id
    region-name reports running-balance sale-message saturation score
    second-line secondary-cost seller-active seller-email
    seller-feedback-id seller-user-id common-lisp:sequence shares
    shipped-date shipped-tsz shipping-address-id shipping-carrier
    shipping-cost shipping-discount-amount shipping-info-id
    shipping-note shipping-template-entry-id shipping-template-id
    shipping-tracking-code shipping-tracking-url shipping-user-id
    shop-id shop-name shop-section-id short-name slug state state-tsz
    status style style-id subtotal tag tags target-user-id tax-cost
    tax-discount-amount thread-id title total total-balance
    total-price total-shipping-cost total-tax-cost
    transaction-buy-count transaction-id transaction-sold-count
    transaction-type treasury-id treasury-owner-id type type-id
    update-date uri url url-170x135 url-570xn url-75x75 url-fullxfull
    user-address-id user-avatar-id user-id user-name user-profile-id
    vacation-autoreply vacation-message value views visibility
    was-paid was-shipped weight when-made who-made
    world-bank-country-code zip))

|#



;;; ==============================
;;; EOF
