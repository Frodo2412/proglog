diccionario([c,a,s,a]).
diccionario([c,a,o,s]).
diccionario([c,a,s,a,m,i,e,n,t,o]).
diccionario([d,e]).
diccionario([p,a,p,e,l]).
diccionario([t,r,a,p,o]).
diccionario([a,y,e,r]).

% prediccion(?Texto, ?PalDic)
prediccion(Texto, Texto) :-
	diccionario(Texto).

% esLI(L)
esLI(LD-LD) :-
	var(LD), !.
esLI([_|T]) :-
	esLI(T).
