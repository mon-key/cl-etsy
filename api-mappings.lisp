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
:SEE-ALSO `api-class-slot-names-as-underscored-strings', `api-class-name-as-studly-caps-string'
`api-class-slot-name-as-lispy-string'."
  (symbol-munger:lisp->underscores api-class-slot-name))

(defun %each-a-string-p (string-list)
  (every #'(lambda (x) (and (stringp x) 
                            (not (zerop (length x)))))
         string-list))

(defun %each-a-symbol-p (symbol-list)
  (every #'(lambda (sym) (and (symbolp t) 
                              (not (typep sym 'boolean))))
             symbol-list))

(defun api-string-or-symbol-list-hash-for-object-key-fn (string-or-symbol-list munging-function 
                                                         &key (hash-table *api-response-string-symbol-hash-for-object-key-fn*)
                                                              element-type)
  "STRING-OR-SYMBOL-LIST is a proper list with every element of type string or symbol but not both.
MUNGING-FUNCTION is a function designator for a function wich accepts a
single argument a string or symbol and returns a symbol or string equivalent.
HASH-TABLE is a hash-table to cache symbol/string and string/symbol mappings generated with MUNGING-FUNCTION.
Default is value of `*api-response-string-symbol-hash-for-object-key-fn*'.
Keyword ELEMENT-TYPE designates whether every element of is a string or symbol.
Valid argumetns are one of :string or :symbol
When STRING-OR-SYMBOL is :symbol the elements of STRING-OR-SYMBOL-LIST must not contain the symbol T or nil.
When STRING-OR-SYMBOL is :string the elements of STRING-OR-SYMBOL-LIST must not contain the empty string.
:SEE-ALSO "
  (declare ((or (eql :string) (eql :symbol)) element-type))
  (ecase element-type
    ;; (null (error ":FUNCTION `api-string-or-symbol-list-hash-for-object-key-fn'~% ~
    ;;                -- argument to keyword ELEMENT-TYPE was null but must be either :string or :symbol"))
    (:string 
     (assert (%each-a-string-p string-or-symbol-list)))
    (:symbol
     (assert (%each-a-symbol-p string-or-symbol-list))))
  (loop 
    for api-string-or-symbol in string-or-symbol-list
    for munged = (funcall munging-function api-string-or-symbol)
    do (multiple-value-bind (val foundp) (gethash api-string-or-symbol hash-table)
         (unless (and val foundp)
           (setf (gethash api-string-or-symbol hash-table)
                 munged)))
       (multiple-value-bind (val foundp) (gethash munged hash-table)
         (unless (and val foundp)
           (setf (gethash munged hash-table)
                 api-string-or-symbol)))))


;;; ==============================
;;; Functions for introspecting and subsequently munging around the direct-slot
;;; slot-names and initargs of an API class.
;;; ==============================

(defun ensure-api-class-finalized (api-class)
  ;; By default cl:find-class errors when class does not exist.
  (let ((found-class (find-class api-class)))
    (if (closer-mop:class-finalized-p found-class)
        found-class
        (closer-mop:ensure-finalized found-class))))

(defun api-class-direct-slot-definition-names (api-class)
  "API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of symbols designating the slot-names of the direct-slot of API-CLASS.
:EXAMPLE
 \(api-class-direct-slot-definition-names 'api-method\)"
  (map 'list #'closer-mop:slot-definition-name
       (closer-mop:class-direct-slots (ensure-api-class-finalized api-class))))

;; (cadr (assoc 'api-method *api-classes-and-slots*))
;; (api-class-direct-slot-definition-names 'api-method)
(loop 
  for api-class in (mapcar #'car *api-classes-and-slots*)
  for direct-slots = (api-class-direct-slot-definition-names api-class)
  for hardwired = (cadr (assoc api-class *api-classes-and-slots*))
  for set-diff = (set-difference direct-slots hardwired)
  collect (list api-class :difference set-diff))

;; (set-difference (api-class-direct-slot-definition-names 'api-method)
;;                 (cadr (assoc 'api-method *api-classes-and-slots*))
;;                 )

(defun api-class-direct-slot-definition-initarg-names (api-class)
"API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of initargs (keywords) for the direct slots of API-CLASS.
If a direct-slot of API-CLASS does not have an initarg the corresponding
element of the list is null.
:EXAMPLE
 \(api-class-direct-slot-definition-initarg-names 'api-method\)"
  (flet ((slot-init-arg-name (direct-slot)
           (car (closer-mop:slot-definition-initargs direct-slot))))
    (map 'list #'slot-init-arg-name
         (closer-mop:class-direct-slots (ensure-api-class-finalized api-class)))))

(defun api-class-direct-slot-definition-name-and-initarg (api-class)
  "API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of conses of the form:
 (<SLOT-NAME> . <INITARG-NAME-OR-NULL>)
 - <SLOT-NAME> is a symbol designating the slot-name (a symbol) of a direct-slot of API-CLASS
 - <INITARG-NAME-OR-NULL> is either an initarg (a keyword) of a direct-slot of
   API-CLASS or null if the direct-slot does not have an initarg.
:EXAMPLE
 \(api-class-direct-slot-definition-name-and-initarg 'api-method\)"
  (flet ((slot-name-and-init (direct-slot)
           (cons (closer-mop:slot-definition-name direct-slot)
                 (car (closer-mop:slot-definition-initargs direct-slot)))))
    (map 'list #'slot-name-and-init
         (closer-mop:class-direct-slots (ensure-api-class-finalized api-class)))))

(defun api-class-direct-slot-definition-name-as-underscored-string-and-initarg (api-class)
  "API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of conses of the form:
 (<SLOT-NAME-AS-UNDERSCORED-STRING> . <INITARG-NAME-OR-NULL>)
 - <SLOT-NAME-AS-UNDERSCORED-STRING> is a string as per `api-class-slot-names-as-underscored-string'.
 - <INITARG-NAME-OR-NULL> is either an initarg (a keyword) of a direct-slot of
   API-CLASS or null if the direct-slot does not have an initarg.
:EXAMPLE
\(api-class-direct-slot-definition-name-as-underscored-string-and-initarg 'api-method\)"
  (flet ((slot-name-and-init (direct-slot)
           (cons (api-class-slot-name-as-underscored-string (closer-mop:slot-definition-name direct-slot))
                 (car (closer-mop:slot-definition-initargs direct-slot)))))
    (map 'list #'slot-name-and-init
         (closer-mop:class-direct-slots (ensure-api-class-finalized api-class)))))

(defun api-class-slot-names-as-lispy-strings (api-class)
"Return a list strings as if by `api-class-slot-name-as-lispy-string'.
Each element of list is the string name of a direct-slot slot-name of API-CLASS.
API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
:EXAMPLE
 (api-class-slot-names-as-lispy-strings 'api-method)"
  (map 'list #'api-class-slot-name-as-lispy-string
       (api-class-direct-slot-definition-names api-class)))

(defun api-class-slot-names-as-underscored-strings (api-class)
  "Return a list strings as if by `api-class-slot-names-as-underscored-string'.
Each element of the list corresponds with a direct-slot slot-name of API-CLASS.
API-CLASS is a symbol designating a class modeling aspects of an Etsy API representation.
Return a list of conses of the form:
:EXAMPLE
 \(api-class-slot-names-as-underscored-strings 'api-method\)"
  (map 'list #'api-class-slot-name-as-underscored-string
       (api-class-direct-slot-definition-names api-class)))

;;; :TODO Might this be better named `api-symbol/string-lookup'?
(defun api-response-string-to-symbol-lookup (string)
  (or (gethash string *api-response-string-symbol-hash-for-object-key-fn*)
      string))

;; (clrhash *api-response-string-symbol-hash-for-object-key-fn*)

;; (gethash "pagination" *api-response-string-symbol-hash-for-object-key-fn*)

;; :NOTE Once we start evaluating #'api-class-slot-names-as-underscored-strings
;; any of the following forms which invoke `ensure-api-class-finalized' must to
;; come _after_ the files of ASDF the api-class component.
;; We can't reasonably finalize an api-class prior to the establishing a
;; defclass form for the class!
(eval-when (:compile-toplevel :load-toplevel :execute)
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

  ;; Establish mappings for each symbols naming an api-class to/from studly caps strings
  ;; Maybe this hash to a different table b/c "Tag" tag :tag 
  ;; (api-string-or-symbol-list-hash-for-object-key-fn
  ;;  (mapcar #'car *api-classes-and-slots*)
  ;;  #'api-class-name-as-studly-caps-string
  ;;  :element-type :symbol)

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
         
  ;; (cadadr '(api-class-slot-names-as-underscored-strings 'avatar))

  ;; (api-class-slot-names-as-underscored-strings 'avatar)
  ;; (api-class-slot-names-as-underscored-strings 'api-method)
  ;; (api-class-slot-names-as-underscored-strings 'bill-charge)
  ;; (api-class-slot-names-as-underscored-strings 'billing-overview)
  ;; (api-class-slot-names-as-underscored-strings 'bill-payment)
  ;; (api-class-slot-names-as-underscored-strings 'cart)
  ;; (api-class-slot-names-as-underscored-strings 'cart-listing)
  ;; (api-class-slot-names-as-underscored-strings 'category)
  ;; (api-class-slot-names-as-underscored-strings 'country)
  ;; (api-class-slot-names-as-underscored-strings 'coupon)
  ;; (api-class-slot-names-as-underscored-strings 'favorite-listing)
  ;; (api-class-slot-names-as-underscored-strings 'favorite-user)
  ;; (api-class-slot-names-as-underscored-strings 'featured-treasury)
  ;; (api-class-slot-names-as-underscored-strings 'feedback)
  ;; (api-class-slot-names-as-underscored-strings 'feedback-info)
  ;; (api-class-slot-names-as-underscored-strings 'forum-post)
  ;; (api-class-slot-names-as-underscored-strings 'ledger)
  ;; (api-class-slot-names-as-underscored-strings 'ledger-entry)
  ;; (api-class-slot-names-as-underscored-strings 'listing)
  ;; (substitute "url_570xN" "url_570xn" (api-class-slot-names-as-underscored-strings 'listing-image) :test #'string=)
  ;; (api-class-slot-names-as-underscored-strings 'listing-translation)
  ;; (api-class-slot-names-as-underscored-strings 'order)
  ;; (api-class-slot-names-as-underscored-strings 'param-list)
  ;; (api-class-slot-names-as-underscored-strings 'payment)
  ;; (api-class-slot-names-as-underscored-strings 'payment-template)
  ;; (api-class-slot-names-as-underscored-strings 'receipt)
  ;; (api-class-slot-names-as-underscored-strings 'region)
  ;; (api-class-slot-names-as-underscored-strings 'shipping-info)
  ;; (api-class-slot-names-as-underscored-strings 'shipping-template)
  ;; (api-class-slot-names-as-underscored-strings 'shipping-template-entry)
  ;; (api-class-slot-names-as-underscored-strings 'shop)
  ;; (api-class-slot-names-as-underscored-strings 'shop-section)
  ;; (api-class-slot-names-as-underscored-strings 'shop-section-translation)
  ;; (api-class-slot-names-as-underscored-strings 'shop-translation)
  ;; (api-class-slot-names-as-underscored-strings 'style)
  ;; (api-class-slot-names-as-underscored-strings 'tag)
  ;; (api-class-slot-names-as-underscored-strings 'team)
  ;; (api-class-slot-names-as-underscored-strings 'transaction)
  ;; (api-class-slot-names-as-underscored-strings 'treasury)
  ;; (api-class-slot-names-as-underscored-strings 'treasury-counts)
  ;; (api-class-slot-names-as-underscored-strings 'treasury-listing)
  ;; (api-class-slot-names-as-underscored-strings 'treasury-listing-data)
  ;; (api-class-slot-names-as-underscored-strings 'user)
  ;; (api-class-slot-names-as-underscored-strings 'user-address)
  ;; (api-class-slot-names-as-underscored-strings 'user-profile)
  ;;
  ;; (api-class-slot-names-as-underscored-strings 'data-type)
  ;; :data-type-values "values"
  ;; "values" :data-type-values
  ;;
  ;; No, we should not try to map this string to/from a symbol
  ;; data-type-values "values" 
  ;; "values" 'data-type-values ' 
  )


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

(defun api-class-all-direct-slots (&key (class-with-class-slot-list *api-classes-and-slots*))
  "Return as cl:values all slot components of the proper-list CLASS-WITH-CLASS-SLOT-LIST.
 - nth-value 0 is a sorted list of symbols (including duplicates) each of which designates a direct slot
   in one or more of the <API-CLASS> classes in car of each element of CLASS-WITH-CLASS-SLOT-LIST
 - nth-value 1 is a sorted list of all direct slots with duplicates removed
 - nth-value 3 is a cons - car is the count of nth-value 0, cdr is the count of nth-value 1
CLASS-WITH-CLASS-SLOT-LIST is a proper list structured as per `*api-classes-and-slots*'. 
:SEE-ALSO `api-class-all-direct-slots', `api-class-all-direct-slot-name-stats',
`api-class-output-defgeneric-forms', `*api-classes-and-slots*'."
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

(defun api-class-all-direct-slot-name-stats (&key (class-with-class-slot-list *api-classes-and-slots*))
  "Return stats for the slot-names of CLASS-WITH-CLASS-SLOT-LIST.
CLASS-WITH-CLASS-SLOT-LIST is a proper list structured as per `*api-classes-and-slots*'.
:SEE-ALSO `api-class-all-direct-slots', `api-class-all-direct-slot-name-stats',
`api-class-output-defgeneric-forms', `*api-classes-and-slots*'."
  (let (all-slots unique-slots slot-counts)
    (multiple-value-bind (all unique counts)
        (api-class-all-direct-slots :class-with-class-slot-list class-with-class-slot-list)
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


(defun api-class-output-defgeneric-forms (&key (class-with-class-slot-list *api-classes-and-slots*)
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

:SEE-ALSO `api-class-all-direct-slots', `api-class-all-direct-slot-name-stats',
`api-class-output-defgeneric-forms', `*api-classes-and-slots*'."
  (declare ((or boolean stream) output-stream)
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


;;; ==============================
;;; EOF
