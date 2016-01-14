fun reverse(nil) = nil
    |reverse(x::xs) = reverse(xs)@[x];


fun spliatH(l::ls, nil, ind, i) = spliatH(ls,[l],ind, i+1)
    |spliatH(l::ls, r::rs, ind, i) = if i = ind then [implode(reverse(r::rs)), implode(l::ls)]
    else spliatH(ls, l::(r::rs),ind, i+1);


fun spliat(word : string, 0 : int) = ["", word]
    |spliat(word , ind) = spliatH(explode(word),nil, ind, 0); 
    
spliat("bigword", 2);