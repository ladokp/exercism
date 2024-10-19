use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: abbreviate end

 fun abbreviate(phrase):
  string-split-all(phrase, " ").foldl(
    lam(section, abbreviation):
      abbreviation + string-split-all(string-replace(section, "_", ""), "-").foldl(
        lam(fragment, acc):
            if fragment <> "":
              acc + string-to-upper(string-char-at(fragment, 0))
            else:
              acc
            end
        end,
        "")
    end,
    "")
end