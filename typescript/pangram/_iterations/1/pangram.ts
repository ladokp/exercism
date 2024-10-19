export function isPangram(sentence: string): boolean {
  return new Set(sentence
    .toLowerCase()
    .replace(/[^a-z]/g, '')
  ).size === 26
}
