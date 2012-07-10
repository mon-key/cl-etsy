
;; (cl:in-package #:cl-user)

;; (cl:defpackage #:cl-etsy-build-system (:use #:common-lisp #:asdf))

;; (cl:in-package #:cl-etsy-build-system)

(asdf:defsystem #:cl-etsy
  :version "0.2"
  :author "Ben Hyde <bhyde@pobox.com>"
  :maintainer "MON KEY"
  :licence "Apache 2.0"
  :depends-on (#:cl-ppcre
               #:cl-json
               #:drakma
               ;; #:flexi-streams see `api-call'
               ) 
  :serial t
  :components (
               (:file "package")
               (:file "specials")
               ;; (:file "base")
               ;; (:file "api-utils")
               ;; (:file "types")
               ;; (:file "methods")
               ;; (:file "main")
               (:module "api-class"
                :components (
                             (:file "etsy-types")
                             (:file "etsy-class-generic")
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
                             ))
                                     
               ;; (:module "misc" 
               ;;          :components ((:file "categories")
               ;;                       (:file "tags")))
               #+5am (:file "tests")
               ))

(defmethod asdf:perform :after ((op asdf:load-op) (system (eql (asdf:find-system :mon))))
  (when (member :IS-MON cl:*features*)
    (let ((maybe-loadtime-bind-file 
            (probe-file (merge-pathnames (make-pathname :name "loadtime-bind" :type "lisp")
                                         (asdf:system-source-directory system))))) 
      (when maybe-loadtime-bind-file
        (load maybe-loadtime-bind-file :verbose t :print t)))))

