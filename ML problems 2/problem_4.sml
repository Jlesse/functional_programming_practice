(*problem 9 *)
(*FUNCTION NAME:occrH*)
(*DESCRIPTION: Helper for occr, returns a list tuples of occurances of an element
with first int tuple the element and the second the numer of occurances*)
fun occrH(a, L) =
    if null(L) then [(a,1)] else
        if a = (#1(hd(L))) then (#1(hd(L)),(#2(hd(L)))+1) :: tl(L)
        else hd(L) :: occrH(a,tl(L)); 

(*FUNCTION NAME:occr*)
(*DESCRIPTION: occr, takes a list and returns a list of tuples of occurances of an element*)
fun occr(L) = 
    if null(L) then nil else
        occrH(hd(L), occr(tl(L)));

(*FUNCTION NAME:modeDupCheck*)
(*DESCRIPTION: checks for duplicate frequencies and adds them to the list*)        
fun modeDupCheck(L : (''a * int) list, R : (''a * int) list) = 
    if null(R) then L
    else if (#2(hd(L)) = #2(hd(R)) andalso #1(hd(L)) <> #1(hd(R)))  then hd(R) :: modeDupCheck(L, tl(R))
    else modeDupCheck(L, tl(R));

(*FUNCTION NAME:modeLH*)
(*DESCRIPTION: returns the a tuple list containing the most frequent element and
it frequency *)
fun modeLH(L : (''a * int) list, n : (''a * int)) = 
    if null(L) then [n]
    else if #2(hd(L)) > #2(n) then modeLH(tl(L), hd(L))
    else modeLH(tl(L), n);
  
(*FUNCTION NAME: modeL*)
(*DESCRIPTION: returns a tuple containing (element, # of occurences) if that
element is the mode*)
fun modeL(L) = 
    modeDupCheck(modeLH(occr(L), (0,~1)), occr(L));
    
modeL([1,1,2,6,6,5,4]);
    



