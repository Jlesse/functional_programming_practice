;;;PROBLEM 1
;;;FUNCTION NAME: dispnth
;;;DESCRIPTION: displays the nth (specified by num) char of list L.
;;;NOTES: If the list null then nil is returned else num is decremented until
;;; it is one and the current first is returned

(defun dispnth(L num) 
  (cond((null L) nil)
       ((= num 1) (first L))
       (T (dispnth (rest L) (- num 1)))))

;;;PROBLEM 2
;;;FUNCTION NAME: delnth
;;;DESCRIPTION: deletes nth (n) char from list (L)
;;;NOTES: if the list is null then nil is returned else if n = 2 then the current first
;;;is consed to the rest of the rest of L, deleting element at index N, else n is decremented

(defun delnth (L n)
  (cond((null L) nil)
        ((= n 2) (cons (first L) (rest(rest L))))
        (t (cons (first L) (delnth (rest L) (- n 1))))))

;;;PROBLEM 3
;;;FUNCTION NAME: lastele
;;;DESCRIPTION: displays last element of list L
;;;Notes: If the list null then nil is returned, else if the rest of L is null then return the
;;;current first element, else examine the rest of the list

(defun lastele(L) 
  (cond((null L) nil)
       ((null(rest L)) (first L))
       (T (lastele (rest L)))))

;;;PROBLEM 4
;;;FUNCTION NAME: lastele2H
;;;DESCRIPTION: helper for lastele2, displays last list of a list L or nil
;;;NOTES: If the list L null then return list x else if the current first element is a
;;;list then pass the first as x to the result of the recurseive call and examine the rest of
;;;list L, else examine rest of L with same x.

(defun lastele2H(L x) 
  (cond((null L) x)
       ((listp(first L)) (lastele2H (rest L) (first L)))
       (T (lastele2H (rest L) x))))

;;;FUNCTION NAME: lastele2
;;;DESCRIPTION: displays last list of a list L or nil
;;;NOTES: use LasteleH as helper, passes in nil as defualt value
(defun lastele2(L)
  (lastele2H L nil))

;;;PROBLEM 5
;;;FUNCTION NAME: remv
;;;DESCRIPTION: removes element a from list L
;;;NOTES: if list L is null then return nil else if a equals the current first then remove
;;; a from the list, else if a equals the first of the the rest of the list cons first L
;;; to the result of the recursive call on the rest of the rest of list, else cons first L to 
;;; the recursive call to the rest of L.

(defun remv(a L)
  (cond((null L) nil)
       ((equal a (first L)) (remv a (rest L) ))
       ((equal a (first (rest L))) (cons (first L) (remv a (rest (rest L)))))
       (T (cons (first L) (remv a (rest L))))))

;;;PROBLEM 6
;;;FUNCTION NAME: remv2
;;;DESCRIPTION: removes list a from list L
;;;NOTES: same same as number 5
(defun remv2(a L)
  (cond((null L) nil)
       ((equal a (first L)) (remv2 a (rest L) ))
       ((equal a (first (rest L))) (cons (first L) (remv2 a (rest (rest L)))))
       (T (cons (first L) (remv2 a (rest L))))))

;;;PROBLEM 7
;;;FUNCTION NAME: remvdubH
;;;DESCRIPTION: Helper for remvdub, removes duplicate c from list L
;;;NOTES: if the list L is null then return nil else if c equals the current first
;;; remove c, else do not remove c
(defun remvdubH(c L)
  (cond((null L) nil)
       ((equal c (first L)) (remvdubH c (rest L)))
       (T (cons (first L) (remvdubH c (rest L))))))

;;;FUNCTION NAME: remvdub
;;;DESCRIPTION: removes duplicate elements from list L
;;;NOTES: uses helper remvdubH, if L is null the nil, else cons first L to result of 
;;; recursive call to remove duplicate elemenets.
(defun remvdub(L)
  (cond((null L) nil)
       (T (cons (first L) (remvdub (remvdubH (first L) (rest L)))))))


;;;PROBLEM 8
;;;FUNCTION NAME: remvdub2H
;;;DESCRIPTION: Helper for remvdub, removes duplicate c from list L
;;;NOTES: Same as remvdubH 
(defun remvdub2H(c L)
  (cond((null L) nil)
       ((equal c (first L)) (remvdub2H c (rest L)))
       (T (cons (first L) (remvdub2H c (rest L))))))

;;;FUNCTION NAME: remvdub2
;;;DESCRIPTION: removes duplicate elements from list L
;;;NOTES: same as remvdub
(defun remvdub2(L)
  (cond((null L) nil)
       (T (cons (first L) (remvdub2 (remvdub2H (first L) (rest L)))))))

;;;PROBLEM 9
;;;FUNCTION NAME: lists
;;;DESCRIPTION: returns the lists elements of a given list
;;;NOTES: if L is null then return nil else else if the current first is a list then add
;;; it the recursive funtion call examining the rest of the list else do not add the current
;;; first to the recursive call
(defun lists(L)
  (cond((null L) nil)
       ((listp (first L)) (cons (first L) (lists (rest L))))
       (T (lists (rest L)))))

;;;PROBLEM 10
;;;FUNCTION NAME: indeH
;;;DESCRIPTION: helper for inde,  builds a list of the indices of the occurances of x in list L
;;;NOTES: helper for inde. if list L is null then return nil, else if the current first equals
;;; x then cons the counter i to the recursive call examining the rest list and increment counter
;;; else do not cons the counter and increment it and examine the rest of the list.
(defun indeH(L x i)
  (cond((null L) nil)
       ((equal x (first L)) (cons i (indeH (rest L) x (+ i 1))))
       (T (indeH (rest L) x (+ i 1)))))

;;;FUNCTION NAME: inde
;;;DESCRIPTION: returns a list of the indices of the occurances of x in L
;;;NOTES: calls indeH as helper and passes in 1 to start counter
(defun inde(x L)
  (indeH L x 1))


;;;PROBLEM 11
;;;FUNCTION NAME: neleH
;;;DESCRIPTION: helper for nele, creates a list conatianing i number of x .
;;;NOTES: heper for nele. If counter i equals 0 then return nil, else cons x to the recursive
;;; call and decrement i.
(defun neleH(x i)
  (cond((equal 0 i) nil)
       (T (cons x (neleH x (- i 1))))))

;;;FUNCTION NAME: neleH
;;;DESCRIPTION: repeates each element in list L n times.
;;;NOTES: if L is null then return nil else append the sublist of a repeated element to the 
;;; recursive call examining the rest of the list.
(defun nele(L n)
  (cond((null L) nil)
       (T (append (neleH (first L) n) (nele (rest L) n)))))

;;;PROBLEM 12
;;;FUNCTION NAME: istrinH
;;;DESCRIPTION: helper for istrin, returns T if number n is triangular
;;;NOTES: if n is 0 then n is a triangular number, else if n < m then n is not triangular,
;;; else recursive call with n - m, and m + 1
(defun istrinH(n m)
  (cond((equal n 0) T)
       ((< n m) nil)
       (T (istrinH (- n m) (+ m 1)))))

;;;FUNCTION NAME: istrin
;;;DESCRIPTION: returns T if n is triangular
;;;NOTES: calls istrinH passes in starting value of 0 for M and user provided n
(defun istrin(n)
  (istrinH n 0))

;;;PROBLEM 13
;;;FUNCTION NAME: countAtom
;;;DESCRIPTION: helper for countEach, returns the number of occurances of a in L
;;;NOTES: L is null then add 0 if a equals first L then increment counter else do not increment
(defun countAtom (a L)
  (cond
   ((null L) 0)
   ((equal a (first L)) (+ 1 (countAtom a (rest L))))
   (t (countAtom a (rest L)))))

;;;FUNCTION NAME: countEach
;;;DESCRIPTION: returns a list of lists in form ((element #_of_occurances)...) analyizing list L
;;;NOTES: if L is null then nil, else cons first of L to the number of occurances that element
;;; the list.
(defun countEach(L)
  (cond((null L) nil)
       (T (cons (list (first L) (countAtom (first L) L)) (countEach (rest L))))))

;;;FUNCTION NAME: findMax
;;;DESCRIPTION: helper for model, returns the number of most occurances
;;;NOTEs: if L is null then x, else if the second element of the current list is greater than
;;; the old max, that is the new max and examine the rest of the list, else do not update max
;;; and examine rest of list.
(defun findMax(L x)
  (cond((null L) x)
       ((> (first (rest (first L))) x) (findMax (rest L) (first (rest (first L)))))
       (T (findMax (rest L) x))))

;;;FUNCTION NAME: simpfilter
;;;DESCRIPTION: a general filter used in model, filter outs elements in list L that do not satisfy predicate F
;;;NOTES: L is null return an empty list, else examine the current first with the generic function and add it
;;; to the list if true, else do not.
(defun simpfilter(F L)
  (cond((null L) '())
       ((funcall F (first L)) (cons (first L) (simpfilter F (rest L))))
       (T (simpfilter F (rest L)))))

;;;FUNCTION NAME: model
;;;DESCRIPTION: returns the mode, a list of lists in the form ((element_that_is_mode #_of_occurances)...)
;;;NOTES: examine the list with the filter against the max value
(defun model(L)
  (simpfilter (lambda (x) (>= (first (rest x)) (findMax (countEach L ) 0))) (countEach L)))

;;;PROBLEM 14
;;;FUNCTION NAME: poplist
;;;DESCRIPTION: builds a list from n to 1
;;;NOTES: if n = 0 then nil, else add n to the list and decrement n.
(defun poplist(n)
  (cond((equal n 0) nil)
       (T (cons n (poplist (- n 1))))))

;;;FUNCTION NAME: permute
;;;DESCRIPTION: permutes lst by consing each element to all permutations of previous elements and repeating.
;;;NOTES: takes and optional arg remain. if null remain the nil, else if null rest of list, create a lits of lst,
;;;else append the mapped first to permuted rest elements to the function call examining the rest of the list
(defun permute (lst &optional (remain lst))
  (cond ((null remain) nil)
        ((null (rest lst)) (list lst))
        (T (append (mapcar (lambda (l) (cons (first lst) l)) (permute (rest lst)))
            (permute (append (rest lst) (list (first lst))) (rest remain))))))

;;;FUNCTION NAME: permu
;;;DESCRIPTION: returns a list of lists of all permuations of n
;;;NOTES: calls permute with list built in poplist
(defun permu (n)
  (permute (poplist n)))


