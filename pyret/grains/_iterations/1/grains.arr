use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: on-square, total end

fun on-square(n):
  ask:
    | n <  1 then: raise("square must be between 1 and 64")
    | n > 64 then: raise("square must be between 1 and 64")
    | otherwise: num-expt(2, n - 1)
  end
end

fun total():
  num-expt(2, 64) - 1
end