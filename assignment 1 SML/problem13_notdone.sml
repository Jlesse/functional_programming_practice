fun inseachH(n,x::xs) = 
    if n=s then inseachH(n, x :: n :: xs); 

fun inseach(n,nil) = [[n]] 
    |inseach(n,L) = [n::L] :: inseachH(n,L) ;
    

inseach(1,[2,3,4]);