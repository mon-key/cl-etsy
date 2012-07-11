;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-forum-post-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/forumpost')

----
API-METHODS

"findTreasuryComments"
"postTreasuryComment"
"deleteTreasuryComment"

|#

(in-package #:cl-etsy)


;; ForumPost
(defclass forum-post (base-etsy)
  (;; thread_id
   (thread-id
    :initarg :thread-id
    :accessor thread-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Unique identifier of the thread.")

   ;; post_id
   (post-id
    :initarg :post-id
    :accessor post-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Id of the individual post.")

   (post
    :initarg :post
    :accessor post
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The content of the post.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "Id of the user who created the post.")

   ;; last_edit_time
   (last-edit-time
    :initarg :last-edit-time
    :accessor last-edit-time
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "When the post was last edited.")

   ;; create_date
   (create-date
    :initarg :create-date
    :accessor create-date
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "When the post was created."))

  ;; (:default-initargs 
  ;;  :thread-id nil :post-id nil :post nil :user-id nil :last-edit-time nil :create-date nil)

  (:documentation "A post from the forums.
 (URL `http://www.etsy.com/developers/documentation/reference/forumpost')"))


;;; ==============================
;;; EOF