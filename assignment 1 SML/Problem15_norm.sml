

fun ins(L,n,j) =
    if null(L) then [n] else
        if j = 1 then n :: L else
            hd(L) :: ins(tl(L),n, j-1);

fun insH(L,R,n,i) = 
    if null(R) then [ins(L,n,i)] else
        ins(L,n,i) :: insH(L,tl(R),n, i+1)

fun inseach(n,L) = 
    if null(L) then nil else
        insH(L,L,n,1);

    
inseach(4,[1,2,3]);
  