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
 (api-implicit-class-direct-slot-names-as-underscored-strings  'category)

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
  (:documentation "A category.
On 2012-07-28 the Etsy category taxonomy does not descend past 3 levels.
The taxonomy has the basic format:
  <TOP-CATEGORY>/<SUP-CATEGORY>/<SUB-SUB-CATEGORY>
The following Etsy API request methods may be used to access categories at these levels:
 \"findAllTopCategory\" \"findAllTopCategoryChildren\" \"findAllSubCategoryChildren\" 
 \"getCategory\" \"getSubCategory\" \"getSubSubCategory\"
These Etsy API methods are in turn modeled by the following functions:
 `find-all-top-category' `find-all-top-category-children' `find-all-sub-category-children'
 `get-category' `get-sub-category' `get-sub-sub-category'
 (URL `http://www.etsy.com/developers/documentation/reference/category')
 (URL `http://www.etsy.com/developers/documentation/reference/listing#section_categories_and_tags')"))

;; (defmethod print-object ((x category) stream)
;;   (dumb-printing stream x "~D: ~A" category-id name))

(defun get-all-etsy-categories (&key (cat-table (make-hash-table :test #'equal)))
  "Return CAT-TABLE populated with all current Etsy categories.
All current Etsy categories are retrieved and converted to instances of class `category'.
Each such instance is added to CAT-TABLE using its `category-name' as hash-key and instance as hash-value.
Categories are retrieved as follows:
 - all top level categories are retrieved as if by Etsy API request method \"findAllTopCategory\"
 - for each top-level category retrieve any child categories it may have as if by Etsy API request method \"findAllTopCategoryChildren\"
 - for each child-category retrieved retrieve any child categories it may have as if by Etsy API request method \"findAllSubCategoryChildren\"
:NOTE On 2012-07-28 there were 3879 categories. Accessing all of them required 507 api calls."
  (loop 
    ;; 31 top categories - 1 API CALL
    ;; "findAllTopCategory"
    ;; for cat-table = (or cat-hash (make-hash-table :test #'equal))
    ;; for top-cat-alist in ;;
    with top-cat-alist = (parsed-api-call (concatenate 'string *base-url* "/taxonomy/categories/") :object-as :alist)
    for top-cat in top-cat-alist
    for top-cat-obj = (apply #'make-instance 'category (alexandria:alist-plist top-cat))
    for top-cat-obj-name = (category-name top-cat-obj)
    do (setf (gethash top-cat-obj-name cat-table) top-cat-obj)
       (and (not (zerop (num-children top-cat-obj)))
            (loop 
              ;; 475 sub-categories - 31 API CALLS
              ;; "findAllTopCategoryChildren"
              ;; "/taxonomy/categories/:tag"       
              with sub-cat-alist = (parsed-api-call
                                    (concatenate 'string *base-url* "/taxonomy/categories/" top-cat-obj-name)
                                    :object-as :alist)
              for sub-cat in sub-cat-alist
              for sub-cat-obj  = (apply #'make-instance 'category (alexandria:alist-plist sub-cat))
              for sub-cat-obj-name = (category-name sub-cat-obj)
              do (setf (gethash sub-cat-obj-name cat-table) sub-cat-obj)
                 (and (not (zerop (num-children sub-cat-obj)))
                      (loop 
                        ;; 3373 sub-sub-categories - 475 API CALLS
                        ;; "findAllSubCategoryChildren"
                        ;; "/taxonomy/categories/:tag/:subtag"                      
                        with sub-cat-children-alist = (parsed-api-call
                                                       (concatenate 'string *base-url* "/taxonomy/categories/" sub-cat-obj-name)
                                                       :object-as :alist)
                        for sub-sub-cat in sub-cat-children-alist
                        for sub-sub-cat-obj = (apply #'make-instance 'category (alexandria:alist-plist sub-sub-cat))
                        for sub-sub-cat-name = (category-name sub-sub-cat-obj)
                        do (setf (gethash sub-sub-cat-name cat-table) sub-sub-cat-obj)))))
    finally (return cat-table)))

(defun dump-all-etsy-categories-to-file (output-pathname etsy-category-hash)
  "Dump lispy representatin of all etsy category objects at hash-value of ETSY-CATEGORY-HASH to OUTPUT-PATHNAME.
:EXAMPLE
 \(dump-all-etsy-categories-to-file 
  \(make-pathname 
   :directory '\(:absolute \"<DIRECTORY-FOR-DUMPED-CATEGORIES>\"\)
   :name \"all-etsy-categories\"
   :type \"lisp\"\)
  \(get-all-etsy-categories\)\)
"
  (with-open-file (f output-pathname
                    :if-does-not-exist :create
                    :if-exists :supersede
                    :element-type 'character
                    :direction :output)
    (with-standard-io-syntax
      (let ((*print-pretty* t)
            (*print-right-margin* 21)
            (*print-miser-width*  8))
        (loop 
          with hash-keys = (sort (alexandria:hash-table-keys etsy-category-hash) #'string<)
          for key in hash-keys 
          for object = (gethash key etsy-category-hash)
          do (loop 
               for slot in (cadr (assoc 'category *api-classes-and-slots*))
               for init-slot   = (find-symbol (string slot) :keyword)
               for maybe-slot-value = (and (slot-boundp object slot)
                                           (slot-value object slot))
               collect (cons init-slot maybe-slot-value) into gthr
               finally (format f "~2%;; ----~2%~S" gthr)))))))

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
