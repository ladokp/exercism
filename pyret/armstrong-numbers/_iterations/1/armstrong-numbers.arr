use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: is-armstrong-number end

fun is-armstrong-number(number :: NumInteger) -> Boolean:
  digits = number ^ num-to-string(_) ^ string-explode(_)
  number == digits.foldl(
    lam(element, accumulator):
      cases(Option) string-to-number(element):
        | some(digit) => accumulator + num-expt(digit,  digits.length())
      end
    end,
    0)
end
