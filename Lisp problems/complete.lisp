;;;PROBLEM 1
;;;FUNCTION NAME: dispnth
;;;DESCRIPTION: displays the nth (specified by num) char of list L.

(defun dispnth(L num) 
  (cond((null L) nil)
       ((= num 1) (first L))
       (T (dispnth (rest L) (- num 1)))))

;;;PROBLEM 2
;;;FUNCTION NAME: delnth
;;;DESCRIPTION: deletes nth (n) char from list (L)

(defun delnth (L n)
  (cond((null L) nil)
        ((= n 2) (cons (first L) (rest(rest L))))
        (t (cons (first L) (delnth (rest L) (- n 1))))))

;;;PROBLEM 3
;;;FUNCTION NAME: lastele
;;;DESCRIPTION: displays last element of list L

(defun lastele(L) 
  (cond((null L) nil)
       ((null(rest L)) (first L))
       (T (lastele (rest L)))))

;;;PROBLEM 4
;;;FUNCTION NAME: lastele2H
;;;DESCRIPTION: helper for lastele2, displays last list of a list L or nil

(defun lastele2H(L x) 
  (cond((null L) x)
       ((listp(first L)) (lastele2H (rest L) (first L)))
       (T (lastele2H (rest L) x))))

;;;FUNCTION NAME: lastele2
;;;DESCRIPTION: displays last list of a list L or nil

(defun lastele2(L)
  (lastele2H L nil))

;;;PROBLEM 5
;;;FUNCTION NAME: remv
;;;DESCRIPTION: removes element a from list L

(defun remv(a L)
  (cond((null L) nil)
       ((equal a (first L)) (remv a (rest L) ))
       ((equal a (first (rest L))) (cons (first L) (remv a (rest (rest L)))))
       (T (cons (first L) (remv a (rest L))))))

;;;PROBLEM 6
;;;FUNCTION NAME: remv2
;;;DESCRIPTION: removes list a from list L
(defun remv2(a L)
  (cond((null L) nil)
       ((equal a (first L)) (remv2 a (rest L) ))
       ((equal a (first (rest L))) (cons (first L) (remv2 a (rest (rest L)))))
       (T (cons (first L) (remv2 a (rest L))))))

;;;PROBLEM 7
;;;FUNCTION NAME: remvdubH
;;;DESCRIPTION: Helper for remvdub, removes duplicate c from list L
(defun remvdubH(c L)
  (cond((null L) nil)
       ((equal c (first L)) (remvdubH c (rest L)))
       (T (cons (first L) (remvdubH c (rest L))))))

;;;FUNCTION NAME: remvdub
;;;DESCRIPTION: removes duplicate elements from list L
(defun remvdub(L)
  (cond((null L) nil)
       (T (cons (first L) (remvdub (remvdubH (first L) (rest L)))))))


;;;PROBLEM 8
;;;FUNCTION NAME: remvdub2H
;;;DESCRIPTION: Helper for remvdub, removes duplicate c from list L
(defun remvdub2H(c L)
  (cond((null L) nil)
       ((equal c (first L)) (remvdub2H c (rest L)))
       (T (cons (first L) (remvdub2H c (rest L))))))

;;;FUNCTION NAME: remvdub2
;;;DESCRIPTION: removes duplicate elements from list L
(defun remvdub2(L)
  (cond((null L) nil)
       (T (cons (first L) (remvdub2 (remvdub2H (first L) (rest L)))))))

;;;PROBLEM 9
;;;FUNCTION NAME: lists
;;;DESCRIPTION: returns the lists elements of a given list
(defun lists(L)
  (cond((null L) nil)
       ((listp (first L)) (cons (first L) (lists (rest L))))
       (T (lists (rest L)))))

;;;PROBLEM 10
;;;FUNCTION NAME: indeH
;;;DESCRIPTION: helper for inde,  builds a list of the indices of the occurances of x in list L
(defun indeH(L x i)
  (cond((null L) nil)
       ((equal x (first L)) (cons i (indeH (rest L) x (+ i 1))))
       (T (indeH (rest L) x (+ i 1)))))

;;;FUNCTION NAME: inde
;;;DESCRIPTION: returns the a list of the indices of the occurances of x in L
(defun inde(x L)
  (indeH L x 1))


;;;PROBLEM 11
;;;FUNCTION NAME: neleH
;;;DESCRIPTION: helper for nele, creates a list conatianing i number of x .
(defun neleH(x i)
  (cond((equal 0 i) nil)
       (T (cons x (neleH x (- i 1))))))

;;;FUNCTION NAME: neleH
;;;DESCRIPTION: repeates each element in list L n times.
(defun nele(L n)
  (cond((null L) nil)
       (T (append (neleH (first L) n) (nele (rest L) n)))))

;;;PROBLEM 12
;;;FUNCTION NAME: istrinH
;;;DESCRIPTION: helper for istrin, returns T if number n is triangular
(defun istrinH(n m)
  (cond((equal n 0) T)
       ((< n m) nil)
       (T (istrinH (- n m) (+ m 1)))))

;;;FUNCTION NAME: istrin
;;;DESCRIPTION: returns T if n is triangular
(defun istrin(n)
  (istrinH n 0))

;;;PROBLEM 13
;;;FUNCTION NAME: countAtom
;;;DESCRIPTION: helper for countEach, returns the number of occurances of a in L
(defun countAtom (a L)
  (cond
   ((null L) 0)
   ((equal a (first L)) (+ 1 (countAtom a (rest L))))
   (t (countAtom a (rest L)))))

;;;FUNCTION NAME: countEach
;;;DESCRIPTION: returns a list of lists in form ((element #_of_occurances)...) analyizing list L
(defun countEach(L)
  (cond((null L) nil)
       (T (cons (list (first L) (countAtom (first L) L)) (countEach (rest L))))))

;;;FUNCTION NAME: findMax
;;;DESCRIPTION: helper for model, returns the number of most occurances
(defun findMax(L x)
  (cond((null L) x)
       ((> (first (rest (first L))) x) (findMax (rest L) (first (rest (first L)))))
       (T (findMax (rest L) x))))

;;;FUNCTION NAME: simpfilter
;;;DESCRIPTION: a general filter used in model, filter outs elements in list L that do not satisfy predicate F
(defun simpfilter(F L)
  (cond((null L) '())
       ((funcall F (first L)) (cons (first L) (simpfilter F (rest L))))
       (T (simpfilter F (rest L)))))

;;;FUNCTION NAME: model
;;;DESCRIPTION: returns the mode, a list of lists in the form ((element_that_is_mode #_of_occurances)...)
(defun model(L)
  (simpfilter (lambda (x) (>= (first (rest x)) (findMax (countEach L ) 0))) (countEach L)))

;;;PROBLEM 13
;;;FUNCTION NAME: poplist
;;;DESCRIPTION: builds a list from n to 1
(defun poplist(n)
  (cond((equal n 0) nil)
       (T (cons n (poplist (- n 1))))))

;;;FUNCTION NAME: permute
;;;DESCRIPTION: permutes lst by consing each element to all permutations of previous elements and repeating.
(defun permute (lst &optional (remain lst))
  (cond ((null remain) nil)
        ((null (rest lst)) (list lst))
        (T (append (mapcar (lambda (l) (cons (first lst) l)) (permute (rest lst)))
            (permute (append (rest lst) (list (first lst))) (rest remain))))))

;;;FUNCTION NAME: permu
;;;DESCRIPTION: returns a list of lists of all permuations of n
(defun permu (n)
  (permute (poplist n)))


