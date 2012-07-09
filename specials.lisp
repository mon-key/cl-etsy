;;; :FILE-CREATED <Timestamp: #{2012-06-28T13:10:53-04:00Z}#{12264} - by MON>
;;; :FILE cl-etsy/specials.lisp
;;; ==============================

(in-package #:cl-etsy)

;; v1
;; (defparameter *base-url* "http://beta-api.etsy.com/v1")

;; v2
(defparameter *base-url* "http://openapi.etsy.com/v2")

;; See macro `with-api-call' function `build-methods'.
(defvar *api-key* "you need to set your *API-KEY*")

(defvar *lisp-keyword-dictionary* (make-hash-table :test #'eq))

;; 
(defparameter *build-methods-default-output-pathname*
  (make-pathname :directory (list :relative)
                 :name "methods"
                 :type "lisp")
  "Default pathname for dumping the methods generated by function `build-methods'
Used as a defaulting value for keyword METHOD-OUTPUT-FILE.")

;;; ==============================
;;; EOF