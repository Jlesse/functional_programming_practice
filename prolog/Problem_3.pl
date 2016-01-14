/* PROBLEM 3*/
/* FUNCTION NAME: remv*/
/* DESCRIPTION: and element that matches the 1st param, from the list in the 2nd param*/
/* NOTES: If the list is nil then return nil, else if the head matches, do not add the head
to the recusive result, else if the does not match, add the head to the recursive result*/
remv(_, [], []).
remv(A, [A|T], ANS) :- remv(A, T, ANS2), ANS = ANS2.
remv(A, [H|T], ANS) :- remv(A, T, ANS2), ANS = [H|ANS2].