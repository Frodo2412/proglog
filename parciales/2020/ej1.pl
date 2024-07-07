% colocacion(+Fichas, ?Col)
orientacion_valida(f(Izq, Der), f(Izq,Der)).
orientacion_valida(f(Izq,Der), f(Der, Izq)).
colocacion_aux(_, _, []).
colocacion_aux(Restantes, X, [f(X, D)|Acc]) :-
	select(F, Restantes, NuevoResto), 
	orientacion_valida(F, 
		f(X, D)), 
	colocacion_aux(NuevoResto, D, Acc).
colocacion([], []).
colocacion(Fichas, [f(I, D)|Colocacion]) :-
	select(F, Fichas, RestoFichas), 
	orientacion_valida(F, 
		f(I, D)), 
	colocacion_aux(RestoFichas, D, Colocacion).

% valor(+Col, ?Val)
valor_aux([], Acc, Acc).
valor_aux([f(I, D)|RestoFichas], Acc, Res) :-
	NewAcc is Acc + I + D, 
	valor_aux(RestoFichas, NewAcc, Res).
valor(Col, Val) :-
	valor_aux(Col, 0, Val).

% mayor_valor(+Fichas, ?Col)
find_max_puntaje([], Max, _, Max).
find_max_puntaje([Col|Resto], CurrentMax, CurrentMaxScore, Max) :-
	valor(Col, NewScore), 
	(
		NewScore > CurrentMaxScore ->
			find_max_puntaje(Resto, Col, NewScore, Max);
		find_max_puntaje(Resto, CurrentMax, CurrentMaxScore, Max)).
mayor_valor(Fichas, Col) :-
	findall(C, 
		colocacion(Fichas, C), Colocaciones), 
	find_max_puntaje(Colocaciones, [], 0, Col).
