/* PROBLEM 7*/
/* FUNCTION NAME: sum1*/
/* DESCRIPTION: sums an integer list including sublists. */
/* NOTES: If the H is a list then add its contents, and add that result to the rest of the outer list,
else add H to the recursive result.*/
sum1([], 0).

sum1([H|T], ANS) :- H = [_|_] -> 
					sum1(H, ANS3), sum1(T, ANS2) , ANS is ANS2 + ANS3 
					; sum1(T, ANS2), ANS is ANS2 + H. 