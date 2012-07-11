;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-style-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/style')

----
API-METHODS

"findSuggestedStyles"

|#

(in-package #:cl-etsy)

;; Style
(defclass style (base-etsy)
  (;; style_id
   (style-id
    :initarg :style-id
    :accessor style-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Style ID for this style.")

   (style
    :initarg :style
    :accessor style
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Style name for this style."))

     ;; (:default-initargs
     ;;  :style-id nil :style nil)

  (:documentation "A user-supplied style attached to a listing.
A user may either select from suggested styles, or create a custom style.
 (URL `http://www.etsy.com/developers/documentation/reference/style')"))


;;; ==============================
;;; EOF
