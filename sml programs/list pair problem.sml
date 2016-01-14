val tup = [(1,2),(3,4),(5,6)];

fun addem (x: (int * int) list) = if x = nil then 0
    else (#1 (hd x) + #2 (hd x)) + addem(tl x);
addem(tup);