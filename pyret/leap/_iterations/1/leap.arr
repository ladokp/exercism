use context essentials2020 # Don't delete this line when using Pyret on Exercism

provide: leap end

fun leap(year :: NumInteger) -> Boolean:
  is-divisible-by = lam(divisor): num-modulo(year, divisor) == 0 end
  is-divisible-by(400) or (not(is-divisible-by(100)) and is-divisible-by(4))
end
