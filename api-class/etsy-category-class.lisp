;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:18:03-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-category-class.lisp
;;; ==============================


#|
 (URL `http://www.etsy.com/developers/documentation/reference/category')

 ----
 Categories are no longer the first three tags of a Listing.
 Category is a first-class resource, with its own primary key ID.
 When calling createListing, you must pass a category_id to specify the category for the Listing.

 (URL `http://www.etsy.com/developers/documentation/reference/listing#section_categories_and_tags')

 ----
 :METHODS
 "getCategory"
 - Retrieves a top-level Category by tag.
  (URL `http://www.etsy.com/developers/documentation/reference/category#method_getcategory')

 "findAllTopCategory"
 - Retrieves all top-level Categories.
  (URL `http://www.etsy.com/developers/documentation/reference/category#method_findalltopcategory')

 "getSubCategory"
 - Retrieves a second-level Category by tag and subtag.
  (URL `http://www.etsy.com/developers/documentation/reference/category#method_getsubcategory')

 "getSubSubCategory"
 - Retrieves a third-level Category by tag, subtag and subsubtag.
  (URL `http://www.etsy.com/developers/documentation/reference/category#method_getsubsubcategory')

 "findAllTopCategoryChildren"
 - Retrieves children of a top-level Category by tag.
  (URL `http://www.etsy.com/developers/documentation/reference/category#method_findalltopcategorychildren')

 "findAllSubCategoryChildren"
 -Retrieves children of a second-level Category by tag and subtag.
  (URL `http://www.etsy.com/developers/documentation/reference/category#method_findallsubcategorychildren')

----
 (closer-mop:class-finalized-p (find-class 'category))
 (api-class-slot-names-as-underscored-strings  'category)

|#

(in-package #:cl-etsy)

;; Category
(defclass category (base-etsy)
  (;; category_id
   (category-id
    :initarg :category-id
    :accessor category-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The identifier for this category.
:API-FIELD category_id")

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
    :documentation "The \"title\" meta tag value for the category's landing page (may be null).
:API-FIELD meta_title")

   ;; meta_keywords
   (meta-keywords
    :initarg :meta-keywords
    :accessor meta-keywords
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string ; or null
    :documentation "The \"keywords\" meta tag value for the category's landing page (may be null).
:API-FIELD meta_keywords")

   ;; meta_description
   (meta-description
    :initarg :meta-description
    :accessor meta-description
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string ; or null
    :documentation "The \"description\" meta tag value for the category's landing page (may be null).
:API-FIELD meta_description")

   ;; page_description
   (page-description
    :initarg :page-description
    :accessor page-description
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string ; or null
    :documentation "A short description of the category from the category' landing page (may be null).
:API-FIELD page_description")

   ;; page_title
   (page-title
    :initarg :page-title
    :accessor page-title
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string ; or null
    :documentation "The title of the category's landing page (may be null).
:API-FIELD page_title")

   ;; category_name
   (category-name
    :initarg :category-name
    :accessor category-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The category's string ID. 
Has the form <category-name> or <category-name>/<subs>* where `<subs>*`
indicates one or more children in a parent-child tree e.g.:
 vintage 
 vintage/clothing
 vintage/clothing/skirts
:API-FIELD category_name")

   ;; short_name
   (short-name
    :initarg :short-name
    :accessor short-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A short display name for the category.
:API-FIELD short_name")

   ;; long_name
   (long-name
    :initarg :long-name
    :accessor long-name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A longer display name for the category.
Has the form \"<Category-name>\" or <Category-name> > <Subs>* where `<Subs>*`
indicates one or more children in a parent-child tree e.g.:
 \"Vintage\"
 \"Vintage > Clothing\"
 \"Vintage > Clothing > Skirts\"
:API-FIELD long_name")

   ;; num_children
   (num-children
    :initarg :num-children
    :accessor num-children
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The number of subcategories below this one.
Subcatgories append a new tag to the end of their parent's category_name.
:API-FIELD num_children")
   )
  ;; (:default-initargs :category-id nil :name nil :meta-title nil :meta-keywords nil
  ;; :meta-description nil :page-description nil :page-title nil
  ;; :category-name nil :short-name nil :long-name nil :num-children nil)
  (:documentation "A category
 (URL `http://www.etsy.com/developers/documentation/reference/category')
 (URL `http://www.etsy.com/developers/documentation/reference/listing#section_categories_and_tags')"))


;; (defmethod print-object ((x category) stream)
;;   (dumb-printing stream x "~D: ~A" category-id name))


#|
  
  | "getCategory"
  | (yason:parse (api-call (concatenate 'string *base-url* "/categories/vintage")) :object-as :alist)
  | (parsed-api-call (concatenate 'string *base-url* "/categories/vintage") :object-as :alist)

  ((:NAME        . "getCategory")
   (:DESCRIPTION . "Retrieves a top-level Category by tag.")
   (:URI         . "/categories/:tag")
   (:PARAMS
    (:TAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))


  | "getSubCategory"
  | (yason:parse (api-call (concatenate 'string *base-url* "/categories/" "vintage/clothing")) :object-as :alist)

  ((:NAME        . "getSubCategory")
   (:DESCRIPTION . "Retrieves a second-level Category by tag and subtag.")
   (:URI         . "/categories/:tag/:subtag")
   (:PARAMS
    (:TAG    . "string")
    (:SUBTAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

  | "getSubSubCategory"
  | (yason:parse (api-call (concatenate 'string *base-url* "/categories/" "vintage/clothing/pants")) :object-as :alist)

  ((:NAME        . "getSubSubCategory")
   (:DESCRIPTION . "Retrieves a third-level Category by tag, subtag and subsubtag.")
   (:URI         . "/categories/:tag/:subtag/:subsubtag")
   (:PARAMS
    (:TAG       . "string")
    (:SUBTAG    . "string")
    (:SUBSUBTAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

  | "findAllTopCategory"
  | (yason:parse (api-call (concatenate 'string *base-url* "/taxonomy/categories")) :object-as :alist)

  ((:NAME        . "findAllTopCategory")
   (:DESCRIPTION . "Retrieves all top-level Categories.")
   (:URI         . "/taxonomy/categories")
   (:PARAMS)
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))
  
  | "findAllTopCategoryChildren"
  | (yason:parse (api-call (concatenate 'string *base-url* "/taxonomy/categories/" "vintage")) :object-as :alist)

  ((:NAME        . "findAllTopCategoryChildren")
   (:DESCRIPTION . "Retrieves children of a top-level Category by tag.")
   (:URI         . "/taxonomy/categories/:tag")
   (:PARAMS
    (:TAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

  | "findAllSubCategoryChildren"
  | (yason:parse (api-call (concatenate 'string *base-url* "/taxonomy/categories/" "vintage/clothing")) :object-as :alist)

  ((:NAME        . "findAllSubCategoryChildren")
   (:DESCRIPTION . "Retrieves children of a second-level Category by tag and subtag.")
   (:URI         . "/taxonomy/categories/:tag/:subtag")
   (:PARAMS
    (:TAG    . "string")
    (:SUBTAG . "string"))
   (:DEFAULTS)
   (:TYPE         . "Category")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))

|#

;;; ==============================
;;; EOF
