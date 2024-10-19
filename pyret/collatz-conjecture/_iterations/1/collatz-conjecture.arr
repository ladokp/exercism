provide: steps end

fun steps(n :: NumInteger) -> NumInteger:
  fun count-steps(current, acc):
      if current == 1:
        acc
      else if num-modulo(current, 2) == 0:
        count-steps(current / 2, acc + 1)
      else:
        count-steps((3 * current) + 1, acc + 1)
    end
  end

  if n > 0:
    count-steps(n, 0)
  else:
    raise("Only positive numbers are allowed")
  end
end