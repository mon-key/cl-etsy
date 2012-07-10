;;; :FILE-CREATED <Timestamp: #{2012-07-10T11:47:33-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-user-class.lisp
;;; ==============================

;; this class originally defined in cl-etsy/types.lisp
(in-package #:cl-etsy)


#|
 (URL `http://www.etsy.com/developers/documentation/reference/user')

 "findAllUsersForTeam"
 
 "findAllUsers"

 "getUser"

|#

;; v2
(def-api-class user () 
  "User records represent a single user of the site, who may or may not be a seller." 
  ;; user_id
  ((user-id
    :level :low
    :type int
    :doc "The user's numeric ID.  This is also valid as the user's shop ID.")
   ;; login_name v1 user-name
   (login-name
    :level :low
    :type string
    :doc "The user's login name.")
   ;; primary_email
   (primary-email
    :level :low
    :type  string
    :doc "The user's primary email address.")
   ;; creation_tsz v1 join-epoch
   (creation-tsz
    :level :low
    :type float
    :doc "The date and time the user was created in epoch seconds.")
   ;; v2 referred_by_user_id
   (referred-by-user-id
    :level low
    :type int 
    :doc "The numeric ID of the user that referred this user.")
   ;; v2 feedback_info
   (feedback-info
    :level :low
    :type  feedback-info ; alist plist hash-table???
    ;;:type feedback-info ;; "FeedbackInfo"
    :doc "An associative array of feedback totals for the user.
          (URL `http://www.etsy.com/developers/documentation/reference/feedbackinfo')")
    ))

(defmethod print-object ((x user) stream)
  (dumb-printing stream x "~D: ~A" user-id login-name))

;;; ==============================

;; v1
;; (def-api-class 
;;     ;; NAME
;;     user 
;;     ;; SUPERCLASS
;;     () 
;;   ;; DOC
;;   "User records represent a single user of the site, who may or may not be a seller." 
;;   ;; FIELDS
;;   ((user-name
;;     :level :low
;;     :type string
;;     :doc "The user's login name.")
;;    (user-id
;;     :level :low
;;     :type int
;;     :doc "The user's numeric ID.  This is also valid as the user's shop ID.")
;;    (url
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's shop, if s/he is a seller, or to the user's public profile.")
;;    (image-url-25x25
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's 25x25 avatar thumbnail.")
;;    (image-url-30x30
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's 30x30 avatar thumbnail.")
;;    (image-url-50x50
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's 50x50 avatar thumbnail.")
;;    (image-url-75x75
;;     :level :low
;;     :type string
;;     :doc "The full URL to the user's 75x75 avatar (full resolution).")
;;    (join-epoch
;;     :level :low
;;     :type float
;;     :doc "The date and time the user joined the site, in epoch seconds.")
;;    (city
;;     :level :low
;;     :type string
;;     :doc "The user's city and state (freeform entry; may be blank).")
;;    (gender
;;     :level :medium
;;     :type string
;;     :doc "The user's gender (female, male, or private).")
;;    (lat
;;     :level :medium
;;     :type float
;;     :doc "The user's latitude (may be blank).")
;;    (lon
;;     :level :medium
;;     :type float
;;     :doc "The user's longitude (may be blank).")
;;    (transaction-buy-count
;;     :level :medium
;;     :type int
;;     :doc "The number of items the user has purchased.")
;;    (transaction-sold-count
;;     :level :medium
;;     :type int
;;     :doc "The number of items the user has sold.")
;;    (is-seller
;;     :level :medium
;;     :type boolean
;;     :doc "true if user is a seller.")
;;    (was-featured-seller
;;     :level :medium
;;     :type boolean
;;     :doc "true if user was previously featured.")
;;    (materials
;;     :level :medium
;;     :type string
;;     :doc "The user's favorite materials.")
;;    (last-login-epoch
;;     :level :medium
;;     :type float
;;     :doc "The date and time of the user's last login, in epoch seconds.")
;;    (referred-user-count
;;     :level :high :type int
;;     :doc "The number of members the user has referred to the site.")
;;    (birth-day
;;     :level :high
;;     :type int
;;     :doc "The day portion of the user's birthday (may be blank).")
;;    (birth-month
;;     :level :high
;;     :type int
;;     :doc "The month portion of the user's birthday (may be blank).")
;;    (bio
;;     :level :high
;;     :type string
;;     :doc "The user's biography (may be blank).")
;;    (num-favorers
;;     :level high
;;     :type int
;;     :doc "Presumably, the number of hearts.")
;;    (feedback-count
;;     :level :high
;;     :type int
;;     :doc "The total count of feedback by and about this user.")
;;    (feedback-percent-positive
;;     :level :favorites
;;     :type int
;;     :doc "The percentage of feedback by or about this user that is positive.")
;;    (favorite-creation-epoch
;;     :level :favorites
;;     :type float
;;     :doc "The date and time that the user was favorited 
;;  (only available in the commands getFavorersOfShop, getFavorersOfListing and getFavoriteShopsOfUser.)")
;;    (status 
;;     :level :favorites 
;;     :type enum-to-keyword
;;     :doc "public or private.
;; If private, user is a Secret Admirer, and no information about the user can be shown.")))

;; (defmethod print-object ((x user) stream)
;;   (dumb-printing stream x "~D: ~A" user-id user-name))


;;; ==============================
;;; EOF
