/*----------------INPUT AND OUTPUT------------------*/
prtln(X, Y, Z) :- nl, write('Values: '), write(X), write('----'), write(Y), write('-----'), write(Z), nl.
get_values(X, Y, Z) :- write('Enter 3 words separated by space '),
				read_atom(X), read_atom(Y), read_atom(Z).
show_values :- get_values(X, Y, Z), prtln(X, Y, Z).
/*----------------LIST PROCESSING-------------------*/
reduceL([H | Rest]) :- write('reduced: '), write(Rest), nl, reduceL(Rest).
reduceL([]) :- write(empty), nl. 
input_list :- write('Enter list surrounded by [ and ]. Place a . after ] '), 
				nl, read(L), reduceL(L).
