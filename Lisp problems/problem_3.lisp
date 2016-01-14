(defun lastele(L) 
  (cond((null L) nil)
       ((null(rest L)) (first L))
       (T (lastele (rest L)))))

(lastele '(1 2 (3 4) 5))