/*=======================A SIMPLE PROLOG PROGRA================
The SIMPLEST PROLOG PROGRAM would CONSIST of a SET of PREDICATES. 
A PREDICATE may be a FACT or a RULE. A RULE is DIVIDED into TWO
PARTS. The LEFT PART is the HEAD of the RULE and is COMPOSED of
a FUNCTOR and a LIST of ARGUMENTS. The FUNCTOR is the NAME which 
must be used for CALLING the PREDICATE along with its ARGUMENTS.
A PREDICATE can have ZERO or MORE ARGUMENTS. The RIGHT PART of
a RULE is the BODY of the RULE and CONSISTS of a GROUP of ITEMS.
Quite often, an ITEM in the BODY of a PREDICATE may be a CALL
to ANOTHER PREDICATE or a RECURSIVE CALL to the SAME PREDICATE.
An example of a PREDICATE(RULE) is ' show_v(X, Y) :- write(X), 
nl, write(Y), nl.'. This PREDICATE has the FUNCTOR 'show_v' 
and ARGUMENTS X and Y. Its BODY contains CALLS to the BUILT-IN
PREDICATE write/1 of PROLOG. The OPERATOR ':-' is PLACED between
the HEAD and BODY of ANY PREDICATE that is a RULE. 'pred/n' is
a SHORT FORM REPRESENTATION of ANY PREDICATE for which the
NUMBER of ARGUMENTS is n and which has 'pred' as its FUNCTOR.

A FACT is a SPECIAL TYPE of PREDICATE which has a head but 
DOES NOT have a BODY. 
*/

/*--------------------------FACTS------------------------------*/
f_likes(shahid, shariq).
f_likes(shahid, ghalib).
f_likes(shariq, hamid).
f_likes(hamid, hashim).
f_likes(naseem, naeem).
/*--------------------------------*/
f_pats(shahid, hamid).
f_pats(shahid, ghalib).
f_pats(naseem, naeem).
/*---------------------------RULES-------------------------*/
likes(X, Y) :- f_likes(X, Y).
likes(X, Y) :- f_likes(X, A), likes(A, Y).
loves(X, Y) :- f_likes(X, Y).
loves(X, Y) :- f_pats(X, Y).
/*---------------------A GOOD EXAMPLE----------------------*/
works_for(shahid, Y) :- f_likes(naseem, Y).
/*----------------------ASSIGNMENT-------------------------*/
makes(X, Y) :- X = gibran, Y = marwan.
/*--------------------------USE of OR OPERATOR--------------*/
or_test(X, Y) :- f_likes(shahid, X); f_pats(Y, naeem).
/*----------------------USE OF COMPLEX TERMS-----------------------*/
f_plays(ball(red, dia(6)), bat(metal), cap).
f_plays(ball(green, dia(4)), bat(wood, teak), helmet).
f_weeps(talk, tears(good), [cry, scream, faint]).
/*-----------------------ARITHMETIC---------------------*/
add8(X, Y) :- Y is X + 2 + 6.
wrong_add8(X, Y) :- Y = X + 2 + 6.