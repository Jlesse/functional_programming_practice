(*problem 15 *)
(*FUNCTION NAME:ins*)
(*DESCRIPTION: insert element n at j*)
fun ins(L,n,j) =
    if null(L) then [n] else
        if j = 1 then n :: L else
            hd(L) :: ins(tl(L),n, j-1);

(*FUNCTION NAME:insH*)
(*DESCRIPTION: Helper for inseach, inserts element n into each position of list L1,
    if R is not empty*)
fun insH(L,R,n,i) = 
    if null(R) then [ins(L,n,i)] else
        ins(L,n,i) :: insH(L,tl(R),n, i+1)

(*FUNCTION NAME:insH*)
(*DESCRIPTION: insert element n into each position in a list*)
fun interleave(n,L) = 
    if null(L) then nil else
        insH(L,L,n,1);

(*problem 5 *)
(*FUNCTION NAME:remvdubH *)
(*DESCRIPTION:Helper for remvdub, moves through list comparing head to
all elements behind and removes if a match*) 
fun remvdubH(c, nil) = nil
    | remvdubH(c, x::xs) = if (c=x) then remvdubH(c, xs)
    else x :: remvdubH(c, xs);

(*FUNCTION NAME:remvdub *)
(*DESCRIPTION: removes duplicates elements from a list, by comparing each head
to list behind*) 
fun remvdub(nil) = nil
    | remvdub(x::xs) = x :: remvdub(remvdubH(x, xs));
    
(* FUNCTION NAME:  popList                     *)
(* DESCRIPTION:    returns a list of numbers from i to n  *)        
fun popList(n, i) = 
    if i > n then nil
    else i :: popList(n, i+1);
    
fun pHelper(n,x, L) = 
    if n < x then nil
    else interleave(x,L) :: remvdub(pHelper(n, x+1, remvdub(L)));  

fun permu(n) = 
    pHelper(n,1, popList(n,1));
    
permu(4);