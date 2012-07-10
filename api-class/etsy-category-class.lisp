;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:18:03-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-category-class.lisp
;;; ==============================

;;; ==============================
;;
;; (URL `http://www.etsy.com/developers/documentation/reference/category')
;;
;; "getCategory"
;; - Retrieves a top-level Category by tag.
;;  (URL `http://www.etsy.com/developers/documentation/reference/category#method_getcategory')
;;
;; "findAllTopCategory"
;; - Retrieves all top-level Categories.
;;  (URL `http://www.etsy.com/developers/documentation/reference/category#method_findalltopcategory')
;;
;; "getSubCategory"
;; - Retrieves a second-level Category by tag and subtag.
;;  (URL `http://www.etsy.com/developers/documentation/reference/category#method_getsubcategory')
;;
;; "getSubSubCategory"
;; - Retrieves a third-level Category by tag, subtag and subsubtag.
;;  (URL `http://www.etsy.com/developers/documentation/reference/category#method_getsubsubcategory')
;;
;; "findAllTopCategoryChildren"
;; - Retrieves children of a top-level Category by tag.
;;  (URL `http://www.etsy.com/developers/documentation/reference/category#method_findalltopcategorychildren')
;;
;; "findAllSubCategoryChildren"
;; -Retrieves children of a second-level Category by tag and subtag.
;;  (URL `http://www.etsy.com/developers/documentation/reference/category#method_findallsubcategorychildren')
;;
;; --- 
;; Categories are no longer the first three tags of a Listing.
;; Category is a first-class resource, with its own primary key ID.
;; When calling createListing, you must pass a category_id to specify the category for the Listing.
;;
;; (URL `http://www.etsy.com/developers/documentation/reference/listing#section_categories_and_tags')
;;
;;; ==============================

(in-package #:cl-etsy)

;; Category
(defclass category (base-etsy)
  (
   ;; category_id
   (category-id
    :initarg :category-id
    :accessor category-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The identifier for this category.")

   (name
    :initarg :name
    :accessor name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The programmatic name for this category.")

   ;; meta_title
   (meta-title
    :initarg :meta-title
    :accessor meta-title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string ; or null
    :documentation "The \"title\" meta tag value for the category's landing page (may be null).")

   ;; meta_keywords
   (meta-keywords
    :initarg :meta-keywords
    :accessor meta-keywords
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string ; or null
    :documentation "The \"keywords\" meta tag value for the category's landing page (may be null).")

   ;; meta_description
   (meta-description
    :initarg :meta-description
    :accessor meta-description
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string ; or null
    :documentation "The \"description\" meta tag value for the category's landing page (may be null).")

   ;; page_description
   (page-description
    :initarg :page-description
    :accessor page-description
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string ; or null
    :documentation "A short description of the category from the category' landing page (may be null).")

   ;; page_title
   (page-title
    :initarg :page-title
    :accessor page-title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string ; or null
    :documentation "The title of the category's landing page (may be null).")

   ;; category_name
   (category-name
    :initarg :category-name

    :accessor category-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The category's string ID.")

   ;; short_name
   (short-name
    :initarg :short-name
    :accessor short-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A short display name for the category.")

   ;; long_name
   (long-name
    :initarg :long-name
    :accessor long-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A longer display name for the category.")

   ;; num_children
   (num-children
    :initarg :num-children
    :accessor num-children
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of subcategories below this one. Subcatgories append a new tag to the end of their parent's category_name.")
   )

  ;; (:default-initargs :category-id nil :name nil :meta-title nil :meta-keywords nil
  ;; :meta-description nil :page-description nil :page-title nil
  ;; :category-name nil :short-name nil :long-name nil :num-children nil)
  (:documentation "A category
 (URL `http://www.etsy.com/developers/documentation/reference/category')"))


;; (defmethod print-object ((x category) stream)
;;   (dumb-printing stream x "~D: ~A" category-id name))


;;; ==============================
;;; EOF
