fun isfactH(num , sum , i) = if sum > num then false
    else if sum = num then true
    else isfactH(num, sum*i,i+1);

fun isfact(0) = true
    |isfact(num) = isfactH(num, 1 , 1);
    
isfact(5040);
    