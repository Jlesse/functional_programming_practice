

fun greatcm(n, 0) = n
    |greatcm(n, d) = greatcm(d, n mod d);

fun ratadd((num1,den1), (num2,den2)) =
    let 
        val numer = ((num1) * (den2)) + ((den1) * (num2))
        val denom = (den1) * (den2)
        val gcm = greatcm(numer,denom)
    in
        ((numer div gcm),(denom div gcm))
    end;
    
    ratadd((2,3),(1,12));
    
