(defun neleH(x i)
  (cond((equal 0 i) nil)
       (T (cons x (neleH x (- i 1))))))

(defun nele(L n)
  (cond((null L) nil)
       (T (append (neleH (first L) n) (nele (rest L) n)))))

(nele '(1 2 4) 3)

       