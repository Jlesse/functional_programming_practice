

    fun ins(nil,n,j) = [n]
    |   ins(x::xs,n,1) = n :: x :: xs
    |   ins(x::xs,n,j) = x :: ins(xs,n,j-1);



    fun insH(L,nil,n,i) = [ins(L,n,i)]
    |   insH(L,x::xs,n,i) = ins(L,n,i) :: insH(L,xs,n,i+1);


    fun inseach(n,nil) = nil
    |   inseach(n,L) = insH(L,L,n,1);
    
inseach(2,[1,2]);
    
    
    
    
