(defun delnth (L n)
  (cond((null L) nil)
        ((= n 2) (cons (first L) (rest(rest L))))
        (t (cons (first L) (delnth (rest L) (- n 1))))))

(delnth '(1 2 (3 4) 5) 3) 