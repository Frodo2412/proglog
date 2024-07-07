% solo_pares(+Multilista, ?Pares)
solo_pares_ld([], Pares-Pares).
solo_pares_ld([Num|Resto], [Num|Pares]-RestoPares) :-
	number(Num), 0 is Num mod 2, !, 
	solo_pares_ld(Resto, Pares - PD).
solo_pares_ld([Num|Resto], Pares-RestoPares) :-
	number(Num), !, 
	solo_pares_ld(Resto, Pares - RestoPares).
solo_pares_ld([Lista|RestoListas], Pares-PD2) :-
	solo_pares_ld(Lista, Pares - PD1), 
	solo_pares_ld(RestoListas, PD1 - PD2).
solo_pares(Multilista, Pares) :-
	solo_pares_ld(Multilista, Pares - []).

% a^n b^2n c^3n
s-->
	a(N), 
	{N2 is N + N}, 
	b(N2), 
	{N3 is N2 + N}, 
	c(N3).
a(0)-->
	[].
a(N)-->
	[a], 
	a(M), 
	{N is M + 1}.
b(0)-->
	[].
b(N)-->
	[b], 
	b(M), 
	{N is M + 1}.
c(0)-->
	[].
c(N)-->
	[c], 
	c(M), 
	{N is M + 1}.
