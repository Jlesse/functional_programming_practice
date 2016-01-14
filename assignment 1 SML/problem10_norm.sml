
fun neleH(L, num, i) = 
    if null(L) then nil else
        if i > num then neleH(tl(L), num, 1) else
            hd(L) :: neleH(L,num,i+1);

fun nele(L, num) = 
    if null(L) then nil else
        neleH(L, num, 1);
        
nele([1,2,3],4);