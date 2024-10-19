export class Triangle {
  sides: Set<number>;
  isValid: boolean;
  
  constructor(...sides: Array<number>) {
    let sidesSum = sides.reduce((a, c) => a + c, 0);
    let sidesMax = Math.max(...sides);
    this.sides = new Set<number>(sides);
    this.isValid = !this.sides.has(0) && sidesSum > 2 * sidesMax ;
  }

  get isEquilateral() {
    return this.isValid && this.sides.size == 1;
  }

  get isIsosceles() {
    return this.isValid && this.sides.size <= 2;
  }

  get isScalene() {
    return this.isValid && this.sides.size == 3;
  }
}
