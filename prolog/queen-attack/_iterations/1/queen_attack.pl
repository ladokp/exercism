create((X, Y)) :-
    maplist(between(0, 7), [X, Y]).

attack((X, _), (X, _)) :- !.
attack((_, Y), (_, Y)) :- !.
attack((FromX, FromY), (ToX, ToY)) :-
    abs(FromX - ToX) =:= abs(FromY - ToY).
