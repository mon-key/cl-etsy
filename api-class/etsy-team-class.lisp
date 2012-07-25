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

----
 (closer-mop:class-finalized-p (find-class 'team))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'team)

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


#|

 ((:NAME        . "findAllTeams")
  (:DESCRIPTION . "Returns all Teams")
  (:URI         . "/teams")
  (:PARAMS
   (:LIMIT  . "int")
   (:OFFSET . "int")
   (:PAGE   . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Team")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllUsersForTeam")
  (:DESCRIPTION . "Returns a list of users for a specific team")
  (:URI         . "/teams/:team_id/users/")
  (:PARAMS
   (:TEAM-ID . "int")
   (:STATUS   . "enum(active, invited, pending)")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:STATUS . "active")
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "User")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findTeams")
  (:DESCRIPTION . "Returns specified team by ID or team name")
  (:URI         . "/teams/:team_ids/")
  (:PARAMS
   (:TEAM-IDS . "array(team_id_or_name)"))
  (:DEFAULTS)
  (:TYPE         . "Team")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllTeamsForUser")
  (:DESCRIPTION . "Returns a list of teams for a specific user")
  (:URI         . "/users/:user_id/teams")
  (:PARAMS
   (:USER-ID . "user_id_or_name")
   (:LIMIT    . "int")
   (:OFFSET   . "int")
   (:PAGE     . "int"))
  (:DEFAULTS
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Team")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))

|#


;;; ==============================
;;; EOF
