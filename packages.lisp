;; -*- mode: lisp; syntax: common-lisp; -*-

(cl:in-package #:common-lisp-user)

(cl:defpackage #:cl-etsy
  (:nicknames "ETSY" "etsy" "CL-ESTY")
  (:documentation "A bridge from common lisp to API of etsy.com.")
  (:use "COMMON-LISP" #+5am "FIVEAM")
  (:export 
   ;; Globals
   #:*API-KEY*
   ;; Api Methods
   #:GET-USER-DETAILS
   #:GET-FAVORERS-OF-SHOP
   #:GET-FAVORERS-OF-LISTING
   #:GET-USERS-BY-NAME
   #:GET-SHOP-DETAILS
   #:GET-FEATURED-SELLERS
   #:GET-SHOPS-BY-NAME
   #:GET-FAVORITE-SHOPS-OF-USER
   #:GET-LISTING-DETAILS
   #:GET-ALL-LISTINGS
   #:GET-SHOP-LISTINGS
   #:GET-FEATURED-DETAILS
   #:GET-FRONT-FEATURED-LISTINGS
   #:GET-FAVORITE-LISTINGS-OF-USER
   #:GET-GIFT-GUIDE-LISTINGS
   #:GET-LISTINGS-BY-KEYWORD
   #:GET-LISTINGS-BY-TAGS
   #:GET-LISTINGS-BY-MATERIALS
   #:GET-LISTINGS-BY-CATEGORY
   #:GET-LISTINGS-BY-COLOR
   #:GET-LISTINGS-BY-COLOR-AND-KEYWORDS
   #:GET-TOP-TAGS
   #:GET-CHILD-TAGS
   #:GET-TOP-CATEGORIES
   #:GET-CHILD-CATEGORIES
   #:GET-GIFT-GUIDES
   #:GET-FEEDBACK
   #:GET-FEEDBACK-FOR-USER
   #:GET-FEEDBACK-AS-BUYER
   #:GET-FEEDBACK-AS-SELLER
   #:GET-FEEDBACK-FOR-OTHERS
   #:GET-METHOD-TABLE
   #:GET-SERVER-EPOCH
   #:PING
   ;; Api Data Structures
   #:USER
   #:USER-NAME
   #:USER-ID
   #:URL
   #:IMAGE-URL-25X25
   #:IMAGE-URL-30X30
   #:IMAGE-URL-50X50
   #:IMAGE-URL-75X75
   #:JOIN-EPOCH
   #:CITY
   #:GENDER
   #:LAT
   #:LON
   #:TRANSACTION-BUY-COUNT
   #:TRANSACTION-SOLD-COUNT
   #:IS-SELLER
   #:WAS-FEATURED-SELLER
   #:MATERIALS
   #:LAST-LOGIN-EPOCH
   #:REFERRED-USER-COUNT
   #:BIRTH-DAY
   #:BIRTH-MONTH
   #:BIO
   #:FEEDBACK-COUNT
   #:FEEDBACK-PERCENT-POSITIVE
   #:FAVORITE-CREATION-EPOCH
   #:STATUS
   ;; Shop
   #:SHOP
   #:BANNER-IMAGE-URL
   #:LAST-UPDATED-EPOCH
   #:CREATION-EPOCH
   #:LISTING-COUNT
   #:SHOP-NAME
   #:TITLE
   #:SALE-MESSAGE
   #:ANNOUNCEMENT
   #:IS-VACATION
   #:VACATION-MESSAGE
   #:CURRENCY-CODE
   #:POLICY-WELCOME
   #:POLICY-PAYMENT
   #:POLICY-SHIPPING
   #:POLICY-REFUNDS
   #:POLICY-ADDITIONAL
   #:SECTIONS
   ;; Shop Section
   #:SHOP-SECTION
   #:SECTION-ID TITLE LISTING-COUNT
   ;; Listing
   #:LISTING
   #:LISTING-ID
   #:STATE
   #:TITLE
   #:URL
   #:IMAGE-URL-25X25
   #:IMAGE-URL-50X50
   #:IMAGE-URL-75X75
   #:IMAGE-URL-155X125
   #:IMAGE-URL-200X200
   #:IMAGE-URL-430XN
   #:CREATION-EPOCH
   #:VIEWS
   #:TAGS
   #:MATERIALS
   #:PRICE
   #:CURRENCY-CODE
   #:ENDING-EPOCH
   #:USER-ID
   #:USER-NAME
   #:QUANTITY
   #:HSV-COLOR
   #:RGB-COLOR
   #:DESCRIPTION
   #:LAT
   #:LON
   #:CITY
   #:SECTION-ID
   #:SECTION-TITLE
   #:FAVORITE-CREATION-EPOCH
   #:USER-IMAGE-ID
   ;; Gift Guide
   #:GIFT-GUIDE
   #:GUIDE-ID
   #:CREATION-TSZ-EPOCH
   #:DESCRIPTION
   #:TITLE
   #:DISPLAY-ORDER
   #:GUIDE-SECTION-ID
   #:GUIDE-SECTION-TITLE
   ;; Feedback
   #:FEEDBACK
   #:FEEDBACK-ID
   #:LISTING-ID
   #:TITLE
   #:URL
   #:CREATION-EPOCH
   #:AUTHOR-USER-ID 
   #:SUBJECT-USER-ID
   #:SELLER-USER-ID
   #:BUYER-USER-ID
   #:MESSAGE
   #:DISPOSITION
   #:VALUE
   #:IMAGE-URL-25X25
   #:IMAGE-URL-FULLXFULL
   ;; API Method
   #:API-METHOD
   #:NAME
   #:DESCRIPTION
   #:URI
   #:PARAMS
   #:TYPE
   #:HTTP-METHOD
   ;; API Meta
   #:API-CLASS-INFO
   #:SLOT-DESCRIPTION
   #:API-SLOT-DESCRIPTION
   #:CLASS
   #:PLIST
   #:NAME
   #:DOCUMENTATION
   #:DETAIL-LEVEL
   #:TYPE
   #:API-CLASS-DESCRIPTION
   #:NAME
   #:PLIST
   #:SUPERCLASS
   #:DOCUMENTATION
   #:SLOT-DESCRIPTIONS
   ))

