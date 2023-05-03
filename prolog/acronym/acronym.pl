first_letter(String, FirstLetter):- sub_string(String, 0, 1, _, FirstLetter).

abbreviate(Sentence, Acronym):-
  string_upper(Sentence, Upper),
  split_string(Upper, "-_ ", " -_", Words),
  maplist(first_letter, Words, Initials),
  atomics_to_string(Initials, Acronym).
