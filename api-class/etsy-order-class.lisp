;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-order-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/order')

----
API-ASSOCIATIONS

:association User
:visibility  private
:perm-scope  transactions_r
:type        User
:description "The user who placed this order."

:association Receipts
:visibility  private
:perm-scope  transactions_r
:type        array(Receipt)
:description "An array of receipts associated to this order."
 

----
API-METHODS

"getOrder"
"findAllUserOrders"

----
 (closer-mop:class-finalized-p (find-class 'order))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'order)

|#

(in-package #:cl-etsy)

;; Order
(defclass order (base-etsy)
  (;; order_id
   (order-id
    :initarg :order-id
    :accessor order-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The order's numeric ID.")

   ;; user_id
   (user-id
    :initarg :user-id
    :accessor user-id
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type int
    :documentation "The numeric ID of the user who placed this order.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility private
    ;; :perm-scope transactions_r
    ;; :type float
    :documentation "Creation time, in epoch seconds."))

  ;; (:default-initargs 
  ;;  :order-id nil :user-id nil :creation-tsz nil)

  (:documentation "Represents a collection of listings purchased by a user at a specific date and time.
 (URL `http://www.etsy.com/developers/documentation/reference/order')"))

#|

 ((:NAME        . "getOrder")
  (:DESCRIPTION . "Retrieves a Order by id.")
  (:URI         . "/orders/:order_id")
  (:PARAMS
   (:ORDER-ID . "array(int)"))
  (:DEFAULTS)
  (:TYPE         . "Order")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

 ((:NAME        . "findAllUserOrders")
  (:DESCRIPTION . "Retrieves a set of Order objects associated to a User.")
  (:URI         . "/users/:user_id/orders")
  (:PARAMS
   (:USER-ID     . "user_id_or_name")
   (:MIN-CREATED . "epoch")
   (:MAX-CREATED . "epoch")
   (:LIMIT        . "int")
   (:OFFSET       . "int")
   (:PAGE         . "int"))
  (:DEFAULTS
   (:MIN-CREATED)
   (:MAX-CREATED)
   (:LIMIT  . 25)
   (:OFFSET . 0)
   (:PAGE))
  (:TYPE         . "Order")
  (:VISIBILITY   . "private")
  (:HTTP-METHOD . "GET"))

|#

;;; ==============================
;;; EOF
