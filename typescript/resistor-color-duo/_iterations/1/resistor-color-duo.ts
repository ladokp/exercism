export function decodedValue(input: string[]): number {
  const colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"];
  return colors.indexOf(input[0]) * 10 + colors.indexOf(input[1]);
}
