export function proverb(...input: string[]) {
  let result = "";
  if (input.length > 0) {
    for (let index = 1; index < input.length; index++) {
      result += `For want of a ${input[index-1]} the ${input[index]} was lost.\n`;
    }
    result += `And all for the want of a ${input[0]}.`;
  }
  return result;
}
