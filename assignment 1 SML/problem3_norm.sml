fun multin([a,b,c]) = 
    if c = 0 then [a]
    else a :: multin([a*b,b,c-1]);

multin[2,3,5];