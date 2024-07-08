% pos_orden(?T, -L)
pos_orden(e, []).
pos_orden(t(R, I, D), Res) :-
	pos_orden(I, Izq), 
	pos_orden(D, Der), 
	append(Izq, Der, ResParcial), 
	append(ResParcial, [R], Res).
