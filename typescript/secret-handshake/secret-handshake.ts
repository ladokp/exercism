export function commands(input: number): string[] {
  const movements: string[] = [];
  if (input & 1) movements.push("wink");
  if (input & 2) movements.push("double blink");
  if (input & 4) movements.push("close your eyes");
  if (input & 8) movements.push("jump");
  if (input & 16) movements.reverse();
  return movements;
}
