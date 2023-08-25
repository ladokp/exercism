export function find(haystack: number[], needle: number, left: number=0, right: number=(haystack.length-1)): number | never {
  let middle = Math.floor(((right-left)/2) + left)

  switch (true) {
    case haystack[middle] === needle:
      return middle
    case right - left === 0:
      break
    case haystack[middle] < needle:
      return find(haystack, needle, middle+1, right)
    case haystack[middle] > needle:
      return find(haystack, needle, left, middle-1)
  }
  throw new Error('Value not in array')
}
