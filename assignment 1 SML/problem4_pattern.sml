fun remv(c, nil) = nil
    | remv(c, x::xs) = if (c=x) then remv(c, xs)
    else x :: remv(c, xs);
    
val thing = ["a","b","c","a","b","a"];

remv("a", thing);