use context essentials2020 # Don't delete this line when using Pyret on Exercism 

provide: two-fer end

fun two-fer(name):
  if name == "":
    "One for you, one for me."
  else:
    "One for " + name + ", one for me."
  end
end