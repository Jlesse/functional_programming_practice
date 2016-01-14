
(defun istrinH(n m)
  (cond((equal n 0) T)
       ((< n m) nil)
       (T (istrinH (- n m) (+ m 1)))))

(defun istrin(n)
  (istrinH n 0))

(istrin 105)