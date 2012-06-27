
(cl:defpackage #:cl-etsy-build-system (:use #:common-lisp #:asdf))

(cl:in-package #:cl-etsy-build-system)

(asdf:defsystem #:cl-etsy
  :version "0.2"
  :author "Ben Hyde <bhyde@pobox.com>"
  :maintainer "MON KEY"
  :licence "Apache 2.0"
  :depends-on (:cl-ppcre
               :cl-json
               :drakma
               ;; :flexi-streams see `api-call'
               ) 
  :serial t
  :components ((:file "packages")
               (:file "base")
               (:file "api-utils")
               (:file "types")
               (:file "methods")
               (:file "main")
               ;; (:module "misc" 
               ;;          :components ((:file "categories")
               ;;                       (:file "tags")))
               #+5am (:file "tests")
               ))

