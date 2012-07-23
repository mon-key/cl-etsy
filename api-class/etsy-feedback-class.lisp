;;; :FILE-CREATED <Timestamp: #{2012-07-10T12:36:30-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-feedback-class.lisp
;;; ==============================

#|
 (URL `http://www.etsy.com/developers/documentation/reference/feedbackinfo')

----
API-ASSOCIATIONS


:association Buyer
:visibility public/private
:perm-scope feedback_r
:type User
:documentation "The user who who was the buyer in this transaction. Note: This field may be absent, depending on the buyer's privacy settings."

:association Seller
:visibility public/private
:perm-scope feedback_r
:type User
:documentation "The user who was the seller in this transaction."

:association Author
:visibility public/private
:perm-scope feedback_r
:type User
:documentation "The user who wrote this feedback. Note: This field may be absent, depending on the buyer's privacy settings."

:association Subject
:visibility public/private
:perm-scope feedback_r
:type User
:documentation "The user who received this feedback. Note: This field may be absent, depending on the buyer's privacy settings."

:association Transaction
:visibility public/private
:perm-scope feedback_r
:type Transaction
:documentation "The transaction that this feedback pertains to."

:association Listing
:visibility public/private
:perm-scope feedback_r
:type Listing
:documentation "The listing that this feedback pertains to. "

----
Methods
"findAllUserFeedbackAsAuthor"
"findAllUserFeedbackAsBuyer"
"findAllUserFeedbackAsSeller"
"findAllUserFeedbackAsSubject'
"findAllFeedbackFromBuyers"
"findAllFeedbackFromSellers"

----
 (closer-mop:class-finalized-p (find-class 'feedback))
 (api-class-slot-names-as-underscored-strings 'feedback)

|#
(in-package #:cl-etsy)


;; Feedback
(defclass feedback (base-etsy)
  (;; feedback_id
   (feedback-id
    :initarg :feedback-id
    :accessor :feedback-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The feedback record's numeric ID.")

   ;; transaction_id
   (transaction-id
    :initarg :transaction-id
    :accessor transaction-id
    ;; :visibility public/private
    ;; :perm-scope feedback_r
    ;; :type int
    :documentation "The transaction's numeric ID.")

   ;; creator_user_id
   (creator-user-id
    :initarg :creator-user-id
    :accessor creator-user-id
    ;; :visibility public/private
    ;; :perm-scope feedback_r
    ;; :type int
    :documentation "The numeric ID of the user who wrote this feedback.
Note: This field may be absent, depending on the buyer's privacy settings.")

   ;; target_user_id
   (target-user-id
    :initarg :target-user-id
    :accessor target-user-id
    ;; :visibility public/private
    ;; :perm-scope feedback_r
    ;; :type int
    :documentation "The numeric ID of the user who received this feedback.
Note: This field may be absent, depending on the buyer's privacy settings.")

   ;; seller_user_id
   (seller-user-id
    :initarg :seller-user-id
    :accessor seller-user-id
    ;; :visibility public/private
    ;; :perm-scope feedback_r
    ;; :type int
    :documentation "The numeric ID of the user who was the seller in this transaction.")

   ;; buyer_user_id
   (buyer-user-id
    :initarg :buyer-user-id
    :accessor buyer-user-id
    ;; :visibility public/private
    ;; :perm-scope feedback_r
    ;; :type int
    :documentation "The numeric ID of the user who was the buyer in this transaction.
Note: This field may be absent, depending on the buyer's privacy settings.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "Creation time, in epoch seconds.")

   (message
    :initarg :message
    :accessor message
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "A message left by the author, explaining the feedback.")

   (value
    :initarg :value
    :accessor value
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The feedback's value; 1 is positive, -1 is negative, and 0 is neutral.")

   ;; image_feedback_id
   (image-feedback-id
    :initarg :image-feedback-id
    :accessor image-feedback-id
    ;; :visibility public/private
    ;; :perm-scope feedback_r
    ;; :type int
    :documentation "The numeric ID of the feedback's image (if present).
Note: This field may be absent, depending on the buyer's privacy settings.")

   ;; image_url_25x25
   (image-url-25x25
    :initarg :image-url-25x25
    :accessor image-url-25x25
    ;; :visibility public/private
    ;; :perm-scope feedback_r
    ;; :type string
    :documentation "The url to a photo provided with the feedback, dimensions 25x25.
Note: This field may be absent, depending on the buyer's privacy settings.")

   ;; image_url_155x125
   (image-url-155x125
    :initarg :image-url-155x125
    :accessor image-url-155x125
    ;; :visibility public/private
    ;; :perm-scope feedback_r
    ;; :type string
    :documentation "The url to a photo provided with the feedback, dimensions 155x125.
Note: This field may be absent, depending on the buyer's privacy settings.")

   ;; image_url_fullxfull
   (image-url-fullxfull
    :initarg :image-url-fullxfull
    :accessor image-url-fullxfull
    ;; :visibility public/private
    ;; :perm-scope feedback_r
    ;; :type string
    :documentation "The url to a photo provided with the feedback, dimensions fullxfull.
Note: This field may be absent, depending on the buyer's privacy settings."))
  
  ;; (:default-initargs :feedback-id nil :transaction-id nil :creator-user-id nil
  ;; :target-user-id nil :seller-user-id nil :buyer-user-id nil
  ;; :creation-tsz nil :message nil :value nil :image-feedback-id nil
  ;; :image-url-25x25 nil :image-url-155x125 nil :image-url-fullxfull nil)

  (:documentation "Etsy allows buyers and sellers to leave feedback for one another about a specific transaction.
Each feedback record contains a short message from the buyer or seller, a value
of -1, 0 or 1, and information about the item that was purchased.
Each feedback record has a buyer, a seller, an author, and a subject.
Because feedback is a two-way process, each transaction on Etsy can have up to
two feedback records, one left by a buyer in reference to a seller, and one left
by a seller in reference to a buyer. To determine the context of a feedback
record, you will neeed to examine both the creator_user_id and seller_user_id
fields to determine whether the author of the feedback was the buyer or the
seller in the transaction.
 (URL `http://www.etsy.com/developers/documentation/reference/feedbackinfo')"))


#|

 ((:NAME        . "findAllUserFeedbackAsAuthor")
  (:DESCRIPTION . "Retrieves a set of Feedback objects associated to a User.")
  (:URI         . "/users/:user_id/feedback/as-author")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Feedback")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllUserFeedbackAsBuyer")
  (:DESCRIPTION . "Retrieves a set of Feedback objects associated to a User.")
  (:URI         . "/users/:user_id/feedback/as-buyer")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Feedback")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllUserFeedbackAsSeller")
  (:DESCRIPTION . "Retrieves a set of Feedback objects associated to a User.")
  (:URI         . "/users/:user_id/feedback/as-seller")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Feedback")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllUserFeedbackAsSubject")
  (:DESCRIPTION . "Retrieves a set of Feedback objects associated to a User.")
  (:URI         . "/users/:user_id/feedback/as-subject")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Feedback")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllFeedbackFromBuyers")
  (:DESCRIPTION . "Returns a set of FeedBack objects associated to a User.
                       This is essentially the union between the findAllUserFeedbackAsBuyer
                       and findAllUserFeedbackAsSubject methods.")
  (:URI         . "/users/:user_id/feedback/from-buyers")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:USER-ID)
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Feedback")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))
  
  
 ((:NAME        . "findAllFeedbackFromSellers")
  (:DESCRIPTION . "Returns a set of FeedBack objects associated to a User.
                    This is essentially the union between
                    the findAllUserFeedbackAsBuyer and findAllUserFeedbackAsSubject methods.")
  (:URI         . "/users/:user_id/feedback/from-sellers")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:USER-ID)
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Feedback")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))


|#



;;; ==============================
;;; EOF
