export function compute(left: string, right: string): number {
  if (left.length !== right.length) throw new Error('DNA strands must be of equal length.');
  let distance = 0;
  for (let index = 0; index < left.length; index++) if (left[index] !== right[index]) distance++;
  return distance;
}
