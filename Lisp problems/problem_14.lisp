
(defun poplist(n)
  (cond((equal n 0) nil)
       (T (cons n (poplist (- n 1))))))

(poplist 3)

(defun permute (lst &optional (remain lst))
  (cond ((null remain) nil)
        ((null (rest lst)) (list lst))
        (t (append (mapcar (lambda (l) (cons (first lst) l)) (permute (rest lst)))
            (permute (append (rest lst) (list (first lst))) (rest remain))))))

(defun permu (n)
  (permute (poplist n)))

(permu 3)