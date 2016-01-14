val z = [6.0,5.0,7.0,1.0,4.0];
val y = [1.0];


fun greater (x :real list) =
    if null(tl x)
    then hd x
    else
    if (hd x)> (hd(tl x))
    then greater (((hd x)::(tl(tl x))))
    else greater(tl x);

greater(z);
