export class Squares {
    num : number;
  
    constructor (num: number) {
        this.num = num;
    }
  
    get squareOfSum() {
        return (this.num * (this.num + 1) / 2) ** 2;
    }
  
    get sumOfSquares() {
        return (this.num * (this.num + 1) * (2 * this.num + 1)) / 6;
    }
  
    get difference()  {
        return this.squareOfSum - this.sumOfSquares;
    }
}

export default Squares