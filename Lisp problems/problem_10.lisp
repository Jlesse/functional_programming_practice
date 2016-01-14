
(defun indeH(L x i)
  (cond((null L) nil)
       ((equal x (first L)) (cons i (indeH (rest L) x (+ i 1))))
       (T (indeH (rest L) x (+ i 1)))))

(defun inde(x L)
  (indeH L x 1))

(inde 1 '(1 2 1 1 2 2 1))