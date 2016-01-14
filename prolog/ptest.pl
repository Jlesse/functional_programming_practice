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
