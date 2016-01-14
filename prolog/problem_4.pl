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