;;; :FILE-CREATED <Timestamp: #{2012-07-11T13:10:21-04:00} - by MON>
;;; :FILE #P"cl-etsy/api-class/test/etsy-listing-image-class.lisp"
;;; ================================================================

#|

 (URL `http://www.etsy.com/developers/documentation/reference/listingimage')

----
API-ASSOCIATIONS

:association Listing
:visibility  public
:perm-scope  none
:type        Listing
:description "The listing to which the image belongs."

----
API-METHODS

"findAllListingImages"
"uploadListingImage"
"getImage_Listing"
"deleteListingImage"

----
 (closer-mop:class-finalized-p (find-class 'listing-image))
 (api-implicit-class-direct-slot-names-as-underscored-strings 'listing-image)
 (substitute "url_570xN" "url_570xn" (api-implicit-class-direct-slot-names-as-underscored-strings 'listing-image) :test #'string=)
 

|#

(in-package #:cl-etsy)

;; ListingImage
(defclass listing-image (base-etsy)
  (;; listing_image_id
   (listing-image-id
    :initarg :listing-image-id
    :accessor listing-image-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric ID of the listing image.")

   ;; hex_code
   (hex-code
    :initarg :hex-code
    :accessor hex-code
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The image's average color, in webhex notation.")

   (red
    :initarg :red
    :accessor red
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The image's average red value, 0-255 (RGB color).")

   (green
    :initarg :green
    :accessor green
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The image's average green value, 0-255 (RGB color).")

   (blue
    :initarg :blue
    :accessor blue
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The image's average blue value, 0-255 (RGB color).")

   (hue
    :initarg :hue
    :accessor hue
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The image's average hue, 0-360 (HSV color).")

   (saturation
    :initarg :saturation
    :accessor saturation
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The image's average saturation, 0-100 (HSV color).")

   (brightness
    :initarg :brightness
    :accessor brightness
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The image's average brightness, 0-100 (HSV color).")

   ;; is_black_and_white
   (is-black-and-white
    :initarg :is-black-and-white
    :accessor is-black-and-white
    ;; :visibility public
    ;; :perm-scope none
    ;; :type boolean
    :documentation "True if the image is in black and white.")

   ;; creation_tsz
   (creation-tsz
    :initarg :creation-tsz
    :accessor creation-tsz
    ;; :visibility public
    ;; :perm-scope none
    ;; :type float
    :documentation "Creation time, in epoch seconds.")

   ;; listing_id
   (listing-id
    :initarg :listing-id
    :accessor listing-id
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "The numeric value of the listing id the image belongs to.")

   (rank
    :initarg :rank
    :accessor rank
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Display order.")

   ;; url_75x75
   (url-75x75
    :initarg :url-75x75
    :accessor url-75x75
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The URL to a 75x75 thumbnail of the image.")

   ;; url_170x135
   (url-170x135
    :initarg :url-170x135
    :accessor url-170x135
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The URL to a 170x135 thumbnail of the image.")
   
   ;; _Fucking_Assholes_! 
   ;; Howsabout some consistency in your symbol naming rules?
   ;; either "fullxfull" is a valid symbol or "570xN" is but not both
   ;; (symbol-munger:underscores->lisp-name "url_570xN") => "url-570xn"
   ;; (symbol-munger:lisp->underscores 'url_570xn)       => "url_570xn"
   ;; url_570xN 
   (url-570xn
    :initarg :url-570xn
    :accessor url-570xn
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The URL to a thumbnail of the image, no more than 570px width by variable height.
The url-570xN image sizes have variable dimensions depending on the original artwork uploaded by the seller.
The horizontal dimension will be the original artwork's horizontal size, or 570 pixels, whichever is smaller.
The vertical dimension is variatic dependent on the original artwork's aspect ratio.")

   ;; url_fullxfull
   (url-fullxfull
    :initarg :url-fullxfull
    :accessor url-fullxfull
    ;; :visibility public
    ;; :perm-scope none
    ;; :type string
    :documentation "The URL to the full-size image, no more than 1500px width by variable height.
The url-fullxfull image sizes have variable dimensions depending on the original artwork uploaded by the seller.
The horizontal dimension will be the original artwork's horizontal size, or 1500 pixels, whichever is smaller.
The vertical dimension is variatic dependent on the original artwork's aspect ratio.")

   ;; full_height
   (full-height
    :initarg :full-height
    :accessor full-height
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Height of the image returned by url-fullxfull.")

   ;; full_width
   (full-width
    :initarg :full-width
    :accessor full-width
    ;; :visibility public
    ;; :perm-scope none
    ;; :type int
    :documentation "Width of the image returned by url-fullxfull."))

  ;; (:default-initargs 
  ;;  :listing-image-id nil :hex-code nil :red nil :green nil :blue nil :hue nil
  ;;  :saturation nil :brightness nil :is-black-and-white nil :creation-tsz nil
  ;;  :listing-id nil :rank nil :url-75x75 nil :url-170x135 nil :url-570xn nil
  ;;  :url-fullxfull nil :full-height nil :full-width nil)

  (:documentation "A photograph of a listing for sale.

\"As of July 20th, 2010 the following image sizes will be officially supported by
Etsy through the end of 2013:

 Size	   Used by
 -----------------
 75x75	   listings, avatars
 170x135   listings
 570xN	   listings
 760x100   shop banners
 fullxfull listings

 (URL `http://www.etsy.com/developers/documentation/reference/listingimage')"))


#|

 ((:NAME        . "findAllListingImages")
  (:DESCRIPTION . "Retrieves a set of ListingImage objects associated to a Listing.")
  (:URI         . "/listings/:listing_id/images")
  (:PARAMS
   (:LISTING-ID . "int"))
  (:DEFAULTS)
  (:TYPE         . "ListingImage")
  (:VISIBILITY   . "public")
  (:HTTP-METHOD . "GET"))
     
  ((:NAME        . "getImage_Listing")
   (:DESCRIPTION . "Retrieves a Image_Listing by id.")
   (:URI         . "/listings/:listing_id/images/:listing_image_id")
   (:PARAMS
    (:LISTING-IMAGE-ID . "array(int)")
    (:LISTING-ID        . "int"))
   (:DEFAULTS)
   (:TYPE         . "ListingImage")
   (:VISIBILITY   . "public")
   (:HTTP-METHOD . "GET"))
  
  ((:NAME        . "uploadListingImage")
   (:DESCRIPTION . "Upload a new listing image")
   (:URI         . "/listings/:listing_id/images")
   (:PARAMS
    (:LISTING-ID . "int")
    (:IMAGE       . "image")
    (:RANK        . "int"))
   (:DEFAULTS
    (:RANK . 1))
   (:TYPE         . "ListingImage")
   (:VISIBILITY   . "private")
   (:HTTP-METHOD . "POST"))

|#

;;; ==============================
;;; EOF
