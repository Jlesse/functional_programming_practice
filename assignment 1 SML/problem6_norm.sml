
fun int2strH(num) =
    if num = 0 then nil
    else int2strH(num div 10) @ [chr((num mod 10) + 48)] ;

fun int2str(num : int) =
    implode(int2strH(num));
    
int2str(121899);