
(defun remv(a L)
  (cond((null L) nil)
       ((equal a (first L)) (remv a (rest L) ))
       ((equal a (first (rest L))) (cons (first L) (remv a (rest (rest L)))))
       (T (cons (first L) (remv a (rest L))))))

(remv 'a '(a (b) a c))

(defun remv2(a L)
  (cond((null L) nil)
       ((equal a (first L)) (remv2 a (rest L) ))
       ((equal a (first (rest L))) (cons (first L) (remv2 a (rest (rest L)))))
       (T (cons (first L) (remv2 a (rest L))))))

(remv2 '(a b) '(a b (a b) c))