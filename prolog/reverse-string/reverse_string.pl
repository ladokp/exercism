string_reverse(Str, Rev) :-
  string_codes(Str, CStr),
  reverse(CStr, CRev),
  string_codes(Rev, CRev).
