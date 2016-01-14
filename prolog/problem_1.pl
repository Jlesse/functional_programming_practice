/* PROBLEM 1*/
/* FUNCTION NAME: dispnth*/
/* DESCRIPTION: displays the Nth charector specified second param, of list in first param */
/* NOTES: iterates thought the list passing in the tail, until X =1, then returns the head*/
dispnth([H|_],1,H).
dispnth([_|T],N,ANS) :- X is N - 1, dispnth(T, X, ANS).
