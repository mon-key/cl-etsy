;;; :FILE-CREATED <Timestamp: #{2012-07-23T18:02:08-04:00Z}#{12301} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/cl-etsy/api-mappings.lisp
;;; ==============================

 (defun %api-class-slot-freqs (seq &key (test #'eql) (key #'identity))
   (declare (sequence seq)
            (cl:type (function (t t) t) test)
            (cl:type (function (t) t) key)
            (optimize (speed 3)))
   #-sbcl (assert (sequencep seq))
   (unless (zerop (length seq));(sequence-zerop seq)
     (sort
      (reduce #'(lambda (res el)
                  (let ((fi (assoc el res :test test)))
                    (cond (fi
                           (incf (cdr fi))
                           res)
                          ((acons el 1 res)))))
              seq :key key :initial-value nil)
      #'> :key #'cdr)))

 (defun api-class-all-direct-slots (&key (class-with-class-slot-list *api-classes-and-slots*))
   ;; nth-value 0 is a list of all direct slots including duplicates
   ;; nth-value 1 is a list of all direct slots with duplicates removed
   ;; nth-value 3 is a cons - its car is the count of nth-value 0 its cdr is the cnt of nth-value 1
   (loop 
     with dups = ()
     for (class slots) in class-with-class-slot-list
     for dup = (loop 
                 for slot in slots
                 summing (or (and (find slot gthr) 0)
                             (and (push slot dups) 1)))
     summing (length slots) into cnt
     summing dup into dup-cnt
     appending slots into gthr
     finally (return (values (sort gthr #'string<) 
                             (sort dups #'string<)
                             (cons cnt dup-cnt)))))

(defun api-class-all-direct-slot-name-stats (&key (class-with-class-slot-list *api-classes-and-slots*))
  ;; Return stats for the slot-names of CLASS-WITH-CLASS-SLOT-LIST.
  (let (all-slots unique-slots slot-counts)
    (multiple-value-bind (all unique counts)
        (api-class-all-direct-slots :class-with-class-slot-list class-with-class-slot-list)
      (setf all-slots all
            unique-slots unique 
            slot-counts counts))
    (loop 
      with ht = (make-hash-table)
      with rtn = ()
      for (key . val) in (%api-class-slot-freqs all-slots)
      do (multiple-value-bind (set foundp) (gethash val ht)
           (if foundp
               (if set
                   (pushnew key (gethash val ht))
                   (setf (gethash val ht) (list key)))
               (setf (gethash val ht) (list key))))
      finally (setf rtn (loop
                          for hkey being the hash-keys in ht using (hash-value hval)
                          collect (list :n-slot-names (length hval) 
                                        :occurred-n-times hkey 
                                        :slot-occurrences hval)))
              (return (values rtn
                              (list :unique-slots-count (car slot-counts)
                                    :total-slots-count  (cdr slot-counts)
                                    :unique-slots unique-slots))))))

(defun api-class-output-defgeneric-forms (&key (class-with-class-slot-list *api-classes-and-slots*)
                                               (output-stream nil))
  ;; class-with-class-slot-list is a proper-list the elements of which are
  ;; symbols with each element of the list having the form:
  ;; (api-class (slots-of-api-class ...))
  ;; output-stream is a stream
  (declare ((or boolean stream) output-stream)
           (cons class-with-class-slot-list))
  (loop 
    with ht = (make-hash-table)
    for (class  slots) in class-with-class-slot-list       
    do (loop 
         for slot in slots
         do (multiple-value-bind (maybe-class-list foundp) (gethash slot ht)
              (if foundp
                  (if maybe-class-list
                      (pushnew class (gethash slot ht))
                      (setf (gethash slot ht) (list class)))
                  (setf (gethash slot ht) (list class)))))
    finally (let ((*print-case* :downcase))
              (loop 
                for key being the hash-keys in ht using (hash-value val)
                for rev-val = (sort val #'string-lessp)
                collect (list key rev-val) into gthr
                finally (setf gthr (sort gthr #'string-lessp :key #'car))
                        (let ((*print-right-margin* 360))
                          (loop for (srtd-slot  srtd-clss) in gthr
                                do (format output-stream "~%;; ~D classes: ~{~A~^ ~}~%(defgeneric ~S (object))~%(defgeneric (setf ~S) (~S object))~%" 
                                           (length srtd-clss) srtd-clss srtd-slot srtd-slot srtd-slot)))
                        ;; (format t "~:{ ~2%slot-name: ~S~%~2Tclasses: ~S~}" gthr)
                ))))

;;; ==============================
;;; EOF
