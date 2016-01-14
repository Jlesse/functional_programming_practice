fun delnthcHelper (x, n) = 
    if null(x) then nil
    else if n = 2 then hd x :: tl(tl x)
    else hd x :: delnthcHelper(tl x, n-1);

fun delnthc (s, n) =
    implode(delnthcHelper(explode(s), n));
    
    
delnthc("Julian", 6);