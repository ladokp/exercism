export function valid(input: string): boolean {
  const sanitizedInput = input.replace(/\s/g, '');
  if (!/^\d+$/.test(sanitizedInput) || sanitizedInput.length <= 1) return false;

  let sum = 0;
  let shouldDouble = false;

  for (let index = sanitizedInput.length - 1; index >= 0; index--) {
    let digit = parseInt(sanitizedInput.charAt(index), 10);

    if (shouldDouble) {
      digit *= 2;
      if (digit > 9) digit -= 9;
    }

    sum += digit;
    shouldDouble = !shouldDouble;
  }

  return sum % 10 === 0;
}
