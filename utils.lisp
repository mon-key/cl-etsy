;;; :FILE-CREATED <Timestamp: #{2012-07-20T18:48:21-04:00Z}#{12295} - by MON>
;;; :FILE #P"cl-etsy/utils.lisp"
;;; ==============================

(in-package #:cl-etsy)

(deftype api-request-offset-range ()
  "The valid integer range for the OFFSET parameter of an Etsy API call.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')"
  '(mod 50001))

(deftype api-request-limit-range ()
"The valid integer range for the LIMIT parameter of an Etsy API call.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')"
  '(integer 1 100))

(deftype api-request-page-range ()
"The valid integer range for the PAGE parameter of an Etsy API call.
:SEE (URL `http://www.etsy.com/developers/documentation/getting_started/api_basics#section_pagination')"
  '(integer 1 2001))

(deftype parsed-object-type ()
  "The valid parameter values for yason :object-as keywords 
`yason:*parse-object-as*'"
  '(member :hash-table :plist :alist))

(deftype int ()
  'integer)

(deftype int-or-string ()
  '(or string int))

;; (and (typep "88" 'int-or-int-string) (null (typep "88.0" 'int-or-int-string )))
(deftype int-or-int-string ()
  '(or int (satisfies int-string-p)))

(deftype region ()
  "An Etsy region type which the API docs define thusly:
 \"region
  An ISO 3166-1 alpha 2 country code.
  Currently supported values: US, CA, AU, GB, DE, FR, NL\"
For the sake of completeness we define all ISO-3166-1 ALPHA-2 codes.
:EXAMPLE
 \(typep \"us\" 'region\)
 \(typep \"US\" 'region\)"
  '(satisfies iso-3166-1-alpha-2-code-p))

(deftype currency ()
  "An Etsy currency type which the API docs define thusly:
 \"currency
  A 3-letter ISO 4217 code.\"
:EXAMPLE
 \(typep \"USD\" 'currency\)
 \(null \(typep \"usd\" 'currency\)\)"
  '(satisfies iso-4217-code-p))

(deftype language ()
  "An Etsy currency type which the API docs define thusly:
 \"language
  An IETF language code.
  Currently supported values: en, de, fr\"
 :EXAMPLE
 \(typep \"us\" 'language\)
 \(null \(typep \"US\" 'language\)\)"
  '(satisfies language-code-p))

(defun language-code-p (maybe-language-code)
  (and (stringp maybe-language-code)
       (eql (length maybe-language-code) 2)
       (or (string= maybe-language-code "en")
           (string= maybe-language-code "de")
           (string= maybe-language-code "fr"))
       t))

(defun iso-3166-1-alpha-2-code-p (maybe-iso-code)
  "Whether MAYBE-ISO-CODE is a string present as hashtable key of *iso-3166-1-alpha-2-codes*.
:EXAMPLE
 \(and \(iso-3166-1-alpha-2-code-p \"US\"\)
      \(null \(iso-3166-1-alpha-2-code-p \"us\"\)\)
      \(null \(iso-3166-1-alpha-2-code-p 42\)\)\)"
  (and (stringp maybe-iso-code)
       (eql (length maybe-iso-code) 2)
       (gethash maybe-iso-code *iso-3166-1-alpha-2-codes*)
       t))

(defun iso-4217-code-p (maybe-iso-code)
  "Whether MAYBE-ISO-CODE is a string present as hashtable key of *iso-4217-codes*
:EXAMPLE
 \(and \(iso-4217-code-p \"USD\"\)
      \(null \(iso-3166-1-alpha-2-code-p \"usd\"\)\)
      \(null \(iso-3166-1-alpha-2-code-p 42\)\)\)"
  (and (stringp maybe-iso-code)
       (eql (length maybe-iso-code) 2)
       (gethash maybe-iso-code *iso-4217-codes*)
       t))

;; (and (int-string-p "88") (null (int-string-p "88.0")))
(defun int-string-p (maybe-int-string)
  (and (stringp maybe-int-string)
       (not (zerop (length maybe-int-string)))
       (every #'digit-char-p maybe-int-string)
       t))

(defun int-or-int-string-p (maybe-int-or-int-string)
  (typep maybe-int-or-int-string 'int-or-int-string))

(defun int-to-int-string (int &optional stream)
  (declare (int int))
  (check-type int int)
  (if stream
      (princ int stream)
      (princ-to-string int)))

(defun int-string-to-int (int-string)
  (assert (int-string-p int-string))
  (parse-integer int-string :radix 10))

;; (and (ensure-int "42") (ensure-int 42))
(defun ensure-int (int-or-int-string)
  (declare (int-or-int-string int-or-int-string))
  (check-type int-or-int-string int-or-int-string)
  (if (typep int-or-int-string 'int) 
      int-or-int-string
      (int-string-to-int int-or-int-string)))

(defun ensure-int-string (int-or-int-string)
  (declare (int-or-int-string int-or-int-string))
  (check-type int-or-int-string int-or-int-string)
  (if (stringp int-or-int-string)
      int-or-int-string
      (int-to-int-string int-or-int-string)))

;; (split-uri-component-on-embedded-parameter "/shops/:shop_id/sections/:shop_section_id/listings/active")
;; (split-uri-component-on-embedded-parameter "/shops/sections/listings/active")
(defun split-uri-component-on-embedded-parameter (uri-component)
  (declare (string uri-component))
  (flet ((char-colonp (x)
           (declare (character x))
           (char= x #\:)))
    (values
     (and (some #'char-colonp uri-component)
          (loop 
            for component in (split-sequence:split-sequence  #\/ uri-component :remove-empty-subseqs t)
            collect (if (char= (char component 0) #\:)
                        (string-upcase (symbol-munger:underscores->lisp-name (subseq component 1)))
                        component)))
     uri-component)))

(defun api-method-public-p (api-method-alist)
  (equal (cdr (assoc :visibility api-method-alist)) "public"))

(defun api-method-name-to-lisp-name (api-method-alist)
  (symbol-munger:camel-case->lisp-name 
   (cdr (assoc :name api-method-alist))))

(defun id-or-name-for-etsy (int-or-string)
  "Convert int-or-string (an int or string) to an Etsy representation."
  (declare (int-or-string int-or-string))
  (check-type int-or-string int-or-string)
  (if (stringp int-or-string)
      int-or-string
      (int-to-int-string int-or-string)))

(defun array-id-or-name-for-etsy (seq-of-id-or-names)
  "Convert SEQ-OF-ID-OR-NAMES to an Etsy array(id-or-name) representation.
Intersperse each element of SEQ-OF-ID-OR-NAMES with a #\\, converting any
positive integer values to their string equivalent.
:EXAMPLE
 \(array-id-or-name-for-etsy  \(list \"id-a\" 1 \"id-b\" 10 \"id-c\" 100\)\)
The Etsy API defines an array thusly:
 \"array\(type\)
  A list of values, separated by commas \(#\\,\).
  Do not include parentheses or brackets. 
  Each value must be a valid instance of <TYPE>.\"
Relavant for (at least) the following Etsy parameter types:
 array(string)
 array(int)
 array(shop_id_or_name)
 array(team_id_or_name)
 array(user_id_or_name)
"
  (declare (list seq-of-id-or-names))
  (unless (null seq-of-id-or-names)
    (loop 
      for int-or-int-string in seq-of-id-or-names
      for ensured = (id-or-name-for-etsy int-or-int-string)
      collect ensured into gthr
      finally (return (format nil "~{~A~^,~}" gthr)))))


;;; ==============================
;;; EOF
