use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: egg-count end

fun egg-count(n):
  rec counter = lam(num, count):
    ask:
      | num == 0 then:
        count
      | otherwise:
        counter(num-floor(num / 2), count + num-modulo(num, 2))
    end
  end
  counter(n, 0)
end
