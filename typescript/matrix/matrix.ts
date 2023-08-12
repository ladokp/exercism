export class Matrix {
  private matrix: number[][] = [];
  private transposedMatrix: number[][] = [];
  
  constructor(matrixString: string) {
    const splitted = matrixString.split("\n");
    for (let i = 0; i < splitted.length; i++) {
      this.matrix.push([])
      for (let num of splitted[i].split(" ")) this.matrix[i].push(parseInt(num));
    }
    for(let i = 0; i < this.matrix.length; i++){
      this.transposedMatrix.push([])
      for(let j = 0; j < this.matrix.length; j++)         this.transposedMatrix[i].push(this.matrix[j][i]);
    }
  }

  get rows() {
    return this.matrix;
  }

  get columns(): unknown {    
    return this.transposedMatrix;
  }
}
