% not_member_ld(+X, ?L)
not_member_ld(_, LD-LD) :-
	var(LD), !.
not_member_ld(X, [Y|T]-LD) :-
	X \= Y, 
	not_member_ld(X, T - LD).

% L = { a^n b^(n^2) }
l-->
	a(N), 
	{M is N*N}, 
	b(M).
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
