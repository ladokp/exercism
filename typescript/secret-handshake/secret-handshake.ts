export function commands(input: number): string[] {
  const movements: string[] = [];
  if (input & 0B00001) movements.push("wink");
  if (input & 0B00010) movements.push("double blink");
  if (input & 0B00100) movements.push("close your eyes");
  if (input & 0B01000) movements.push("jump");
  if (input & 0B10000) movements.reverse();
  return movements;
}
