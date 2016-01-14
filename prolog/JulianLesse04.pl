/* PROBLEM 1*/
/* FUNCTION NAME: dispnth*/
/* DESCRIPTION: displays the Nth charector specified second param, of list in first param */
/* NOTES: iterates thought the list passing in the tail, until X =1, then returns the head*/
dispnth([H|_],1,H).
dispnth([_|T],N,ANS) :- X is N - 1, dispnth(T, X, ANS).

/* PROBLEM 2*/
/* FUNCTION NAME: delnth*/
/* DESCRIPTION:  Deltes the nth element specified in param 2, from the list in param 1*/
/* NOTES: Appends the head to the result of each recurisve call and decrements N until
N is 1 and then it returns the tail, removing current head from list */
delnth([], _, []).
delnth([H|T], 1, T).
delnth([H|T],N,ANS) :- N1 is N - 1, delnth(T,N1,ANS2), ANS = [H|ANS2].

/* PROBLEM 3*/
/* FUNCTION NAME: remv*/
/* DESCRIPTION: and element that matches the 1st param, from the list in the 2nd param*/
/* NOTES: If the list is nil then return nil, else if the head matches, do not add the head
to the recusive result, else if the does not match, add the head to the recursive result*/
remv(_, [], []).
remv(A, [A|T], ANS) :- remv(A, T, ANS2), ANS = ANS2.
remv(A, [H|T], ANS) :- remv(A, T, ANS2), ANS = [H|ANS2].

/* PROBLEM 4*/
/* FUNCTION NAME: remvdubH*/
/* DESCRIPTION: deletes an element (first param) from the list (2nd param). */
/* NOTES: basically the same as remv in problem 3*/
remvdubH(_, [], []).
remvdubH(C, [C|T], ANS3) :- remvdubH(C, T, ANS3).
remvdubH(C, [H|T], ANS3) :- ANS3 = [H|ANS4], remvdubH(C, T, ANS4).

/* FUNCTION NAME: remvdub*/
/* DESCRIPTION: removes duplicates elements from a list (first param).*/
/* NOTES: Adds the current head to the recursive result, then passes the head to
remvdubH to be removed from the rest of the list, the recusrive call is made passing in
the list resulting from remvdubH.*/
remvdub([], []).
remvdub([H|T], ANS) :- ANS = [H|ANS5], remvdubH(H, T, ANS2), remvdub(ANS2, ANS5).

/* PROBLEM 5*/
/* FUNCTION NAME: max1*/
/* DESCRIPTION: returns the numerically largest element of a list */
/* NOTES: if the list is nil than the current max is the final max, else if the current
head is greater than the current mac then the head is the new max, else the max remains
the same. pass in the tail and the maximum to the recursive call*/
max1([], MAX, MAX).
max1([H|T], MAX, ANS2) :- (H > MAX -> max1(T, H, ANS2) ; max1(T, MAX, ANS2)).

max1([],ANS).
max1([H|T], ANS) :- max1(T, H, ANS).

/* PROBLEM 6*/
/* FUNCTION NAME: oddths*/
/* DESCRIPTION: removes all non odd elements from a list (first param) */
/* NOTES: if the head is an odd index then do not append the head to recursive result, else
add the head to the recursive result, call the oddths with the tail.*/
oddths([],_,[]).

oddths(L, ANS) :- oddths(L,1, ANS). 
oddths([H|T], I, ANS):- (0 is mod(I, 2) -> ANS = ANS2 ; ANS = [H|ANS2]), I2 is I + 1, oddths(T, I2, ANS2).   

/* PROBLEM 7*/
/* FUNCTION NAME: sum1*/
/* DESCRIPTION: sums an integer list including sublists. */
/* NOTES: If the H is a list then add its contents, and add that result to the rest of the outer list,
else add H to the recursive result.*/
sum1([], 0).

sum1([H|T], ANS) :- H = [_|_] -> 
					sum1(H, ANS3), sum1(T, ANS2) , ANS is ANS2 + ANS3 
					; sum1(T, ANS2), ANS is ANS2 + H. 
/* PROBLEM 8*/
/* FUNCTION NAME: inde*/
/* DESCRIPTION: returns a list of the indices of the occurances of X (first param) in L
(second param)*/
/* NOTES: I counts from 1 an increments each time a recursive call is made,
If the head matches X then I is added to the recursvie result. when L is null, nil is returned.*/
inde(_,[],_,[]).

inde(X, L, ANS) :- inde(X, L, 1, ANS).
inde(X, [X|T], I, ANS) :- I2 is I+1, inde(X, T, I2, ANS2), ANS = [I|ANS2].
inde(X, [_|T], I, ANS) :- I2 is I+1, inde(X, T, I2, ANS2), ANS = ANS2.
/* PROBLEM 9*/
/* FUNCTION NAME: nele*/
/* DESCRIPTION: repeats each element in list L (first param), NUM (second param) times.*/
/* NOTES: when L is null nil is returned, else I is greater than or equal to NUM then pass the tail
to NELE, else add the head to the recursive result and pass in the full list to nele and increment I.*/
nele([],_,_,[]).

nele(L, NUM, ANS) :- nele(L, NUM, 0, ANS).
nele([H|T], NUM, I, ANS) :- I >= NUM -> nele(T, NUM, 0, ANS) ; ANS = [H|ANS2], I2 is I+1, nele([H|T], NUM, I2, ANS2).

/* PROBLEM 10*/
/* FUNCTION NAME: Append*/
/* DESCRIPTION: concatinates two lists*/
/* NOTES: Adds the head of L recursively to the result of the function call until nil,
and the 2nd list is returned*/
append([],L,L).
append([H|T],L2,[H|L3])  :-  append(T,L2,L3).

/* FUNCTION NAME: frontall*/
/* DESCRIPTION: adds A to the front of each sublist in a list*/
/* NOTES: adds A to the front of each sublist H, and reinserts that to outer list until no more
sublists are found*/
frontall(_,[],[]).
frontall(A, [H|T], [[A|H]|Ans]):- frontall(A, T, Ans).

/* FUNCTION NAME: inseach*/
/* DESCRIPTION: inserts A into each postion on list, and returns a list of lists.*/
/* NOTES: inserts A into each element of the tail of the list, then inserts the result into
frontall and inserts the current head into the front of the list, then inserts [A, H|T]| to the 
result until the list is nil*/
inseach(A, [], [[A]]).
inseach(A, [H|T], ANS3):- ANS3 = [[A, H|T]|ANS4], frontall(H, ANS5, ANS4), inseach(A, T, ANS5).

/* FUNCTION NAME: putinall*/
/* DESCRIPTION: interleaves A with each H  list in the other list */
/* NOTES: Appends each modified ineach list to the rest until nil*/
putinall(A, [], []).
putinall(A, [H|T], ANS6):- append(L1, L2, ANS6), inseach(A, H, L1), putinall(A, T, L2).

/* FUNCTION NAME: permute*/
/* DESCRIPTION: interleaves each element in L with all the resulting lists of
previous interleaves */
/* NOTES: If the list is null then it returns the other list with sublists of each permutation,
else if R is null it return the first permutation, the current head, else inserts the current head 
 to all previous permutaions to produce the new permutation list and uses that list for the recursive
 call.*/
permute([], R, R).
permute([H|T], [], ANS) :- permute(T, [[H]], ANS).
permute([H|T], R, ANS) :- putinall(H, R, ANS2), permute(T, ANS2, ANS).

/* FUNCTION NAME: popList*/
/* DESCRIPTION: returns a list of numbers n to 1*/
/* NOTES: Adds N to the recursive result, decrements and N and makes recursive call. when N = 0
return []*/
popList(0,[]).
popList(N, ANS):- ANS = [N|ANS2], N1 is N - 1, popList(N1, ANS2).

/* FUNCTION NAME: perm*/
/* DESCRIPTION: returns a list of all permutions of N*/
/* NOTES: builds list with poplist and passes the result to permute, with a nil base to add too*/
perm(N, ANS) :- permute(ANS2, [], ANS), popList(N, ANS2).
