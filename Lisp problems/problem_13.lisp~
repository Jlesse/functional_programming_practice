
(defun countAtom (a L)
  (cond
   ((null L) 0)
   ((equal a (first L)) (+ 1 (countAtom a (rest L))))
   (t (countAtom a (rest L)))))

(defun countEach(L)
  (cond((null L) nil)
       (T (cons (list (first L) (countAtom (first L) L)) (countEach (rest L))))))

(defun findMax(L x)
  (cond((null L) x)
       ((> (first (rest (first L))) x) (findMax (rest L) (first (rest (first L)))))
       (T (findMax (rest L) x))))

(findMax '((1 3) (2 2) (3 3)) 0) 

(defun simpfilter(F L)
  (cond((null L) '())
       ((funcall F (first L)) (cons (first L) (simpfilter F (rest L))))
       (T (simpfilter F (rest L)))))

(defun model(L)
  (simpfilter (lambda (x) (>= (first (rest x)) (findMax (countEach L ) 0))) (countEach L)))

(model '(1 3 5 2 3 5 5 1 3))