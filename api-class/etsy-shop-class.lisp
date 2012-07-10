;;; :FILE-CREATED <Timestamp: #{2012-07-10T11:49:10-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-shop-class.lisp
;;; ==============================

;; this class originally defined in cl-etsy/types.lisp

(in-package #:cl-etsy)

;; "getShop", "updateShop", "findAllUserShops", "findAllShops", "uploadShopBanner", "deleteShopBanner"

;; :NOTE for v2 we probably shouldn't be inheritting from USER
(def-api-class shop (user)
  "Shop records extend user records to include information about the seller's shop.
In addition to all the user fields listed above; shops have these additional fields:"
  ((banner-image-url
    :level :low
    :type string
    :doc "The full URL to the shops's banner image.")
   (last-updated-epoch
    :level :low
    :type string
    :doc "The date and time the shop was last updated, in epoch seconds.")
   (creation-epoch
    :level :low
    :type string
    :doc "The date and time the shop was created, in epoch seconds.")
   (listing-count
    :level :low
    :type int
    :doc "The number of active listings in the shop.")
   (shop-name
    :level :medium
    :type string
    :doc "The shop's name.")
   (title
    :level :medium
    :type string
    :doc "A brief heading for the shop's main page.")
   (sale-message
    :level :medium
    :type string
    :doc "A message that is sent to users who buy from this shop.")
   (announcement
    :level :high
    :type string
    :doc "An announcement to buyers that displays on the shop's homepage.")
   (is-vacation
    :level :high
    :type int
    :doc "If the seller is not currently accepting purchases, 1, blank otherwise.")
   (vacation-message
    :level :high
    :type string
    :doc "If is-vacation=1, a message to buyers.")
   (currency-code
    :level :high
    :type string
    :doc "The ISO code (alphabetic) for the seller's native currency.")
   (policy-welcome
    :level :high
    :type string
    :doc "The introductory text from the top of the seller's policies page (may be blank).")
   (policy-payment
    :level :high
    :type string
    :doc "The seller's policy on payment (may be blank).")
   (policy-shipping
    :level :high
    :type string
    :doc "The seller's policy on shippinh (may be blank).")
   (policy-refunds
    :level :high
    :type string
    :doc "The seller's policy on refunds (may be blank).")
   (policy-additional
    :level :high
    :type string
    :doc "Any additional policy information the seller provides (may be blank).")
   (sections
    :level :high
    :type array-of-shop-sections
    :doc "(shop-section)
An array of shop-section objects (see below).")))


;;; ==============================
;;; EOF
