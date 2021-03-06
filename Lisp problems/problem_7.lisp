(defun remvdubH(c L)
  (cond((null L) nil)
       ((equal c (first L)) (remvdubH c (rest L)))
       (T (cons (first L) (remvdubH c (rest L))))))

(defun remvdub(L)
  (cond((null L) nil)
       (T (cons (first L) (remvdub (remvdubH (first L) (rest L)))))))

(remvdub '(a b (a) c b (a)))

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

(remvdub2 '(a b (a b) c b (a b)))