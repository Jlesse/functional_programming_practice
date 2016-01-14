(* FUNCTION NAME:  filter                     *)
(* DESCRIPTION:    a generic filter that takes a two parameter predicate  *)
fun filter(P, nil) = nil
    |filter(P, x::xs) = 
        if P(x,2) then x::filter(P, xs)
        else filter(P, xs);

(* FUNCTION NAME:  popList                     *)
(* DESCRIPTION:    returns a list of numbers from 2 to n  *)        
fun popList(n, i) = 
    if i > n then nil
    else i :: popList(n, i+1);

(* FUNCTION NAME:  primeTestH                     *)
(* DESCRIPTION:    compares n to every number 2 to n-1 to see if its prime  *)   
fun primeTestH(n,x) = 
    if x = n then true
    else if (n mod x) = 0 then false
    else primeTestH(n, x+1);

(* FUNCTION NAME:  plist                     *)
(* DESCRIPTION:    returns a list of prime numbers up to n  *)
fun plist(n) =
        if n < 2 then nil
        else filter(primeTestH, popList(n, 2));

plist(20);
