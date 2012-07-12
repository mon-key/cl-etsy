
;; (cl:in-package #:cl-user)

;; (cl:defpackage #:cl-etsy-build-system (:use #:common-lisp #:asdf))

;; (cl:in-package #:cl-etsy-build-system)

(asdf:defsystem #:cl-etsy
  :version "0.1"
  :author "MON KEY" ; thanks to "Ben Hyde <bhyde@pobox.com>" for the a CL interface to the Etsy v1 API
  :maintainer "MON KEY"
  :licence "MIT"
  :depends-on (#:cl-ppcre
               #:drakma
               ;; #:flexi-streams see `api-call'
               ;;
               ;; #:cl-json
               #:yason ; the conversion to the v2 API uses yason not cl-json
               ) 
  :serial t
  :components (
               (:file "package")
               (:file "specials")
               (:file "environment")
               (:module "api-class"
                :components (
                             (:file "etsy-types")
                             (:file "etsy-class-generic")
                             (:file "etsy-epoch")
                             (:file "etsy-base-class")
                             (:file "etsy-avatar-class")
                             (:file "etsy-bill-charge-class")
                             (:file "etsy-billing-overview-class")
                             (:file "etsy-bill-payment-class")
                             (:file "etsy-cart-class")
                             (:file "etsy-cart-listing-class")
                             (:file "etsy-category-class")
                             (:file "etsy-country-class")
                             (:file "etsy-coupon-class")
                             (:file "etsy-data-type-class")
                             (:file "etsy-favorite-listing-class")
                             (:file "etsy-favorite-user-class")
                             (:file "etsy-featured-treasury-class")
                             (:file "etsy-feedback-class")
                             (:file "etsy-feedback-info-class")
                             (:file "etsy-forum-post-class")
                             (:file "etsy-listing-class")
                             (:file "etsy-listing-image-class")
                             (:file "etsy-listing-translation-class")
                             (:file "etsy-order-class")
                             (:file "etsy-param-list-class")
                             (:file "etsy-payment-template-class")
                             (:file "etsy-receipt-class")
                             (:file "etsy-region-class")
                             (:file "etsy-shipping-info-class")
                             (:file "etsy-shipping-template-class")
                             (:file "etsy-shipping-template-entry-class")
                             (:file "etsy-shop-class")
                             (:file "etsy-shop-section-class")
                             (:file "etsy-shop-section-translation-class")
                             (:file "etsy-shop-translation-class")
                             (:file "etsy-style-class")
                             (:file "etsy-tag-class")
                             (:file "etsy-team-class")
                             (:file "etsy-transaction-class")
                             (:file "etsy-treasury-class")
                             (:file "etsy-treasury-counts-class")
                             (:file "etsy-treasury-listing-class")
                             (:file "etsy-treasury-listing-data-class")
                             (:file "etsy-user-class")
                             (:file "etsy-user-profile-class")
                             (:file "etsy-user-address-class")
                             ))
               ;; v1 files
               (:module "api-v1"
                :components ((:file "base") 
                             (:file "api-utils")
                             (:file "types")
                             (:file "methods")
                             (:file "main")
                             (:module "misc" 
                              :components ((:file "categories")
                                           (:file "tags")))
                             #+5am (:file "tests"))))
               )

(defmethod asdf:perform :after ((op asdf:load-op) (system (eql (asdf:find-system :cl-etsy))))
  (when (member :IS-MON cl:*features*)
    (let ((maybe-loadtime-bind-file 
           (probe-file (merge-pathnames (make-pathname :name "loadtime-bind" :type "lisp")
                                        (asdf:system-source-directory system))))) 
      (when maybe-loadtime-bind-file
        (load maybe-loadtime-bind-file :verbose t :print t)))))

