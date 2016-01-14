fun dispnthcHelper(x, num) = 
    if null(x) then #" "
    else if num=1 then hd x
    else dispnthcHelper(tl(x), num-1);

fun dispnthc(s, num) = 
    dispnthcHelper(explode(s), num);
    
dispnthc("Julian", 5);
