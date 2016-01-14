
    fun occrH(a,nil) = [(a,1)]
    |   occrH(a, (x,y)::zs) = if a=x then (x,y+1)::zs
             else (x,y) :: occrH(a,zs);

    fun occr(nil)   = nil
    |   occr(x::xs) = occrH(x, occr(xs));
    
occr[1,2,1,2,3,2];