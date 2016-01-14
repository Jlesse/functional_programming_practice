fun multin(nil) = nil
    |multin([a,b,0]) = [a]
    |multin([a,b,c]) = a :: multin([a*b,b,c-1]);

multin[2,3,5];
    