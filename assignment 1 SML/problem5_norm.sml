
val thing = [1,4,2,4,6,1,7,1,1,1,2,2,2,90];



fun remvdubH(c, L) = 
    if L = nil then nil else
        if c = (hd(L)) then remvdubH(c, tl(L))
        else hd(L) :: remvdubH(c, tl(L));

fun remvdub(L) =
    if L = nil then nil
    else hd(L) :: remvdub(remvdubH(hd(L),tl(L)));
    
remvdub([1,4,2,4,6,1,7,1,1,1,2,2,2,90]);