(*FUNCTION NAME:delete *)
(*DESCRIPTION: Helper ssHelper, deletes n from list x*)
(* FUNCTION NAME:  delete                    *)
(* DESCRIPTION:    deletes and element x from the list, and returns the new list *)
fun delete(x : int list, n : int) =
    if null(tl(x)) then nil
    else if null(x) then nil
    else if hd(x) = n then tl(x)
    else if hd(tl(x)) = n then hd x :: tl(tl(x))
    else hd(x) :: delete(tl(x), n);

(* FUNCTION NAME:  ssComp         *)
(* DESCRIPTION: compares n to each element of the list behind it, 
    returns smallest element*)
fun ssComp(n, L) = 
    if null(L) then n
    else if n <= hd(L) then ssComp(n, tl(L))
    else ssComp(hd(L),tl(L));
    
(* FUNCTION NAME:  ssHelper                     *)
(* DESCRIPTION:   helper for ssort takes smallest element from L and adds it
to S until sorted*)
fun ssHelper(S, L) = 
    if null(L) then S
    else if null(S) then ssComp(hd(L), L) :: ssHelper(S, delete(L, ssComp(hd(L), L) ))
    else  ssComp(hd(L), L) :: ssHelper(S, delete(L, ssComp(hd(L), L) ))

(* FUNCTION NAME:  ssort                    *)
(* DESCRIPTION:    sorts and returns list L *)
fun ssort(L) = 
    ssHelper(nil, L);
    

ssort([232,55,6,800,20,9,55]);




