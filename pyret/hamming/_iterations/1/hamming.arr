use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: distance end

import lists as L

fun distance(first-strand, second-strand):
  ask:
    | string-length(first-strand) <> string-length(second-strand) then:
      raise("Strands must be of equal length.")
    | (first-strand == "") and (second-strand <> "") then:
      raise("Strands must be of equal length.")
    | (first-strand <> "") and (second-strand == "") then:
      raise("Strands must be of equal length.")
    | otherwise:
      L.fold2(
        lam(accumulator, element1, element2):
          ask:
            | element1 <> element2 then:
              accumulator + 1
            | otherwise:
              accumulator
          end
        end,
        0,
        string-explode(first-strand),
        string-explode(second-strand))
  end
end
