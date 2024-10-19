export function count(input: string): Map<string, number> {
  const inputMap = new Map<string, number>()
  const inputArray = input.trim().toLowerCase().split(/[ ,\n]+/g)

  for (const each of inputArray) {
    const word = each.replace(/[.,!:"&@$%^?]|^'|'$/g, '')
    if (!word) continue
    inputMap.set(word, (inputMap.get(word) || 0) + 1)
  }
  return inputMap
}