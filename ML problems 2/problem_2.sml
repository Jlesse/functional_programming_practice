(* FUNCTION NAME:   CheckString*)
(* DESCRIPTION:  Checks subString against the remaining string for a match *)
fun checkString(subs, word) = 
    if null(subs) then true
    else if hd(subs) = hd(word) then
    checkString(tl(subs), tl(word))
    else false;

(* FUNCTION NAME:  subStringH                   *)
(* DESCRIPTION:    helper for subString*)    
fun subStringH(subs, word, i) = 
    if null(word) then ~1
    else if checkString(subs, word) then i
    else subStringH(subs, tl(word), i+1);

(* FUNCTION NAME:  subString                    *)
(* DESCRIPTION:    checks if subStrings subs is in string word and returns the 
index of the begging of the found subString or else ~1*)    
fun subString(subs, word) = 
    subStringH(explode(subs), explode(word), 0);
    
subString("ab", "aeabaf");