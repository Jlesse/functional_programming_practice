
fun indeH(num,nil,i) = nil
    |indeH(num,x::xs,i) = if x=num then i :: indeH(num, xs, i+1)
    else indeH(num, xs, i+1);

fun inde(num, nil) = nil
    |inde(num, L) = indeH(num, L, 1);
    
val thing = [1,1,1,2,3,4,1];

inde(1, thing);