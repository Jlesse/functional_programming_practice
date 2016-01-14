
(defun remv(a L)
  (cond((null L) nil)
       ((equal a (first L)) (remv a (rest L) ))
       ((equal a (first (rest L))) (cons (first L) (remv a (rest (rest L)))))
       (T (cons (first L) (remv a (rest L))))))

(remv '(b) '(a (b) a c))