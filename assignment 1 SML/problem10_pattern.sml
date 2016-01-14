fun neleH(nil,num,i) = nil
    |neleH(x::xs,num,i) = if i > num then neleH(xs,num,1)
    else x :: neleH(x::xs,num, i+1);

fun nele(nil, num) = nil
    | nele(L, num) = neleH(L,num,1);
    
nele([1,2,3],4);