% l_ld(+L, -LD)
l_ld([], LD-LD).
l_ld([X|L], [X|LD]-LDR) :-
	l_ld(L, LD - LDR).

% ld_l(+LD, -L)
ld_l(LD-[], LD).

% append_ld(+LD1, +LD2, -LD3)
append_ld(A-B, B-BR, A-BR).

% inserta_ld(+L1, +X, -L2)
inserta_ld(L-LR, X, [X|L]-LR).

% insertz_ld(+L1, +X, -L2)
insertz_ld(L-[X|LR], X, L-LR).

% rotacion_ld(+LD1, -LD2)
rotacion_ld([X|L1]-L1R, L2-L2R) :-
	insertz_ld(L1 - L1R, X, L2 - L2R).
