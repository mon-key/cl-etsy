;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-team-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/team')

----
API-METHODS

"findAllTeams"
"findTeams"
"findAllTeamsForUser"

|#

(in-package #:cl-etsy)

;; team
;; (group-id name create-date update-date tags)

;; Team
(defclass team (base-etsy)
  (;; group_id
   (group-id
    :initarg :group-id
    :accessor group-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The team's numeric ID.")

   (name
    :initarg :name
    :accessor name
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The team's name.")

   ;; create_date
   (create-date
    :initarg :create-date
    :accessor create-date
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The date and time the team was created in Epoch seconds.")

   ;; update_date
   (update-date
    :initarg :update-date
    :accessor update-date
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The date and time the team was last updated in Epoch seconds.")

   (tags
    :initarg :tags
    :accessor tags
    ;; :visibility public
    ;; :perm-scope none
    ;; :type array(string)
    :documentation "A list of tags describing the team."))

     ;; (:default-initargs 
     ;;  :group-id nil :name nil :create-date nil :update-date nil :tags nil)

  (:documentation "Teams represent a community of users on Etsy, found at (URL `http://www.etsy.com/teams').
Generally, the Etsy API only exposes public teams data.
Using OAuth, a team captain may see pending or invited team members using the findAllUsersForTeam method.
 (URL `http://www.etsy.com/developers/documentation/reference/team')"))


;;; ==============================
;;; EOF
