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