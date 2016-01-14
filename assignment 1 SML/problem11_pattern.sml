
fun addpa(nil, nil) = nil
    |addpa(nil, L) = nil
    |addpa(R, nil) = nil
    |addpa(r::rs , l::ls) = (l + r) :: addpa(rs, ls);
    
addpa([1,3,5,6567],[2,7,4]);