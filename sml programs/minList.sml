val z = [2,3,1,6,8];

fun min (x) = 
    if (tl x) = nil
    then hd x
    else
        if (hd x) < (hd(tl x))
        then min((hd x) :: (tl(tl x)))
        else min(tl x);

min(z);