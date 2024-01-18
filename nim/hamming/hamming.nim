func distance*(s1, s2: string): int =
  if s1.len != s2.len:
    raise(new ValueError)
  for index in 0..<s1.len:
    if s1[index] != s2[index]:
      result += 1

