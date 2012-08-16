;;; :FILE-CREATED <Timestamp: #{2012-07-23T18:02:08-04:00Z}#{12301} - by MON>
;;; :FILE #P"/cl-etsy/api-mappings.lisp"
;;; ==============================

#|

|#

(in-package #:cl-etsy)

(defun api-class-name-as-studly-caps-string (api-class-symbol)
  "Convert API-CLASS-SYMBOL to a studly caps string.
:EXAMPLE
 \(equal \(api-class-name-as-studly-caps-string 'favorite-listing\) \"FavoriteListing\"\)
 \(mapcar #'api-class-name-as-studly-caps-string \(mapcar #'car *api-classes-and-slots*\)\)
:SEE-ALSO `api-class-slot-name-as-underscored-string', `api-class-slot-name-as-lispy-string'."
  (symbol-munger::english->studly-case (substitute #\Space #\- (string api-class-symbol))))

;; (api-string-or-symbol-list-hash-for-object-key-fn
;;  (api-class-name-as-studly-caps-strings)
;;  #'api-class-name-as-studly-caps-string
;;  :element-type :symbol)
(defun api-class-names-as-studly-cap-strings (&optional (api-class-list (mapcar #'car *api-classes-and-slots*)))
  ;; :EXAMPLE
  ;; (api-class-names-as-studly-cap-strings)
  ;; (api-class-names-as-studly-cap-strings (list 'api-method 'param-list))
  (declare ((and list (not null)) api-class-list))
  (map 'list #'api-class-name-as-studly-caps-string api-class-list))

(defun api-class-slot-name-as-lispy-string (api-class-slot-name)
  "Return the cl:string representation of symbol API-CLASS-SLOT-NAME.
:SEE-ALSO `api-class-slot-name-as-lispy-strings'."
  (string api-class-slot-name))

(defun api-class-slot-name-as-underscored-string (api-class-slot-name)
  "Convert API-CLASS-SLOT-NAME to an underscored string.
:EXAMPLE
 \(equal \(api-class-slot-name-as-underscored-string 'listing-id\) \"listing_id\"\)
:SEE-ALSO `api-implicit-class-direct-slot-names-as-underscored-strings', `api-class-name-as-studly-caps-string',
`api-class-slot-name-as-lispy-string'."
  (symbol-munger:lisp->underscores api-class-slot-name))

(defun api-class-slot-names-as-underscored-strings (api-class-slot-name-list)
  "Return a list of underscored strings as if by `api-class-slot-name-as-underscored-string'.
API-CLASS-SLOT-NAME-LIST is a list symbols each designating a slot-name.
:EXAMPLE
 (api-class-slot-names-as-underscored-strings)
:SEE-ALSO `api-implicit-class-direct-slot-names-as-underscored-strings', `api-class-name-as-studly-caps-string',
`api-class-slot-name-as-lispy-string'."
  (map 'list #'api-class-slot-name-as-underscored-string api-class-slot-name-list))

(defun api-string-or-symbol-list-hash-for-object-key-fn (string-or-symbol-list munging-function 
                                                         &key (hash-table *api-response-string-symbol-hash-for-object-key-fn*)
                                                              element-type)
  "Return as cl:values `cl:hash-table-count' of HASH-TABLE before hashing strings/symbols and the count after.
STRING-OR-SYMBOL-LIST is a proper list with every element of type string or symbol but not both.
MUNGING-FUNCTION is a function designator for a function wich accepts a
single argument a string or symbol and returns a symbol or string equivalent.
HASH-TABLE is a hash-table to cache symbol/string and string/symbol mappings generated with MUNGING-FUNCTION.
Default is value of `*api-response-string-symbol-hash-for-object-key-fn*'.
Keyword ELEMENT-TYPE designates whether every element of is a string or symbol.
Valid arguments are one of :string or :symbol
When STRING-OR-SYMBOL is :symbol the elements of STRING-OR-SYMBOL-LIST must not contain the symbol T or nil.
When STRING-OR-SYMBOL is :string the elements of STRING-OR-SYMBOL-LIST must not contain the empty string.
:EXAMPLE
 ;; Following form is evaluated at compile/load time to establish mappings for
 ;; each slot of each api-class we define:
  \(api-string-or-symbol-list-hash-for-object-key-fn
   \(substitute \"url_570xN\" \"url_570xn\"
               \(remove \"data_type_values\"
                       \(api-class-all-slot-names-unique-as-underscored-strings\)
                       :test #'equal\)
               :test #'equal\)
   #'symbol-munger:underscores->keyword
   :element-type :string\)
:SEE-ALSO `api-implicit-class-direct-slot-names-as-underscored-strings', `api-class-name-as-studly-caps-string',
`api-class-slot-name-as-lispy-string'."
  (declare ((or (eql :string) (eql :symbol)) element-type))
  (ecase element-type
    ;; (null (error ":FUNCTION `api-string-or-symbol-list-hash-for-object-key-fn'~% ~
    ;;                -- argument to keyword ELEMENT-TYPE was null but must be either :string or :symbol"))
    (:string 
     (assert (%each-a-string-p string-or-symbol-list)))
    (:symbol
     (assert (%each-a-symbol-p string-or-symbol-list))))
  (loop 
    with start-hash-count = (hash-table-count hash-table)
    for api-string-or-symbol in string-or-symbol-list
    for munged = (funcall munging-function api-string-or-symbol)
    do (multiple-value-bind (val foundp) (gethash api-string-or-symbol hash-table)
         (unless (and val foundp)
           (setf (gethash api-string-or-symbol hash-table)
                 munged)))
       (multiple-value-bind (val foundp) (gethash munged hash-table)
         (unless (and val foundp)
           (setf (gethash munged hash-table)
                 api-string-or-symbol)))
    finally (return (values start-hash-count (hash-table-count hash-table)))))



;;; ==============================
;;; Functions for introspecting and subsequently munging around the direct-slot
;;; slot-names and initargs of an API class using MOP introspection via closer-mop
;;; ==============================

(defun api-implicit-class-ensure-finalized (api-class)
  ;; By default cl:find-class errors when class does not exist.
  (let ((found-class (find-class api-class)))
    (if (closer-mop:class-finalized-p found-class)
        found-class
        (closer-mop:ensure-finalized found-class))))

(defun api-implicit-class-direct-slot-definition-names (api-class)
  "API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of symbols designating the slot-names of the direct-slot of API-CLASS.
:EXAMPLE
 \(api-implicit-class-direct-slot-definition-names 'api-method\)"
  (map 'list #'closer-mop:slot-definition-name
       (closer-mop:class-direct-slots (api-implicit-class-ensure-finalized api-class))))

;; :TODO Add function which invokes cl:warn when list element returned from the
;; following function has a non-null value for :difference.
(defun api-implicit-class-direct-slot-definition-names-compare (&optional (api-class-list (mapcar #'car *api-classes-and-slots*)))
  "Return a list of class-names and any set-difference between 
the return value of of `api-implicit-class-direct-slot-definition-names' and 
the class slot-names specified in the cadr of each element of API-CLASS-LIST.
Each element of return value as the form:
 \(<API-CLASS-NAME> :difference \( <SLOT-NAME>* \)\)
:EXAMPLE 
 \(api-implicit-class-direct-slot-definition-names-compare\)
 \(api-implicit-class-direct-slot-definition-names-compare '\(api-method\)\)"
  (declare ((and list (not null)) api-class-list))
  (assert (typep api-class-list '(and list (not null))))
  (loop 
    for api-class in api-class-list
    for direct-slots = (api-implicit-class-direct-slot-definition-names api-class)
    for hardwired = (cadr (assoc api-class *api-classes-and-slots*))
    for set-diff = (set-difference direct-slots hardwired)
    collect (list api-class :difference set-diff)))

(defun api-implicit-class-direct-slot-definition-initarg-names (api-class)
"API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of initargs (keywords) for the direct slots of API-CLASS.
If a direct-slot of API-CLASS does not have an initarg the corresponding
element of the list is null.
:EXAMPLE
 \(api-implicit-class-direct-slot-definition-initarg-names 'api-method\)"
  (flet ((slot-init-arg-name (direct-slot)
           (car (closer-mop:slot-definition-initargs direct-slot))))
    (map 'list #'slot-init-arg-name
         (closer-mop:class-direct-slots (api-implicit-class-ensure-finalized api-class)))))

(defun api-implicit-class-direct-slot-definition-name-and-initarg (api-class)
  "API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of conses of the form:
 (<SLOT-NAME> . <INITARG-NAME-OR-NULL>)
 - <SLOT-NAME> is a symbol designating the slot-name (a symbol) of a direct-slot of API-CLASS
 - <INITARG-NAME-OR-NULL> is either an initarg (a keyword) of a direct-slot of
   API-CLASS or null if the direct-slot does not have an initarg.
:EXAMPLE
 \(api-implicit-class-direct-slot-definition-name-and-initarg 'api-method\)"
  (flet ((slot-name-and-init (direct-slot)
           (cons (closer-mop:slot-definition-name direct-slot)
                 (car (closer-mop:slot-definition-initargs direct-slot)))))
    (map 'list #'slot-name-and-init
         (closer-mop:class-direct-slots (api-implicit-class-ensure-finalized api-class)))))

(defun api-implicit-class-direct-slot-definition-name-as-underscored-string-and-initarg (api-class)
  "API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of conses of the form:
 (<SLOT-NAME-AS-UNDERSCORED-STRING> . <INITARG-NAME-OR-NULL>)
 - <SLOT-NAME-AS-UNDERSCORED-STRING> is a string as per `api-class-slot-names-as-underscored-string'.
 - <INITARG-NAME-OR-NULL> is either an initarg (a keyword) of a direct-slot of
   API-CLASS or null if the direct-slot does not have an initarg.
:EXAMPLE
\(api-implicit-class-direct-slot-definition-name-as-underscored-string-and-initarg 'api-method\)"
  (flet ((slot-name-and-init (direct-slot)
           (cons (api-class-slot-name-as-underscored-string (closer-mop:slot-definition-name direct-slot))
                 (car (closer-mop:slot-definition-initargs direct-slot)))))
    (map 'list #'slot-name-and-init
         (closer-mop:class-direct-slots (api-implicit-class-ensure-finalized api-class)))))

(defun api-implicit-class-direct-slot-names-as-lispy-strings (api-class)
"Return a list strings as if by `api-class-slot-name-as-lispy-string'.
Each element of list is the string name of a direct-slot slot-name of API-CLASS.
API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
:EXAMPLE
 (api-implicit-class-direct-slot-names-as-lispy-strings 'api-method)"
  (map 'list #'api-class-slot-name-as-lispy-string
       (api-implicit-class-direct-slot-definition-names api-class)))

(defun api-implicit-class-direct-slot-names-as-underscored-strings (api-class)
  "Return a list strings as if by `api-class-slot-names-as-underscored-string'.
Each element of the list corresponds with a direct-slot slot-name of API-CLASS.
API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of conses of the form:
:EXAMPLE
 \(api-implicit-class-direct-slot-names-as-underscored-strings 'api-method\)"
  (api-class-slot-names-as-underscored-strings
   (api-implicit-class-direct-slot-definition-names api-class)))

(defun api-implicit-class-and-slot-names-as-etsy-strings (&optional (api-class-list (mapcar #'car *api-classes-and-slots*)))
  "Return a list of the string representation of the api-classes and their direct slots as seen in a JSON response object.
 API-CLASS-LIST is a list
of symbols each designating an api-class.  like
`api-explicit-class-and-slot-names-as-etsy-strings' but the the names of
the direct slots of each API-CLASS are acquired with MOP introspection as
if by `api-implicit-class-direct-slot-names-as-underscored-strings'."
  (loop 
    for api-class-sym = api-class-list
    for api-class-string = (api-class-name-as-studly-caps-string api-class-sym)
    for class-direct-slot-strings = (api-implicit-class-direct-slot-names-as-underscored-strings api-class-sym)
    collect (list api-class-string class-direct-slot-strings)))

(defun api-explicit-class-and-slot-names-as-etsy-strings (&optional (class-with-class-slot-list *api-classes-and-slots*))
"Return a list of the string representation of the api-classes and their direct
slots as seen in a JSON response object.
CLASS-WITH-CLASS-SLOT-LIST is a proper list structured as per `*api-classes-and-slots*'. 
Each element of list returned has the format:
 \(\"StudlyClassName\"  \( \"underscored_slot_name\"* \) \)
:EXAMPLE
 \(api-explicit-class-and-slot-names-as-etsy-strings\)
\(equalp
 \(api-explicit-class-and-slot-names-as-etsy-strings 
  '\(\(studly-class-name \(underscored-slot-name-foo underscored-slot-name-bar underscored-slot-name-baz\)\)\)\)
 '\(\(\"StudlyClassName\"  \( \"underscored_slot_name_foo\" \"underscored_slot_name_bar\" \"underscored_slot_name_baz\"\)\)\)\)
"
  (loop 
    for api-class in class-with-class-slot-list
    for api-class-string = (api-class-name-as-studly-caps-string (car api-class))
    for class-direct-slot-strings = (map 'list #'api-class-slot-name-as-underscored-string (cadr api-class))
    collect (list api-class-string class-direct-slot-strings)))

;; (api-class-all-slot-names-unique-as-underscored-strings)
(defun api-class-all-slot-names-unique-as-underscored-strings (&key (class-with-class-slot-list *api-classes-and-slots*))
  (api-class-slot-names-as-underscored-strings
   (nth-value 1
              (api-class-all-slot-names-unique :class-with-class-slot-list class-with-class-slot-list))))


;;; ==============================

(defun api-string/symbol-lookup (string &optional (hash-table *api-response-string-symbol-hash-for-object-key-fn*))
  "
:EXAMPLE
 \(equal \(api-string/symbol-lookup :description\) \"description\"\)
 \(equal \(api-string/symbol-lookup \"description\"\) :description\)
 \(equal \(api-string/symbol-lookup \"Description\"\) \"Description\"\)"
  (or (gethash string hash-table)
      string))

;; (clrhash *api-response-string-symbol-hash-for-object-key-fn*)

;; :NOTE Once we start evaluating #'api-implicit-class-direct-slot-names-as-underscored-strings
;; any of the following forms which invoke `api-implicit-class-ensure-finalized' must to
;; come _after_ the files of ASDF the api-class component.
;; We can't reasonably finalize an api-class prior to the establishing a
;; defclass form for the class!
(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; We want mappings for standard response value and api-method params in our
  ;; environment early... like now.

  ;; standard response value
  (api-string-or-symbol-list-hash-for-object-key-fn
   (list
    "pagination" ; :PAGINATION
     "type"       ; :TYPE 
     "params"     ; :PARAMS 
     "count"      ; :COUNT
     "results")   ; :RESULTS
   #'symbol-munger:underscores->keyword
   :element-type :string)
  
  ;; api-method class
  (api-string-or-symbol-list-hash-for-object-key-fn
   (list
    "name"
    "description"
    "uri"
    "params"
    "defaults"
    "type"
    "visibility"
    "http_method")
   #'symbol-munger:underscores->keyword
   :element-type :string)

  ;; standard parameter types
  (api-string-or-symbol-list-hash-for-object-key-fn
   (list  "page" "offset" "limit")
   #'symbol-munger:underscores->keyword
   :element-type :string)

  ;; keys appearing when limit/offset are non-nil
  (api-string-or-symbol-list-hash-for-object-key-fn
   (list 
    "next_page"
    "effective_page"
    "next_offset"
    "effective_offset"
    "effective_limit")
   #'symbol-munger:underscores->keyword
   :element-type :string)

  ;; AFAIK these don't appear in the car position of a response object but we
  ;; can prob. safely add them to the hash none-the-less
  ;;
  ;; (api-string-or-symbol-list-hash-for-object-key-fn
  ;;  (list  "GET" "PUT" "POST" "DELETE")
  ;;  #'symbol-munger:underscores->keyword
  ;;  :element-type :string)
  ;;
  ;; (api-string-or-symbol-list-hash-for-object-key-fn
  ;;  (list 
  ;;   "public"
  ;;   "private")
  ;; #'symbol-munger:underscores->keyword
  ;; :element-type :string)
  ;;
  ;; ---
  ;; This form must come after api-request.lisp
  ;;
  ;; Hash each unique paramter name returend by "getMethodTable"
  ;; (api-method-unique-parameter-names-hashed)
  
  ;; Establish mappings for each symbol naming an api-class to/from studly caps strings
  ;;
  ;; Maybe this hash to a different table b/c "Tag" tag :tag 
  ;; (api-string-or-symbol-list-hash-for-object-key-fn
  ;;  (mapcar #'car *api-classes-and-slots*)
  ;;  #'api-class-name-as-studly-caps-string
  ;;  :element-type :symbol)
  ;;
  ;; Establish mappings for each slot of each api-class we define.
  ;; (api-string-or-symbol-list-hash-for-object-key-fn
  ;;  (substitute "url_570xN" "url_570xn"
  ;;              (remove "data_type_values"
  ;;                      (api-class-all-slot-names-unique-as-underscored-strings )
  ;;                      :test #'equal)
  ;;              :test #'equal)
  ;; #'symbol-munger:underscores->keyword
  ;;  :element-type :string)
  ;;
  ;; (cadadr '(api-implicit-class-direct-slot-names-as-underscored-strings 'avatar))

  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'avatar)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'api-method)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'bill-charge)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'billing-overview)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'bill-payment)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'cart)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'cart-listing)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'category)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'country)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'coupon)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'favorite-listing)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'favorite-user)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'featured-treasury)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'feedback)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'feedback-info)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'forum-post)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'ledger)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'ledger-entry)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'listing)
  ;; (substitute "url_570xN" "url_570xn" (api-implicit-class-direct-slot-names-as-underscored-strings 'listing-image) :test #'string=)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'listing-translation)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'order)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'param-list)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'payment)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'payment-template)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'receipt)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'region)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'shipping-info)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'shipping-template)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'shipping-template-entry)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'shop)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'shop-section)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'shop-section-translation)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'shop-translation)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'style)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'tag)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'team)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'transaction)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'treasury)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'treasury-counts)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'treasury-listing)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'treasury-listing-data)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'user)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'user-address)
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'user-profile)
  ;;
  ;; (api-implicit-class-direct-slot-names-as-underscored-strings 'data-type)
  ;; :data-type-values "values"
  ;; "values" :data-type-values
  ;;
  ;; No, we should not try to map this string to/from a symbol
  ;; data-type-values "values" 
  ;; "values" 'data-type-values ' 
  )

(defun dump-api-method-table-json-response ()
  "Write JSON response of getMethodTable to pathname designated by `*api-method-table-json-pathname*'.
Return value of `*api-method-table-json-pathname*' or null if *api-method-table-json-pathname* is not `cl:pathnamep'.
Contents of file written can be read with `set-api-method-table-from-parsed-json-pathname'.
:SEE-ALSO `api-method-unique-parameter-types',
`api-method-find-methods-with-param-type', `get-method-table',  `api-method'.
`api-method-unique-parameter-names', `api-method-unique-parameter-names-hashed-verify-all-keyword-p'."
  (if (pathnamep *api-method-table-json-pathname*)
      (with-open-file (f *api-method-table-json-pathname*
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create)
        (multiple-value-bind (sec min hr date month year) (get-decoded-time)
          (format f ";; last updated ~D/~D/~D | with (write-string (api-call (concatenate 'string *base-url* \"/\")) ~A)~%"
                  year month date (quote *api-method-table-json-pathname*)))
        (write-string (api-call (concatenate 'string *base-url* "/")) f)
        *api-method-table-json-pathname*)
      (values nil (format nil "value of `*api-method-table-json-pathname*' not `cl:pathnamep'"))))

(defun set-api-method-table-from-parsed-json-pathname ()
  "Set value of `*api-method-table*' to object returned by `yason:parse' with
INPUT as file designated by `*api-method-table-json-pathname*'.
:NOTE JSON object _MUST_ begin at second line of INPUT we use the first line as a comment
to indicate when the file was last written.
:SEE-ALSO `dump-api-method-table-json-response'."
  (when (and *api-method-table-json-pathname*
             (pathnamep *api-method-table-json-pathname*)
             (probe-file *api-method-table-json-pathname*))
    (with-open-file (f *api-method-table-json-pathname*
                      :if-does-not-exist :error
                      :element-type 'character
                      :direction :input)
      (let* ((last-updated-string (read-line f))
             (parsed-api-methods (yason:parse f
                                              :object-as :alist
                                              :object-key-fn 'api-string/symbol-lookup))
             (count (assoc :count parsed-api-methods)))
        (values 
         ;; (setf *api-method-table* (sort *api-method-table* #'equal :key #'(lambda (x) (cdr (assoc :type x)))))
         (setf *api-method-table*
               (loop 
                 for method in (cdr (assoc :results parsed-api-methods))
                 collect (nreverse method)))
         count
         last-updated-string)))))


;;; ==============================
;;; Functions for examining the unique slot slot-names of the api-classes 
;;; in lieu of automagically generating defgeneric accessors for each unique slot.
;;; ==============================

(defun %api-class-slot-freqs (seq &key (test #'eql) (key #'identity))
  (declare (cl:sequence seq)
           (cl:type (function (t t) t) test)
           (cl:type (function (t) t) key)
           (optimize (speed 3)))
  (assert (typep seq 'cl:sequence))
  (unless (zerop (length seq))
    (sort
     (reduce #'(lambda (res el)
                 (let ((fi (assoc el res :test test)))
                   (cond (fi
                          (incf (cdr fi))
                          res)
                         ((acons el 1 res)))))
             seq :key key :initial-value nil)
     #'> :key #'cdr)))

(defun api-class-all-slot-names-unique (&key (class-with-class-slot-list *api-classes-and-slots*))
  "Return as cl:values all slot components of the proper-list CLASS-WITH-CLASS-SLOT-LIST.
 - nth-value 0 is a sorted list of symbols (including duplicates) each of which designates a direct slot
   in one or more of the <API-CLASS> classes in car of each element of CLASS-WITH-CLASS-SLOT-LIST
 - nth-value 1 is a sorted list of all direct slots with duplicates removed
 - nth-value 3 is a cons - car is the count of nth-value 0, cdr is the count of nth-value 1
CLASS-WITH-CLASS-SLOT-LIST is a proper list structured as per `*api-classes-and-slots*'. 
:SEE-ALSO `api-class-all-slot-names-unique', `api-class-all-slot-name-stats',
`api-explicit-class-output-defgeneric-forms', `*api-classes-and-slots*'."
  (loop 
    with dups = ()
    for (class slots) in class-with-class-slot-list
    for dup = (loop 
                for slot in slots
                summing (or (and (find slot gthr) 0)
                            (and (push slot dups) 1)))
    summing (length slots) into cnt
    summing dup into dup-cnt
    appending slots into gthr
    finally (return (values (sort gthr #'string<) 
                            (sort dups #'string<)
                            (cons cnt dup-cnt)))))

(defun api-class-all-slot-name-stats (&key (class-with-class-slot-list *api-classes-and-slots*))
  "Return stats for the slot-names of CLASS-WITH-CLASS-SLOT-LIST.
CLASS-WITH-CLASS-SLOT-LIST is a proper list structured as per `*api-classes-and-slots*'.
:SEE-ALSO `api-class-all-slot-names-unique', `api-class-all-slot-name-stats',
`api-explicit-class-output-defgeneric-forms', `*api-classes-and-slots*'."
  (let (all-slots unique-slots slot-counts)
    (multiple-value-bind (all unique counts)
        (api-class-all-slot-names-unique :class-with-class-slot-list class-with-class-slot-list)
      (setf all-slots all
            unique-slots unique 
            slot-counts counts))
    (loop 
      with ht = (make-hash-table)
      with rtn = ()
      for (key . val) in (%api-class-slot-freqs all-slots)
      do (multiple-value-bind (set foundp) (gethash val ht)
           (if foundp
               (if set
                   (pushnew key (gethash val ht))
                   (setf (gethash val ht) (list key)))
               (setf (gethash val ht) (list key))))
      finally (setf rtn (loop
                          for hkey being the hash-keys in ht using (hash-value hval)
                          collect (list :n-slot-names (length hval) 
                                        :occurred-n-times hkey 
                                        :slot-occurrences hval)))
              (return (values rtn
                              (list :unique-slots-count (car slot-counts)
                                    :total-slots-count  (cdr slot-counts)
                                    :unique-slots unique-slots))))))

(defun api-explicit-class-output-defgeneric-forms (&key (class-with-class-slot-list *api-classes-and-slots*)
                                                        (output-stream nil))
  "Output defgeneric forms for accessors of each unique slot in CLASS-WITH-CLASS-SLOT-LIST.
CLASS-WITH-CLASS-SLOT-LIST is a proper list structured as per `*api-classes-and-slots*'.
OUTPUT-STREAM is a valid output stream. 
For each uniqe slot in CLASS-WITH-CLASS-SLOT-LIST output has the format:

 ;; <N> classes: <API-CLASS>*
 (defgeneric <API-CLASS-SLOT> (object))
 (defgeneric (setf <API-CLASS-SLOT>) (<API-CLASS-SLOT> object))

 - <API-CLASS-SLOT> is a symbol designating an accessor for a slot. 
   <API-CLASS-SLOT> is used as the setf argument in the generic function lambda list.
 - <N> is a count of the api-class(es) the <API-CLASS-SLOT> appears in
 - <API-CLASS>* is an enumeration of the <N> api-class(es)

:SEE-ALSO `api-class-all-slot-names-unique', `api-class-all-slot-name-stats',
`api-explicit-class-output-defgeneric-forms', `*api-classes-and-slots*'."
  (declare ((or cl:boolean stream) output-stream)
           (cons class-with-class-slot-list))
  (loop 
    with ht = (make-hash-table)
    for (class  slots) in class-with-class-slot-list       
    do (loop 
         for slot in slots
         do (multiple-value-bind (maybe-class-list foundp) (gethash slot ht)
              (if foundp
                  (if maybe-class-list
                      (pushnew class (gethash slot ht))
                      (setf (gethash slot ht) (list class)))
                  (setf (gethash slot ht) (list class)))))
    finally (let ((*print-case* :downcase))
              (loop 
                for key being the hash-keys in ht using (hash-value val)
                for rev-val = (sort val #'string-lessp)
                collect (list key rev-val) into gthr
                finally (setf gthr (sort gthr #'string-lessp :key #'car))
                        (let ((*print-right-margin* 360))
                          (loop for (srtd-slot  srtd-clss) in gthr
                                do (format output-stream "~%;; ~D classes: ~{~A~^ ~}~%(defgeneric ~S (object))~%(defgeneric (setf ~S) (~S object))~%" 
                                           (length srtd-clss) srtd-clss srtd-slot srtd-slot srtd-slot)))))))

(defun api-method-param-name-as-keyword (api-method-param-name)
  (symbol-munger:underscores->keyword api-method-param-name))

;;; ==============================
;; This variant can be run before the functions of api-request.lisp are in our environment.
;; Should we decide that the function `api-method-unique-parameter-names' as
;; currently defined can not be invoked early enough we could use this instead:
;;
;; (multiple-value-bind (response-body response-code)
;;     (drakma:http-request (concatenate 'string *base-url* "/")
;;                          :parameters (acons "api_key" *api-key* nil))
;;   (unless (eql response-code 200)
;;     (error "early fetch of Etsy api method table failed."))
;;   (loop 
;;     for method in (or (cdr (assoc "results"
;;                                   (yason:parse (flexi-streams:octets-to-string response-body)
;;                                                :object-as :alist)
;;                                   :test #'equal))
;;                       (loop-finish))
;;     for params = (mapcar #'car (cdr (assoc "params" method :test #'equal)))
;;     nconcing params into gthr
;;     finally (return (sort (delete-duplicates gthr :test #'equal)  #'string<))))
;; (api-method-unique-parameter-names)
(defun api-method-unique-parameter-names (method-table) ;; *api-method-table* (get-method-table)
  "Return all unique paramter names for each api-method returned by Etsy API method \"getMethodTable\"."
  (loop 
    ;; This version can be run after the functions of api-request.lisp are in our environment.
    for method in (or method-table
                      (parsed-api-call (concatenate 'string *base-url* "/") 
                                       :object-as :alist
                                       :object-key-fn #'api-string/symbol-lookup))
    for params = (mapcar #'car (cdr (assoc :params method)))
    nconcing params into gthr
    finally (return (sort (remove-if-not #'stringp (delete-duplicates gthr :test #'equal)) #'string>))))

;; (clrhash *api-response-string-symbol-hash-for-object-key-fn*)
;; (api-method-unique-parameter-names-hashed)
(defun api-method-unique-parameter-names-hashed (&key (hash-table *api-response-string-symbol-hash-for-object-key-fn*))
  (let ((maybe-method-string-list (api-method-unique-parameter-names))
        (start-hash-count  (hash-table-count hash-table)))
    (if maybe-method-string-list
        (api-string-or-symbol-list-hash-for-object-key-fn maybe-method-string-list
                                                          #'api-method-param-name-as-keyword
                                                          :hash-table hash-table
                                                          :element-type :string)
        (values start-hash-count start-hash-count))))

;; can call after api-request.lisp
(defun api-method-unique-parameter-types (method-table) ;; *api-method-table* (get-method-table)
  "Return a list of all unique parameter types returned by the equivalent of \"getMethodTable\".
:EXAMPLE
 \(api-method-unique-parameter-types *api-method-table*\)"
  (loop 
    for method in (or method-table
                      (parsed-api-call (concatenate 'string *base-url* "/") 
                                       :object-as :alist
                                       :object-key-fn #'api-string/symbol-lookup))
    for verify-params =  (loop 
                           for (param . type) in (cdr (assoc :params method))
                           ;; unless (keywordp param)
                           ;; collect (cons method param))
                           collect type)
    nconcing verify-params into gthr
    finally (return (sort (delete-duplicates gthr :test #'string=) #'string<))))

(defun api-method-find-methods-with-param-type (method-table param-type) ; *api-method-table* (get-method-table)
   "Return a list of all Etsy API api-method's in METHOD-TABLE with type PARAM-TYPE.
:EXAMPLE
 \(api-method-find-methods-with-param-type \(get-method-table\) \"boolean\"\)"
  (loop 
    for method in method-table
    for verify-params =  (loop 
                           for (param . type) in (cdr (assoc :params method))
                           when (equal type param-type)
                           collect param into bool-params
                           finally (when bool-params 
                                     (return (list* (cdr (assoc :name method)) (sort bool-params #'string<)))))
    when verify-params
    collecting it into gthr 
    finally (return (sort gthr #'string< :key #'car))))


;; Sanity
(defun api-method-unique-parameter-names-hashed-verify-all-keyword-p (method-table) ;; *api-method-table* (get-method-table)
  ;; Return as cl:values.
  ;; nth-value 0 is T if `api-method-unique-parameter-names-hashed' processed every unique parameter name as a keyword.
  ;; nth-value 1 is null when nth-value 1 is T otherwise it is a list of consed pairs each cons has the form:
  ;;  ( <API-METHOD-NAME> . <PARAM-NAME> )
  ;; api-method-name and param-name are strings designating the camel-cased Etsy
  ;; API method name and the parameter name of that method which we failed to
  ;; hash as a string/keyword keyword/string pair.
  (loop 
    for method in (or method-table ;; (get-method-table) *api-method-table*
                      (parsed-api-call (concatenate 'string *base-url* "/") 
                                       :object-as :alist
                                       :object-key-fn #'api-string/symbol-lookup))
    for verify-params =  (loop 
                           for (param . type) in (cdr (assoc :params method))
                           unless (keywordp param)
                           collect (cons method param))
    collect verify-params into gthr
    finally (setf gthr (remove-if #'null gthr))
            (return (values (null gthr)
                            gthr))))
                                                        

#|

 - The 109 unique api-method parameter names returned  on 2012-07-24:

  (loop 
    for method in (parsed-api-call (concatenate 'string *base-url* "/") 
                                   :object-as :alist
                                   :object-key-fn #'api-string/symbol-lookup)
    for params = (mapcar #'car (cdr (assoc :params method)))
    nconcing params into gthr
    finally (return (sort (delete-duplicates gthr :test #'equal) #'string<)))

 (:alchemy-message :allow-cc :allow-check :allow-mo :allow-other :allow-paypal
  :announcement :cart-id :category :category-id :city :color :color-accuracy
  :country-id :coupon-code :coupon-id :data-version :description
  :destination-country-id :destination-region-id :distance-max :domestic-only
  :featured-treasury-id :first-line :free-shipping :geo-level :image
  :is-refusing-alchemy :is-supply :keywords :language :lat :limit :listing-id
  :listing-ids :listing-image-id :location :lon :materials :max-created
  :max-price :message :message-from-buyer :message-from-seller
  :message-to-seller :min-created :min-price :name :occasion :offset :order-id
  :origin-country-id :owner-id :page :payment-adjustment-id
  :payment-adjustment-item-id :payment-id :payment-template-id :paypal-email
  :pct-discount :policy-additional :policy-payment :policy-refunds
  :policy-seller-info :policy-shipping :policy-welcome :price :primary-cost
  :private :quantity :rank :receipt-id :recipient :region :region-id :renew
  :sale-message :second-line :secondary-cost :seller-active :shipping-info-id
  :shipping-template-entry-id :shipping-template-id :shop-id :shop-name
  :shop-section-id :sort-on :sort-order :src :state :status :style :subsubtag
  :subtag :tag :tags :target-user-id :team-id :team-ids :title :transaction-id
  :treasury-key :user-address-id :user-id :was-paid :was-shipped :when-made
  :who-made :zip))

 ("alchemy_message" "allow_cc" "allow_check" "allow_mo" "allow_other"
  "allow_paypal" "announcement" "cart_id" "category" "category_id" "city"
  "color" "color_accuracy" "country_id" "coupon_code" "coupon_id" "data_version"
  "description" "destination_country_id" "destination_region_id" "distance_max"
  "domestic_only" "featured_treasury_id" "first_line" "free_shipping"
  "geo_level" "image" "is_refusing_alchemy" "is_supply" "keywords" "language"
  "lat" "limit" "listing_id" "listing_ids" "listing_image_id" "location" "lon"
  "materials" "max_created" "max_price" "message" "message_from_buyer"
  "message_from_seller" "message_to_seller" "min_created" "min_price" "name"
  "occasion" "offset" "order_id" "origin_country_id" "owner_id" "page"
  "payment_adjustment_id" "payment_adjustment_item_id" "payment_id"
  "payment_template_id" "paypal_email" "pct_discount" "policy_additional"
  "policy_payment" "policy_refunds" "policy_seller_info" "policy_shipping"
  "policy_welcome" "price" "primary_cost" "private" "quantity" "rank"
  "receipt_id" "recipient" "region" "region_id" "renew" "sale_message"
  "second_line" "secondary_cost" "seller_active" "shipping_info_id"
  "shipping_template_entry_id" "shipping_template_id" "shop_id" "shop_name"
  "shop_section_id" "sort_on" "sort_order" "src" "state" "status" "style"
  "subsubtag" "subtag" "tag" "tags" "target_user_id" "team_id" "team_ids"
  "title" "transaction_id" "treasury_key" "user_address_id" "user_id" "was_paid"
  "was_shipped" "when_made" "who_made" "zip")

|#


;;; ==============================
;;; EOF
