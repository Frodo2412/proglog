insert(X, [], [X]).
insert(X, [H|T], [X, H|T]) :- X =< H.
insert(X, [H|T], [H | T1]) :- X > H, insert(X, T, T1).

insert_sort_acc([], Acc, Acc).
insert_sort_acc([H|T], Acc, Sorted) :-
    insert(H, Acc, NewAcc), insert_sort_acc(T, NewAcc, Sorted).

insert_sort(List, Sorted) :- insert_sort_acc(List, [], Sorted).



split([], [], []).
split([X], [X], []).
split([X, Y | T], [X|L1], [Y|L2]) :- split(T, L1, L2).

merge([], L, L).
merge(L, [], L).
merge([X|T1], [Y|T2], [X |Tail]) :- 
    X =< Y, merge(T1, [Y|T2], Tail).
merge([X|T1], [Y|T2], [Y|Tail]) :- 
    X > Y, merge([X|T1], T2, Tail).

merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, Sorted) :-
    List = [_,_|_],
    split(List, L1, L2),
    merge_sort(L1, S1), 
    merge_sort(L2, S2), 
    merge(S1, S2, Sorted).



split_by(_, [], [], [], []).
split_by(X, [Y | List], Lower, [Y | Equal], Higher) :- 
    X is Y,
    split_by(X, List, Lower, Equal, Higher). 
split_by(X, [Y | List], [Y | Lower], Equal, Higher) :- 
    X < Y,
    split_by(X, List, Lower, Equal, Higher). 
split_by(X, [Y | List], Lower, Equal, [Y | Higher]) :- 
    X > Y,
    split_by(X, List, Lower, Equal, Higher).

quick_sort([], []).
quick_sort([X|T], Sorted) :-
    split_by(X, [X|T], Higher, Equal, Lower),
    quick_sort(Higher, SortedH),
    quick_sort(Lower, SortedL),
    append(SortedL, Equal, Res1),
    append(Res1, SortedH, Sorted).
    



