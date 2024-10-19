export function sum(multiples: number[], N: number): number {
  let result = 0;
  for (let currentNumber = 1; currentNumber < N; currentNumber++) {
    if (multiples.some((multiple) => currentNumber % multiple === 0)) result += currentNumber;
  }
  return result;
}
