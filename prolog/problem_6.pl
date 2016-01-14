/* PROBLEM 6*/
/* FUNCTION NAME: oddths*/
/* DESCRIPTION: removes all non odd elements from a list (first param) */
/* NOTES: if the head is an odd index then do not append the head to recursive result, else
add the head to the recursive result, call the oddths with the tail.*/
oddths([],_,[]).

oddths(L, ANS) :- oddths(L,1, ANS). 
oddths([H|T], I, ANS):- (0 is mod(I, 2) -> ANS = ANS2 ; ANS = [H|ANS2]), I2 is I + 1, oddths(T, I2, ANS2).  