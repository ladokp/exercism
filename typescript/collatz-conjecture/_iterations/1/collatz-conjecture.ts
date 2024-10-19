export function steps(count: number): number {
  if (count <= 0 || !Number.isInteger(count)) {
    throw new Error('Only positive integers are allowed');
  }
  if (count === 1) {
    return 0;
  }
  if (count % 2 === 0) {
    return 1 + steps(Math.floor(count/2));
  }
  return 1 + steps(3 * count + 1);
}
