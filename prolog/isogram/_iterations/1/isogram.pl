isogram(S) :-
    string_lower(S, Lower),
    string_chars(Lower, Chars),
    include(alnum, Chars, Alnum),
    no_dupes(Alnum).

no_dupes(L) :-
    msort(L, Sorted),
    sort(L, Sorted).

alnum(C) :-
    char_type(C, alnum).