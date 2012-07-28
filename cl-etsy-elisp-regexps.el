;;; :FILE-CREATED <Timestamp: #{2012-07-10T21:27:58-04:00Z}#{12282} - by MON>
;;; :FILE cl-etsy/cl-etsy-notes/cl-etsy-elisp-regexps.el
;;; ==============================

(defun etsy-convert-associations (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (unwind-protect 
          (progn
            (narrow-to-region start end)
            (goto-char -1)
            (while (search-forward-regexp "\\(.*\\) \t\\(.*\\) \t\\(.*\\) \t\\(.*\\) \t\\(.*\\)" nil t)
              (replace-match
               ":association \\1\n:visibility  \\2\n:perm-scope  \\3\n:type        \\4\n:description \"\\5\"\n" t)))
        (widen)))))

(defun etsy-convert-method-parameters (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (unwind-protect 
          (progn
            (narrow-to-region start end)
            (goto-char -1)
            (while 
                (search-forward-regexp "\\(.*\\) \t\\(.*\\) \t\\(.*\\) \t\\(.*\\)" nil t)
              (let ((match-dash (downcase (subst-char-in-string 95 45 (match-string-no-properties 1))))
                    (match-req  (cond ((equal (match-string-no-properties 2) "Y")
                                       "T")
                                      ((equal (match-string-no-properties 2) "N")
                                       "NIL")
                                      (t (match-string-no-properties 2)))))
                (replace-match (concat ":name      :" match-dash "\n:required  " match-req "\n:default   \\3\n:type      \"\\4\"\n") t))))
        (widen)))))

(defun etsy-convert-fields (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (unwind-protect 
          (progn
            (narrow-to-region start end)
            (goto-char -1)
            (while
                (search-forward-regexp "\\(.*\\) +\t\\(.*\\) +\t\\(.*\\) +\t\\(.*\\) +\t\\(.*\\)" nil t)
              (let ((match-dash (downcase (subst-char-in-string 95 45 (match-string-no-properties 1)))))
                (replace-match
                 (concat
                  ";; \\1\n(" match-dash "\n:initarg :" match-dash "\n:accessor " match-dash
                  "\n;; :visibility \\2\n;; :perm-scope \\3\n;; :type \\4\n:documentation \"\\5\")\n") t))))
            (widen)))))

(defun etsy-class-insert ()
  (interactive)
  (save-excursion
    (insert "\n\n#|\n\n----\nAPI-ASSOCIATIONS\n\n----\nAPI-METHODS\n
----\n (closer-mop:class-finalized-p (find-class '))\n (api-class-slot-names-as-underscored-strings ')\n
|#\n
(in-package #:cl-etsy)\n
;;
(defclass  (base-etsy)
  (
   )
  ;; (:default-initargs )
  (:documentation \"\"))")))

;; Regexp for transforming the permission scope table outlined here:
;;  (URL `http://www.etsy.com/developers/documentation/getting_started/oauth#section_permission_scopes')
;; :NOTE doesn't correctly split the multiply affected resources correctly
;;
;; (while (search-forward-regexp "\\(.*\\)\\( 	\\)\\(.*\\)\\( 	\\)\\(.*\\)" nil t)
;;   (replace-match "\n:permission-scope  \"\\1\"\n:description       \"\\3\"\n:affected-resource (\"\\5\")"))

;; (funcall #'(lambda (x) 
;;              (loop 
;;                 for init in x
;;                 for sym in x
;;                 nconcing (list (caddr init) nil) into gthr
;;                 collecting (car sym) into syms
;;                 finally (return (values syms gthr))))


;; Common Lisp for writing skeleton files for each "type" defined by the Etsy v2 API
;;
;; (let ((base-dir #P"/<SOME-PATH-TO-CL-ETSY>/cl-etsy/api-class/")
;;       (test-dir #P"/<SOME-PATH-TO-CL-ETSY>/cl-etsy/api-class/test/"))
;;   ;; (ensure-directories-exist test-dir)
;;   (loop 
;;     for type in (list "Avatar" "BillCharge" "BillingOverview" "BillPayment" "Cart" "CartListing"
;;                       "Category" "Country" "Coupon" "DataType" "FavoriteListing" "FavoriteUser"
;;                       "FeaturedTreasury" "Feedback" "FeedbackInfo" "ForumPost" "Ledger" "LedgerEntry" "Listing"
;;                       "ListingImage" "ListingTranslation" "Order" "ParamList" "PaymentTemplate"
;;                       "Receipt" "Region" "ShippingInfo" "ShippingTemplate" "ShippingTemplateEntry"
;;                       "Shop" "ShopSection" "ShopSectionTranslation" "ShopTranslation" "Style" "Tag"
;;                       "Team" "Transaction" "Treasury" "TreasuryCounts" "TreasuryListing"
;;                       "TreasuryListingData" "User" "UserAddress" "UserProfile")
;;     for convert = (nstring-downcase
;;                    (nsubstitute #\- #\_ 
;;                                 (cl-ppcre:regex-replace-all "(?<!^)((?<!_)([A-Z]))" type "-\\1")))
;;     for name = (concatenate 'string "etsy-" convert "-class")
;;     for base-path = (merge-pathnames (make-pathname :name name :type "lisp")
;;                                      base-dir)
;;     for test-path = (merge-pathnames (make-pathname :name name :type "lisp")
;;                                      test-dir)
;;     for url  = (format nil "(URL `http://www.etsy.com/developers/documentation/reference/~A')" (string-downcase type))
;;     when (unless (probe-file base-path)
;;            (with-open-file (f test-path 
;;                               ;; :if-exists :error
;;                               ;; :if-exists :rename
;;                               :if-exists :supersede
;;                               :if-does-not-exist :create
;;                               :direction :output
;;                               )
;;              (mon:write-file-header f)
;;              (format f "~%#|~2% ~A~2%----~%API-ASSOCIATIONS~2%----~%API-METHODS~2%|#~2%(in-package #:cl-etsy)~2%" url)
;;              (format f 
;;                      ";; ~A~%(defclass ~A (base-etsy)~%  (~%   )~%  ;; (:default-initargs )~%  (:documentation \"~% ~A\"))~2%;;; ==============================~%;;; EOF~%"
;;                      type convert url)
;;              t))
;;     collect (list type convert name test-path)))


;;; ==============================
;;; EOF

