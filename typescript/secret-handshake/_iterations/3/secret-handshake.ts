export function commands(input: number): string[] {
  const ACTIONS = ["wink", "double blink", "close your eyes", "jump"]
  const MOVEMENTS: string[] = [];
  for (let counter = 0; counter < 4; counter++)
    if (input & (1 << counter)) MOVEMENTS.push(ACTIONS[counter]);
  if (input & 0B10000) MOVEMENTS.reverse();
  return MOVEMENTS;
}
