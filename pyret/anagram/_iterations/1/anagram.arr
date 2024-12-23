use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: find-anagrams end

fun find-anagrams(phrase, candidates):
  phrase-lowered = string-explode(string-to-lower(phrase))
  candidates.foldl(lam(element, accumulator):
    element-lowered = string-explode(string-to-lower(element))    
    ask:
      | (phrase-lowered <> element-lowered) and (phrase-lowered.sort() == element-lowered.sort())
          then: accumulator.push(element)
      | otherwise: accumulator
    end
  end, [list: ]).reverse()
end
