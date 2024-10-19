export function find(haystack: number[], needle: number, left: number=0, right: number=(haystack.length-1)): number | never {
  let mid = Math.floor((left + right) / 2)

  switch (true) {
    case haystack[mid] === needle:
      return mid
    case right - left === 0:
      break
    case haystack[mid] < needle:
      return find(haystack, needle, mid+1, right)
    case haystack[mid] > needle:
      return find(haystack, needle, left, mid-1)
  }
  
  throw new Error('Value not in array')
}
