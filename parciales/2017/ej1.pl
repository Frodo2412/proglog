invitados([ana, juan, pedro, claudia, pablo, gabriela, maria, carlos, sofia, luis, laura, andres, fernanda]).

% Group 1
conoce(ana, juan).
conoce(juan, pedro).
conoce(pedro, claudia).
conoce(claudia, ana).

% Group 2
conoce(pablo, gabriela).
conoce(gabriela, maria).
conoce(maria, pablo).

% Group 3
conoce(carlos, sofia).
conoce(sofia, luis).
conoce(luis, laura).
conoce(laura, carlos).

% Group 4
conoce(andres, fernanda).
conoce(fernanda, andres).

% asignacion_mesas(+Mesas, ?Asignacion)
asignar_mesa(Restantes, 0, [], Restantes).
asignar_mesa([H|T], Mesa, [H|Rec], Restantes) :-
	Mesa > 0, NewMesa is Mesa - 1, 
	asignar_mesa(T, NewMesa, Rec, Restantes).
asignar_mesa([H|T], Mesa, Rec, [H|Restantes]) :-
	Mesa > 0, 
	asignar_mesa(T, Mesa, Rec, Restantes).
asignacion_mesas_aux([], [], []).
asignacion_mesas_aux(Invitados, [Mesa|RestoMesas], [Asignados|Recc]) :-
	asignar_mesa(Invitados, Mesa, Asignados, Restantes), 
	asignacion_mesas_aux(Restantes, RestoMesas, Recc).
asignacion_mesas(Mesas, Asignacion) :-
	invitados(Invitados), 
	asignacion_mesas_aux(Invitados, Mesas, Asignacion).

% asignacion_valida(+Mesas, ?Asignacion)
tiene_conocido(Invitado, Mesa) :-
	select(OtroInvitado, Mesa, _), 
	conoce(Invitado, OtroInvitado).
mesa_valida(Mesa) :-
	forall(
		select(Invitado, Mesa, RestoInvitados), 
		tiene_conocido(Invitado, RestoInvitados)).
asignacion_valida([]).
asignacion_valida([Mesa|Resto]) :-
	mesa_valida(Mesa), 
	asignacion_valida(Resto).
asignacion_valida(Mesas, Asignacion) :-
	asignacion_mesas(Mesas, Asignacion), 
	asignacion_valida(Asignacion).

