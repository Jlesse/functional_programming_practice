
ins(A, [], [A]).
ins(A, [H|T], ANS):- A =< H -> ANS = [A, H|T] ; ANS = [H|ANS2], ins(A, T, ANS2).

isort([],[]).
isort([H|T], ANS):-isort(T, ANS), ins(H, T, ANS).
 