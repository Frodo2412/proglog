vertice(a).
vertice(b).
vertice(c).
vertice(d).
vertice(e).
vertice(f).
vertice(g).
vertice(h).
vertice(i).

arista(a,c).
arista(b,e).
arista(c,f).
arista(d,h).
arista(h,i).
arista(i,g).
arista(g,h).

% camino(+X, ?Y)
paso(A, B):-
	arista(A, B).
paso(A, B):-
	arista(B, A).
camino_aux(A, B, Visitados):-
	paso(A, B), 
	 \+ member(B, Visitados).
camino_aux(A, B, Visitados) :-
	paso(A, C), 
	 \+ member(C, Visitados), 
	camino_aux(C, B, [C|Visitados]).
camino(A, B) :-
	camino_aux(A, B, []).

% elegir_no_visitado(+Componentes, ?V)

member_subset([S|_], X) :- member(S, X).
member_subset([_|Ss], X) :- member_subset(Ss, X).
elegir_no_visitado(Componentes, V) :-
    vertice(V),
    \+ member_subset(Componentes, V).

% componente_conexa(+V, ?Componente)
componente_conexa(V, Componente) :-
	setof(V2, 
		camino(V, V2), Componente).

% componentes_conexas(?Componentes)
componentes_conexas_aux(Visitados, Res) :-
	elegir_no_visitado(Visitados, V), !,
	componente_conexa(V, Componente), 
	componentes_conexas_aux([Componente|Visitados], Res).
componentes_conexas_aux(Componentes, Componentes).
componentes_conexas(Componentes) :-
	componentes_conexas_aux([], Componentes).