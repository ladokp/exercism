type Item = {
  weight: number;
  value: number;
};

export function maximumValue({ maximumWeight, items, }: { maximumWeight: number; items: Item[]; }): number {
  if (items.length === 0) return 0;
  
  const tail = items.slice(1);
  const head = items[0];

  if (maximumWeight < head.weight)
    return maximumValue({ maximumWeight, items: tail });

  return Math.max(
    maximumValue({ maximumWeight, items: tail }),
    head.value +
      maximumValue({
        maximumWeight: maximumWeight - head.weight,
        items: tail,
      })
  );
}