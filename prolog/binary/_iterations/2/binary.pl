digit(48, 0).
digit(49, 1).

binary(Str, Dec) :-
  string_codes(Str, Codes),
  maplist(digit, Codes, L),
  reverse(L, L1),
  bin(L1, Dec).

bin([],0).
bin([X|Xs], R) :- bin(Xs, P), R is X + 2*P.
