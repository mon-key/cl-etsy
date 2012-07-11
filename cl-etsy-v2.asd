
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
               ;; v1 files
               ;; (:file "base") 
               ;; (:file "api-utils")
               ;; (:file "types")
               ;; (:file "methods")
               ;; (:file "main")
               (:module "api-class"
                :components (
                             (:file "etsy-types")
                             (:file "etsy-class-generic")
                             (:file "etsy-epoch")
                             (:file "etsy-base-class")
                             (:file "etsy-data-type-class")
                             (:file "etsy-param-list-class")
                             (:file "etsy-feedback-class")
                             (:file "etsy-feedback-info-class")
                             (:file "etsy-user-class")
                             (:file "etsy-user-profile-class")
                             (:file "etsy-user-address-class")                             
                             (:file "etsy-category-class")
                             (:file "etsy-listing-class")
                             (:file "etsy-shop-class")
                             (:file "etsy-tag-class")
                             (:file "etsy-transaction-class")
                             (:file "etsy-treasury-class")
                             (:file "etsy-treasury-counts-class")
                             (:file "etsy-treasury-listing-class")
                             (:file "etsy-treasury-listing-data-class")
                             (:file "etsy-bill-charge-class")
                             (:file "etsy-billing-overview-class")
                             (:file "etsy-bill-payment-class")
                             (:file "etsy-cart-class")
                             (:file "etsy-cart-listing-class")
                             ))
                                     
               ;; (:module "misc" 
               ;;          :components ((:file "categories")
               ;;                       (:file "tags")))
               #+5am (:file "tests")
               ))

(defmethod asdf:perform :after ((op asdf:load-op) (system (eql (asdf:find-system :cl-etsy))))
  (when (member :IS-MON cl:*features*)
    (let ((maybe-loadtime-bind-file 
           (probe-file (merge-pathnames (make-pathname :name "loadtime-bind" :type "lisp")
                                        (asdf:system-source-directory system))))) 
      (when maybe-loadtime-bind-file
        (load maybe-loadtime-bind-file :verbose t :print t)))))

