diccionario([c,a,s,a]).
diccionario([c,a,o,s]).
diccionario([c,a,s,a,m,i,e,n,t,o]).
diccionario([d,e]).
diccionario([p,a,p,e,l]).
diccionario([t,r,a,p,o]).
diccionario([a,y,e,r]).

% prediccion(?Texto, ?PalDic)
prediccion(Texto, PalDic) :-
	diccionario(PalDic), 
	append(Texto, _, PalDic).

% distancia_simplificada(+Pal1, +Pal2, ?DistSimp)
distancia_simplificada_aux([],[], Acc, Acc).
distancia_simplificada_aux([H|T1], [H|T2], Acc, Res) :-
	distancia_simplificada_aux(T1, T2, Acc, Res).
distancia_simplificada_aux([H1|T1], [H2|T2], Acc, Res) :-
	H1 \= H2, NewAcc is Acc + 1, 
	distancia_simplificada_aux(T1, T2, NewAcc, Res).
distancia_simplificada(Pal1, Pal2, N) :-
	distancia_simplificada_aux(Pal1, Pal2, 0, N).

%correcion_frase(+Frase, ?FraseCorrecta, ?DistTotal)
correccion_frase_aux([],[], Acc, Acc). 
correccion_frase_aux([HF|TF], [HC|TC], Acc, Res) :-
	diccionario(HC), 
	distancia_simplificada(HF, HC, N), NewAcc is Acc + N, 
	correccion_frase_aux(TF, TC, NewAcc, Res).
correccion_frase(Frase, FraseCorrecta, DistTotal) :-
	correccion_frase_aux(Frase, FraseCorrecta, 0, DistTotal).

% correcciones(+Frase, -Correcciones)
correcciones(Frase, Correcciones) :-
	setof(Dist - Correccion, 
		correccion_frase(Frase, Correccion, Dist), Correcciones).
