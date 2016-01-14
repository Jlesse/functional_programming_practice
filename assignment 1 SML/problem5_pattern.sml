fun remvdubH(c, nil) = nil
    | remvdubH(c, x::xs) = if (c=x) then remvdubH(c, xs)
    else x :: remvdubH(c, xs);

fun remvdub(nil) = nil
    | remvdub(x::xs) = x :: remvdub(remvdubH(x, xs));

val thing = [1,4,2,4,6,1,7,1,1,1,2,2,2,90];

remvdub(thing);