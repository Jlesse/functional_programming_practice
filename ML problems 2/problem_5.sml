
(* FUNCTION NAME:  frontall                     *)
(* DESCRIPTION:    adds a to the front of a list*) 
fun frontall(a, nil) = nil
| frontall(a, x::xs) = (a::x)::frontall(a, xs);

(* FUNCTION NAME:  inseach                     *)
(* DESCRIPTION:    adds a to each postion in a list*)  
fun inseach(a, nil) = [[a]]
| inseach(a, x::xs) = (a::x::xs)::frontall(x,inseach(a, xs));

(* FUNCTION NAME:  putInAll                     *)
(* DESCRIPTION:    interleaves a with each list in R*)  
fun putInAll (a, R) = 
    if null(R) then nil
    else inseach(a, hd(R)) @ putInAll(a, tl(R));

(* FUNCTION NAME:  perm                     *)
(* DESCRIPTION:    interleaves each element in L with all the resulting lists of
previous interleaves*)    
fun perm(L, R ) = 
    if null(L) then R
    else if null(R) then perm(tl(L), [[hd(L)]])
    else perm(tl(L), putInAll(hd(L), R));

(* FUNCTION NAME:  popList                     *)
(* DESCRIPTION:    returns a list of numbers from i to n  *)        
fun popList(n, i) = 
    if i > n then nil
    else i :: popList(n, i+1);    

(* FUNCTION NAME:  permu                     *)
(* DESCRIPTION:    returns a list of lists, each list a permutation of [1,2,3,4] *) 
fun permu(n) = 
    perm(popList(n,1),nil);
    
permu(3);





