fun delnthcH(nil, num) = nil
    | delnthcH(x::xs, 1) = xs
    | delnthcH(x::xs,num) = x :: (delnthcH(xs,num-1));
    
fun delnthc(word,num) =
    implode(delnthcH(explode(word), num));
    
delnthc("abcdef", 3);
    