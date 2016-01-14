(*problem 1*)
(*FUNCTION NAME:dispnthcH *)
(*DESCRIPTION: Helper for dispnthc, moves through each element in the list until 
the specified index is reached and returns the element*)
fun dispnthcH(nil, num) = #" "
    |dispnthcH(x::xs, 1) = x
    |dispnthcH(x::xs,num) = dispnthcH(xs, num-1);


(*FUNCTION NAME:dispnthc *)
(*DESCRIPTION:explodes string s into list and returns the element at num *)
fun dispnthc(word, num) = 
    dispnthcH(explode(word),num);

(*problem 2*)
(*FUNCTION NAME:delnthcH *)
(*DESCRIPTION: Helper for delnthc, moves through list until the element before
the one to delete and adds the head to the tail of the list*)
fun delnthcH(nil, num) = nil
    | delnthcH(x::xs, 1) = xs
    | delnthcH(x::xs,num) = x :: (delnthcH(xs,num-1));
    
(*FUNCTION NAME:delnthc *)
(*DESCRIPTION:explodes string word into list and returns the string with
the element at index num deleted*)
fun delnthc(word,num) =
    implode(delnthcH(explode(word), num));

(*problem 3 *)
(*FUNCTION NAME:multin *)
(*DESCRIPTION:multiplies a by c until c = 0 and puts each result in a list*)   
fun multin(nil) = nil
    |multin([a,b,0]) = [a]
    |multin([a,b,c]) = a :: multin([a*b,b,c-1]);

(*problem 4 *)
(*FUNCTION NAME:remv *)
(*DESCRIPTION:removes all appearences of char c from list*)     
fun remv(c, nil) = nil
    | remv(c, x::xs) = if (c=x) then remv(c, xs)
    else x :: remv(c, xs);

(*problem 5 *)
(*FUNCTION NAME:remvdubH *)
(*DESCRIPTION:Helper for remvdub, moves through list comparing head to
all elements behind and removes if a match*) 
fun remvdubH(c, nil) = nil
    | remvdubH(c, x::xs) = if (c=x) then remvdubH(c, xs)
    else x :: remvdubH(c, xs);

(*FUNCTION NAME:remvdub *)
(*DESCRIPTION: removes duplicates elements from a list, by comparing each head
to list behind*) 
fun remvdub(nil) = nil
    | remvdub(x::xs) = x :: remvdub(remvdubH(x, xs));

(*problem 6 *)
(*FUNCTION NAME:int2strH*)
(*DESCRIPTION:Helper for int2strH, converts int to ascii char and puts in list*)
fun int2strH(0) = nil
    | int2strH(num) = int2strH(num div 10) @ [chr((num mod 10) + 48)] ;

(*FUNCTION NAME:int2str*)
(*DESCRIPTION:converts num into a string*)
fun int2str(num : int) =
    implode(int2strH(num));
    
(*problem 7 *)
(*FUNCTION NAME:string2intH*)
(*DESCRIPTION: Helper for string2int converts ascii to int*)
fun string2intH (nil) = 0 
    |   string2intH(x::xs) = (string2intH(xs) + ((ord x) - 48))*10;

(*FUNCTION NAME:rev*)
(*DESCRIPTION: reverses a list*)
fun rev (nil) = nil 
    | rev (x::xs) = rev xs @ [x];

(*FUNCTION NAME:string2int*)
(*DESCRIPTION: converts a string to an int*)
fun string2int("") = 0 
    | string2int(word) = string2intH(rev (explode word)) div 10;

(*problem 8 *)
(*FUNCTION NAME:indeH*)
(*DESCRIPTION: Helper for inde, returns the a list of indices containing num*)
fun indeH(num,nil,i) = nil
    |indeH(num,x::xs,i) = if x=num then i :: indeH(num, xs, i+1)
    else indeH(num, xs, i+1);

(*FUNCTION NAME:inde*)
(*DESCRIPTION: returns a list of indices containing num begginging at 1*)
fun inde(num, nil) = nil
    |inde(num, L) = indeH(num, L, 1);

(*problem 9 *)
(*FUNCTION NAME:occrH*)
(*DESCRIPTION: Helper for occr, returns a list tuples of occurances of an element
with first int tuple the element and the second the numer of occurances*)
fun occrH(a,nil) = [(a,1)]
    |   occrH(a, (x,y)::zs) = if a=x then (x,y+1)::zs
             else (x,y) :: occrH(a,zs);

(*FUNCTION NAME:occr*)
(*DESCRIPTION: occr, takes a list and returns a list tuples of occurances of an element*)
    fun occr(nil)   = nil
    |   occr(x::xs) = occrH(x, occr(xs));

(*problem 10 *)
(*FUNCTION NAME:neleH*)
(*DESCRIPTION: Helper for nele if counter i is not greater than 
the num then add the head to the list again*)
fun neleH(nil,num,i) = nil
    |neleH(x::xs,num,i) = if i > num then neleH(xs,num,1)
    else x :: neleH(x::xs,num, i+1);

(*FUNCTION NAME:nele*)
(*DESCRIPTION: Takes a list and a num, if the list is not nil returns a list of
each element repeated num times*)
fun nele(nil, num) = nil
    | nele(L, num) = neleH(L,num,1);

(*problem 11 *)
(*FUNCTION NAME:addpa*)
(*DESCRIPTION: adds corresponding elements of the two lists*)
fun addpa(nil, nil) = nil
    |addpa(nil, L) = nil
    |addpa(R, nil) = nil
    |addpa(r::rs , l::ls) = (l + r) :: addpa(rs, ls);

(*problem 12 *)
(*FUNCTION NAME:isFactH*)
(*DESCRIPTION: Helper for isFact*)
fun isfactH(num , sum , i) = if sum > num then false
    else if sum = num then true
    else isfactH(num, sum*i,i+1);

(*FUNCTION NAME:isfact*)
(*DESCRIPTION: returns true if num is a factorial else false*)
fun isfact(0) = true
    |isfact(num) = isfactH(num, 1 , 1);

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
fun reverse(nil) = nil
    |reverse(x::xs) = reverse(xs)@[x];

(*FUNCTION NAME:spliatH*)
(*DESCRIPTION: Helper for spliat, splits a list into 2 at specified inex ind*)
fun spliatH(l::ls, nil, ind, i) = spliatH(ls,[l],ind, i+1)
    |spliatH(l::ls, r::rs, ind, i) = if i = ind then [implode(reverse(r::rs)), implode(l::ls)]
    else spliatH(ls, l::(r::rs),ind, i+1);

(*FUNCTION NAME:spliat*)
(*DESCRIPTION: splits word into 2 lists at specified index ind*)
fun spliat(word : string, 0 : int) = ["", word]
    |spliat(word , ind) = spliatH(explode(word),nil, ind, 0);

(*problem 15 *)
(*FUNCTION NAME:ins*)
(*DESCRIPTION: insert element n at j*)
    fun ins(nil,n,j) = [n]
    |   ins(x::xs,n,1) = n :: x :: xs
    |   ins(x::xs,n,j) = x :: ins(xs,n,j-1);

(*FUNCTION NAME:insH*)
(*DESCRIPTION: Helper for inseach, inserts element n into each position of list L,
    if xs is not empty*)
    fun insH(L,nil,n,i) = [ins(L,n,i)]
    |   insH(L,x::xs,n,i) = ins(L,n,i) :: insH(L,xs,n,i+1);


(*FUNCTION NAME:inseach*)
(*DESCRIPTION: insert element n into each position in a list*)
    fun inseach(n,nil) = nil
    |   inseach(n,L) = insH(L,L,n,1);


