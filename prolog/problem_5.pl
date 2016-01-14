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

