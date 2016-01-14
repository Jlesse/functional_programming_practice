/* PROBLEM 2*/
/* FUNCTION NAME: delnth*/
/* DESCRIPTION:  Deltes the nth element specified in param 2, from the list in param 1*/
/* NOTES: Appends the head to the result of each recurisve call and decrements N until
N is 1 and then it returns the tail, removing current head from list */
delnth([], _, []).
delnth([H|T], 1, T).
delnth([H|T],N,ANS) :- N1 is N - 1, delnth(T,N1,ANS2), ANS = [H|ANS2].
