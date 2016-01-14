
(defun lists(L)
  (cond((null L) nil)
       ((listp (first L)) (cons (first L) (lists (rest L))))
       (T (lists (rest L)))))

(lists '(1 (2 3) (4) 5))