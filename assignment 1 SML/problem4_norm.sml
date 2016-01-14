
val thing = ["a","b","a","c"];



fun remv(c, L : string list) =
    if L = nil then nil else
    if c = (hd(L)) then remv(c, tl(L))
    else hd(L) :: remv(c, tl(L));
    
remv("a", ["a","b","a","c"]);