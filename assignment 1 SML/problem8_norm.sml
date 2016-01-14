
fun indeH(num,L,i) =
    if null(L) then nil else
        if hd(L) = num then i :: indeH(num, tl(L), i+1)
        else indeH(num, tl(L), i+1);

fun inde(num,L) =
    if null(L) then [0] else
        indeH(num,L,1);
        
val thing = [1,1,1,2,3,4,1];

inde(1, thing);
