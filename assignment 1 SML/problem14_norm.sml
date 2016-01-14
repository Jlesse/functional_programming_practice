


fun reverse(L) = if null(L) then nil else
    reverse(tl(L))@[hd(L)];

fun spliatH(L,R,ind,i) =
    if null(R) then spliatH(tl(L),[hd(L)],ind, i+1) else
        if i = ind then [implode(reverse(R)), implode(L)] else
            spliatH(tl(L),hd(L)::R,ind,i+1);

fun spliat(word, ind) =
    if ind = 0 then ["", word] else
        spliatH(explode(word),nil,ind,0);
        
    
spliat("bigword", 2);
