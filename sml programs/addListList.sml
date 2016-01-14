fun sum (x : int list list) = if x = [[]] then 0
    else if hd(x) = nil
    then sum (tl(x))
    else hd(hd x) + sum ((tl(hd x))::(tl x));
    

val z = [[1,2],[3,4]];    
sum(z);