
fun occrH(a, L) =
    if null(L) then [(a,1)] else
        if a = (#1(hd(L))) then (#1(hd(L)),(#2(hd(L)))+1) :: tl(L)
        else hd(L) :: occrH(a,tl(L)); 

fun occr(L) = 
    if null(L) then nil else
        occrH(hd(L), occr(tl(L)));

occr([11,1,1])
