export function clean (input: string): string | never {
  if ((/[A-Za-z]/u).test(input)) throw new Error('Letters not permitted');
  if ((/[@:!]/u).test(input)) throw new Error('Punctuations not permitted');
  
  let result = input.replace(/[^\d]/gu, '');
  if (result.length < 10) throw new Error('Incorrect number of digits');
  if (result.length > 11) throw new Error('More than 11 digits');
  if (result.length === 11) {
    if (!result.startsWith('1')) throw new Error('11 digits must start with 1');
    result = result.slice(1);
  }
  
  let digit = result[0];
  if (digit === '0') throw new Error('Area code cannot start with zero');
  if (digit === '1') throw new Error('Area code cannot start with one');
  digit = result[3];
  if (digit === '0') throw new Error('Exchange code cannot start with zero');
  if (digit === '1') throw new Error('Exchange code cannot start with one');
  return result;
}