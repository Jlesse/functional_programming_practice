fun inseachH(n, nil) = nil
    |inseachH(n, z::x::xs) =
        n::z::x::(z::inseachH(n, x::xs));

fun inseach(n : int, L : int list) =
    inseachH(n,[L]);
    
