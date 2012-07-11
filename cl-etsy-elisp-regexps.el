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
    (insert "\n\n#|\n\n----\nAPI-ASSOCIATIONS\n\n----\nAPI-METHODS\n\n|#\n
(in-package #:cl-etsy)\n
;;
(defclass  (base-etsy)
  (
   )
  ;; (:default-initargs )
  (:documentation \"\"))")))

;; (funcall #'(lambda (x) 
;;              (loop 
;;                 for init in x
;;                 for sym in x
;;                 nconcing (list (caddr init) nil) into gthr
;;                 collecting (car sym) into syms
;;                 finally (return (values syms gthr))))


;;; ==============================
;;; EOF

