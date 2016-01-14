size([],0).
size([H|T],N) :- size(T,N1), N is N1+1.

append2([], L, L).
append2([HIT], L, ANS) :-
	append2(T, L ANS2), ANS =[HIAns2].
	
list2num([], 0).
list2num([XIY])