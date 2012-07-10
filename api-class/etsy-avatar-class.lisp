;;; :FILE-CREATED <Timestamp: #{2012-07-10T18:27:34-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/api-class/etsy-avatar-class.lisp
;;; ==============================

#|

(URL `http://www.etsy.com/developers/documentation/reference/avatar')

----
API-METHODS
"getAvatarImgSrc"
"uploadAvatar"

|#

(in-package #:cl-etsy)

;; Avatar
(defclass avatar (base-etsy)
  (
   ;; avatar_id
   (avatar-id
    :initarg :avatar-id
    :accessor avatar-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID for this avatar image.")

   ;; hex_code
   (hex-code
    :initarg :hex-code
    :accessor hex-code
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The avatar' average RGB color, in webhex notation.")

   (red
    :initarg :red
    :accessor red
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The avatar's average red channel (RGB color) value from 0-255.")

   (green
    :initarg :green
    :accessor green
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The avatar's average green channel (RGB color) value from 0-255.")

   (blue
    :initarg :blue
    :accessor blue
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The avatar's average blue channel (RGB color) value from 0-255.")

   (hue
    :initarg :hue
    :accessor hue
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The avatar's average hue (HSV color) from 0-360.")

   (saturation
    :initarg :saturation
    :accessor saturation
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The avatar's average saturation (HSV color) from 0-100.")

   (brightness
    :initarg :brightness
    :accessor brightness
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The avatar's average brightness (HSV color) from 0-100.")

   ;; is_black_and_white
   (is-black-and-white
    :initarg :is-black-and-white
    :accessor is-black-and-white
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the avatar is a black and white image.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "The time that the avatar was uploaded.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the user who owns the avatar. "))
  ;; (:default-initargs
  ;;  :avatar-id nil :hex-code nil :red nil :green nil :blue nil
  ;;  :hue nil :saturation nil :brightness nil :is-black-and-white nil
  ;;  :creation-tsz nil :user-id nil)
  (:documentation "An Etsy member's avatar image.
 (URL `http://www.etsy.com/developers/documentation/reference/avatar')"))



;;; ==============================
;;; EOF
