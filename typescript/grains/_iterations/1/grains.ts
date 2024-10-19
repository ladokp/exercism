export const square = (square: number) => { 
  if (square < 1 || square > 64) {
    throw "square must be between 1 and 64";
  }  
  return 1n << (BigInt(square) - 1n);
}

export const total = () => {  
  return (1n << 64n) - BigInt(1);
}
