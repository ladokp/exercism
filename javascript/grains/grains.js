/**
 * You can use the bigint type and BigInt global object to support numbers below
 * Number.MIN_SAFE_INTEGER and above NUMBER.MAX_SAFE_INTEGER.
 *
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt
 */

//
// This is only a SKELETON file for the 'Grains' exercise. It's been provided as a
// convenience to get you started writing code faster.
//
export const square = (number) => {
  if (number < 1 || number > 64) {
    throw new Error('square must be between 1 and 64');
  }
  return BigInt(2) ** BigInt(number - 1);
};

export const total = () => {
  return BigInt(2) ** BigInt(64) - BigInt(1);
};
