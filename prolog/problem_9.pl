/* PROBLEM 9*/
/* FUNCTION NAME: nele*/
/* DESCRIPTION: repeats each element in list L (first param), NUM (second param) times.*/
/* NOTES: when L is null nil is returned, else I is greater than or equal to NUM then pass the tail
to NELE, else add the head to the recursive result and pass in the full list to nele and increment I.*/
nele([],_,_,[]).

nele(L, NUM, ANS) :- nele(L, NUM, 0, ANS).
nele([H|T], NUM, I, ANS) :- I >= NUM -> nele(T, NUM, 0, ANS) ; ANS = [H|ANS2], I2 is I+1, nele([H|T], NUM, I2, ANS2).