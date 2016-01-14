  
fun addpa(L, R) = 
        if null(L) orelse null(R) then nil else
            (hd(L)+hd(R)) :: addpa(tl(L), tl(R));
            
addpa([1,3,5,6567],[2,7,4]);