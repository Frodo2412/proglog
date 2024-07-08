% largo_ld(+X, ?N)
largo_ld(LD-LD, 0) :-
	var(LD), !.
largo_ld([_|T]-LD, N) :-
	largo_ld(T - LD, N1), N is N1 + 1.

% ww, w in {0,1}
s--> w(X), X.
w([0|X])--> [0], w(X).
w([1|X])--> [1], w(X). 
