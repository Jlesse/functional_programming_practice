
fun tcount (x) =
    if x = nil then 0
    else if (hd(x) = true) then 1 + tcount(tl(x))
    else tcount(tl(x));

tcount([false, true, false]);