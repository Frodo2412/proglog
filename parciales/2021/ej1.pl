% colocar_pieza(+P1, +P2, ?P3)
colocar_pieza_aux([], P, P).
colocar_pieza_aux(P,[], P).
colocar_pieza_aux([X1|T1], [X1|T2], [X1|Res]):-
	colocar_pieza_aux(T1, T2, Res).
colocar_pieza([X|T], P2, [Y|Res]) :-
	nonvar(X), !, X = Y, 
	colocar_pieza(T, P2, Res).
colocar_pieza([X|P1], P2, Res) :-
	var(X), !, 
	colocar_pieza_aux([X|P1], P2, Res).

% resolver_puzzle(+Piezas, ?Solucion)
resolver_puzzle_aux([], Acc, Acc).
resolver_puzzle_aux(Piezas, Acc, Solucion) :-
	select(P, Piezas, Resto), 
	colocar_pieza(P, Acc, SolucionParcial), 
	resolver_puzzle_aux(Resto, SolucionParcial, Solucion).
resolver_puzzle(Piezas, Solucion) :-
	resolver_puzzle_aux(Piezas, [], Solucion).

% puzzle_bien_formado(+Piezas)
puzzle_bien_formado(Piezas) :-
	findall(X, 
		resolver_puzzle(Piezas, X), Soluciones), 
	length(Soluciones, 1).
