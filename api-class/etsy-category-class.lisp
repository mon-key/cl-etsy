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

(def-api-class category ()
  (
   ;; category_id
   (category-id
    :type int
    :doc "The identifier for this category.")
   ;; WTF, why isn't this category_name?
   (name 
    :type string
    "The programmatic name for this category.")
   ;; meta_title
   (meta-title
    :type string ; or null
    :doc "The \"title\" meta tag value for the category's landing page (may be null).")
   ;; meta_keywords
   (meta-keywords
    :type string ; or null
    :doc "The \"keywords\" meta tag value for the category's landing page (may be null).")
   ;; meta_description
   (meta-description
    :type string ; or null
    :doc "The \"description\" meta tag value for the category's landing page (may be null).")
   ;; page_description
   (page-description
    :type string ; or null
    :doc "A short description of the category from the category' landing page (may be null).")
   ;; page_title
   (page-title
    :type string ; or null
    :doc "The title of the category's landing page (may be null).")
   ;; category_name
   (category-name
    :type string
    :doc "The category's string ID.")
   ;; short_name 
   (short-name 
    :type string
    :doc "A short display name for the category.")
   ;; long_name
   (long-name
    :type string
    :doc "A longer display name for the category.")
   ;; num_children
   (num-children 
    :type int
    :doc "The number of subcategories below this one.
Subcatgories append a new tag to the end of their parent's category-name."))
  )


(defmethod print-object ((x category) stream)
  (dumb-printing stream x "~D: ~A" category-id name))


;;; ==============================
;;; EOF
