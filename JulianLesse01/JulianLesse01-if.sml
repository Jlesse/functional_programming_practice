(*problem 1*)
(*FUNCTION NAME:dispnthcHelper *)
(*DESCRIPTION: Helper for dispnthc, moves through each element in the list until 
the specified index is reached and returns the element*)
fun dispnthcHelper(x, num) = 
    if null(x) then #" "
    else if num=1 then hd x
    else dispnthcHelper(tl(x), num-1);

(*FUNCTION NAME:dispnthc *)
(*DESCRIPTION:explodes string s into list and returns the element at num *)
fun dispnthc(s, num) = 
    dispnthcHelper(explode(s), num);

(*problem 2*)
(*FUNCTION NAME:delnthcHelper *)
(*DESCRIPTION: Helper for delnthc, moves through list until the element before
the one to delete and adds the head to the tail of the list*)
fun delnthcHelper (x, n) = 
    if null(x) then nil
    else if n = 2 then hd x :: tl(tl x)
    else hd x :: delnthcHelper(tl x, n-1);

(*FUNCTION NAME:delnthc *)
(*DESCRIPTION:explodes string s into list and returns the string with
the element at index n deleted*)
fun delnthc (s, n) =
    implode(delnthcHelper(explode(s), n));

(*problem 3 *)
(*FUNCTION NAME:multin *)
(*DESCRIPTION:multiplies a by c until c = 0 and puts each result in a list*)   
fun multin([a,b,c]) = 
    if c = 0 then [a]
    else a :: multin([a*b,b,c-1]);

(*problem 4 *)
(*FUNCTION NAME:remv *)
(*DESCRIPTION:removes all appearences of char c from list*)     
fun remv(c, L : string list) =
    if L = nil then nil else
    if c = (hd(L)) then remv(c, tl(L))
    else hd(L) :: remv(c, tl(L));

(*problem 5 *)
(*FUNCTION NAME:remvdubH *)
(*DESCRIPTION:Helper for remvdub, moves through list comparing head to
all elements behind and removes if a match*) 
fun remvdubH(c, L) = 
    if L = nil then nil else
        if c = (hd(L)) then remvdubH(c, tl(L))
        else hd(L) :: remvdubH(c, tl(L));

(*FUNCTION NAME:remvdubH *)
(*DESCRIPTION: removes duplicates elements from a list, by comparing each head
to list behind*) 
fun remvdub(L) =
    if L = nil then nil
    else hd(L) :: remvdub(remvdubH(hd(L),tl(L)));

(*problem 6 *)
(*FUNCTION NAME:int2strH*)
(*DESCRIPTION:Helper for int2strH, converts int to ascii char and puts in list*)
fun int2strH(num) =
    if num = 0 then nil
    else int2strH(num div 10) @ [chr((num mod 10) + 48)] ;

(*FUNCTION NAME:int2str*)
(*DESCRIPTION:converts num into a string*)
fun int2str(num : int) =
    implode(int2strH(num));
    
(*problem 7 *)
(*FUNCTION NAME:string2intH*)
(*DESCRIPTION: Helper for string2int converts ascii to int*)
fun string2intH(L) =
    if null(L) then 0 else
         (string2intH(tl(L))+((ord (hd(L)) - 48)))*10;

(*FUNCTION NAME:string2intH*)
(*DESCRIPTION: reverses a list*)
fun rev(L) =
    if null(L) then nil else
        rev(tl(L)) @ [hd(L)];

(*FUNCTION NAME:string2intH*)
(*DESCRIPTION: converts a string to an int*)
fun string2int(word) = 
    string2intH(rev(explode word)) div 10;

(*problem 8 *)
(*FUNCTION NAME:indeH*)
(*DESCRIPTION: Helper for inde, returns the a list of indices containing num*)
fun indeH(num,L,i) =
    if null(L) then nil else
        if hd(L) = num then i :: indeH(num, tl(L), i+1)
        else indeH(num, tl(L), i+1);

(*FUNCTION NAME:inde*)
(*DESCRIPTION: returns a list of indices containing num begginging at 1*)
fun inde(num,L) =
    if null(L) then [0] else
        indeH(num,L,1);

(*problem 9 *)
(*FUNCTION NAME:occrH*)
(*DESCRIPTION: Helper for occr, returns a list tuples of occurances of an element
with first int tuple the element and the second the numer of occurances*)
fun occrH(a, L) =
    if null(L) then [(a,1)] else
        if a = (#1(hd(L))) then (#1(hd(L)),(#2(hd(L)))+1) :: tl(L)
        else hd(L) :: occrH(a,tl(L)); 

(*FUNCTION NAME:occr*)
(*DESCRIPTION: occr, takes a list and returns a list tuples of occurances of an element*)
fun occr(L) = 
    if null(L) then nil else
        occrH(hd(L), occr(tl(L)));

(*problem 10 *)
(*FUNCTION NAME:neleH*)
(*DESCRIPTION: Helper for nele if counter i is not greater than 
the num then add the head to the list again*)
fun neleH(L, num, i) = 
    if null(L) then nil else
        if i > num then neleH(tl(L), num, 1) else
            hd(L) :: neleH(L,num,i+1);

(*FUNCTION NAME:nele*)
(*DESCRIPTION: Takes a list and a num, if the list is not nil returns a list of
each element repeated num times*)
fun nele(L, num) = 
    if null(L) then nil else
        neleH(L, num, 1);

(*problem 11 *)
(*FUNCTION NAME:addpa*)
(*DESCRIPTION: adds corresponding elements of the two lists*)
fun addpa(L, R) = 
        if null(L) orelse null(R) then nil else
            (hd(L)+hd(R)) :: addpa(tl(L), tl(R));

(*problem 12 *)
(*FUNCTION NAME:isFactH*)
(*DESCRIPTION: Helper for isFact*)
fun isfactH(num , sum , i) = if sum > num then false
    else if sum = num then true
    else isfactH(num, sum*i,i+1);

(*FUNCTION NAME:isFact*)
(*DESCRIPTION: returns true if num is a factorial else false*)
fun isfact(num) = if num = 0 then true else 
    isfactH(num, 1 , 1);

(*problem 13 *)
(*FUNCTION NAME:greatcm*)
(*DESCRIPTION: Helper for ratadd return the gcm of n and d*)
fun greatcm(n, 0) = n
    |greatcm(n, d) = greatcm(d, n mod d);
    
(*FUNCTION NAME:ratadd*)
(*DESCRIPTION: adds two rational numbers and returns simplist form*)
fun ratadd((num1,den1), (num2,den2)) =
    let 
        val numer = ((num1) * (den2)) + ((den1) * (num2))
        val denom = (den1) * (den2)
        val gcm = greatcm(numer,denom)
    in
        ((numer div gcm),(denom div gcm))
    end;
    
(*problem 14 *)
(*FUNCTION NAME:reverse*)
(*DESCRIPTION: Helper spliatH, reverses a list*)
fun reverse(L) = if null(L) then nil else
    reverse(tl(L))@[hd(L)];

(*FUNCTION NAME:spliatH*)
(*DESCRIPTION: Helper for spliat, splits a list into 2 at specified inex ind*)
fun spliatH(L,R,ind,i) =
    if null(R) then spliatH(tl(L),[hd(L)],ind, i+1) else
        if i = ind then [implode(reverse(R)), implode(L)] else
            spliatH(tl(L),hd(L)::R,ind,i+1);

(*FUNCTION NAME:spliat*)
(*DESCRIPTION: splits word into 2 lists at specified index ind*)
fun spliat(word, ind) =
    if ind = 0 then ["", word] else
        spliatH(explode(word),nil,ind,0);

(*problem 15 *)
(*FUNCTION NAME:ins*)
(*DESCRIPTION: insert element n at j*)
fun ins(L,n,j) =
    if null(L) then [n] else
        if j = 1 then n :: L else
            hd(L) :: ins(tl(L),n, j-1);

(*FUNCTION NAME:insH*)
(*DESCRIPTION: Helper for inseach, inserts element n into each position of list L1,
    if R is not empty*)
fun insH(L,R,n,i) = 
    if null(R) then [ins(L,n,i)] else
        ins(L,n,i) :: insH(L,tl(R),n, i+1)

(*FUNCTION NAME:insH*)
(*DESCRIPTION: insert element n into each position in a list*)
fun inseach(n,L) = 
    if null(L) then nil else
        insH(L,L,n,1);


