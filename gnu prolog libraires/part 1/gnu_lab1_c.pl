/*=============DISPLAYING PROLOG TERMS=============*/
/* In STANDARD PROLOG a term can be DISPLAYED by USING the 
PREDICATE write(X), where X is the term to be DISPLAYED. The
following PREDICATE encapsulate the write(X) predicate.   
*/
prtln(X) :- write(X), nl. 

/*============================================================*/
is_diff(X, Y) :- X \= Y.
/*------------------------------------------------------------*/
is_male(kaleem).
is_male(kareem).
is_male(hafiz).
is_male(junaid).
is_male(fahad).
is_male(jamal).
/*-------------------------------------------------------------*/
is_female(shahida).
is_female(zahida).
is_female(afza).
is_female(sabeen).
is_female(muneeba).
is_female(saima).
/*-------------------------------------------------------------*/
is_father(hafiz, kareem).
is_father(junaid, kareem).
is_father(fahad, kaleem).
is_father(jamal, kaleem).

/*----------------------------------------------------------*/
is_father(afza, kareem).
is_father(sabeen, kareem).
is_father(muneeba, kaleem).
is_father(saima, kaleem).
/*----------------------------------------------------------*/
is_wife(kareem, shahida).
is_wife(kaleem, zahida).

is_son(X, Y) :- prtln('testing son'), is_male(Y), is_father(Y, X), prtln(success).
is_daught(X, Y) :- prtln('testing daughter'), is_female(Y), is_father(Y, X), prtln(success).
/*------------------------------------------------------------*/
is_mother(X, Y) :- prtln('testing mother'), is_female(Y), is_wife(T, Y), is_father(X, T), prtln(success).
is_brother(X,  Y) :- prtln('testing brother'), is_male(X), is_male(Y), is_father(X, T), is_father(Y, T),
					is_diff(X, Y), prtln(success).

