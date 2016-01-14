fun dispnthcH(nil, num) = #" "
    |dispnthcH(x::xs, 1) = x
    |dispnthcH(x::xs,num) = dispnthcH(xs, num-1);
    
fun dispnthc(word, num) = 
    dispnthcH(explode(word),num);
    
dispnthc("abcdef",4);

