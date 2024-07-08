tablero([
    celda(1,3,2), celda(1,4,3), celda(1,5,4),
    celda(2,2,3), celda(2,3,1), celda(2,4,4), celda(2,5,5),
    celda(3,2,2), celda(3,3,6), celda(3,4,5), celda(3,5,6),
    celda(4,1,2), celda(4,2,1), celda(4,3,1), celda(4,5,7)
]).

% adyacente_valido(+T, +I1, +I2, ?J1, ?J2)
adyacente(I, J1, I, J2) :-
	J2 is J1 + 1.
adyacente(I, J1, I, J2) :-
	J2 is J1 - 1.
adyacente(I1, J, I2, J) :-
	I2 is I1 + 1.
adyacente(I1, J, I2, J) :-
	I2 is I1 - 1.
valido(T, I1, J1, I2, J2) :-
	member(
		celda(I1, J1, V1), T), 
	member(
		celda(I2, J2, V2), T), V2 is V1 + 1.
adyacente_valido(T, I1, J1, I2, J2) :-
	adyacente(I1, J1, I2, J2), 
	valido(T, I1, J1, I2, J2).

% viaje(+T, +I1, +J1, ?I2, ?J2, ?C)
viaje_aux(_, I, J, I, J, [(I, J)], _).
viaje_aux(T, I1, J1, I2, J2, [(I1, J1)|Resto], Visitados) :-
	adyacente_valido(T, I1, J1, I3, J3), 
	 \+ member(
		(I3, J3), Visitados), 
	viaje_aux(T, I3, J3, I2, J2, Resto, 
		[(I3, J3)|Visitados]).
viaje(T, I1, J1, I2, J2, C) :-
	member(
		celda(I1, J1, 1), T), 
	viaje_aux(T, I1, J1, I2, J2, C, 
		[(I1, J1)]).

% ciclo(+T, +I1, +J1, ?I2, ?J2, ?C)
ciclo(T, I1, J1, I2, J2, C) :-
	adyacente(I1, J1, I2, J2), 
	viaje(T, I1, J1, I2, J2, C).

% maximo_largo_de_viaje(+T, ?N)
find_max_by_length([], 0).
find_max_by_length([H|T], N1) :-
	length(H, N), 
	find_max_by_length(T, N1), N1 > N.
find_max_by_length([H|T], N) :-
	length(H, N), 
	find_max_by_length(T, N1), N1 =< N.
maximo_largo_de_viaje(T, N) :-
	findall(Camino, 
		viaje(T, I1, J1, _, _, Camino), Caminos), 
	find_max_by_length(Caminos, N).
