struct Squares {
    let squareOfSum: Int
    let sumOfSquares: Int
    let numbers: [Int]
    var differenceOfSquares: Int {
        squareOfSum - sumOfSquares
    }
    
    init(_ numbersCount: Int) {
        self.numbers = (1...numbersCount).map({ $0 })
        let sum = self.numbers.reduce(0, +)
        self.squareOfSum = sum * sum
        self.sumOfSquares = self.numbers.map({ $0 * $0 }).reduce(0, +)
    }
}
