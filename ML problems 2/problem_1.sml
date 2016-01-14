(* FUNCTION NAME:  rev              *)
(* DESCRIPTION:    reverses a List L*)
fun rev(L, R) = 
    if null(L) then R
    else rev(tl(L), hd(L)::R);

(* FUNCTION NAME:  StringTokenizerH                   *)
(* DESCRIPTION:    Helper function for StringTokenizer*)
fun stringTokenH(L, X, R, d) = 
    if null(L) then nil
    else if null(tl(L)) then implode(rev(hd(L)::X, nil))::R
    else if (hd(L) = d) then stringTokenH(tl(L),nil,implode(rev(X,nil))::R,d)
    else stringTokenH(tl(L),hd(L)::X,R,d);


(* FUNCTION NAME:  StringTokenizer                    *)
(* DESCRIPTION:    Takes a string and breaks it into multiple strings
    specified by delimiter d*)
fun stringTokenizer(word, d) = 
    rev(stringTokenH(explode(word),nil,nil,d),nil);

stringTokenizer("this is terrible", #" ");