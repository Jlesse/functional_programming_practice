

(defun lastele2H(L x) 
  (cond((null L) x)
       ((listp(first L)) (lastele2H (rest L) (first L)))
       (T (lastele2H (rest L) x))))

(defun lastele2(L)
  (lastele2H L nil))

(lastele2 '(1 (2 3) 4 (4 4) 5)) 

