class Hamming {
  static compute(left, right) {
    if (left == right && right == "") return 0
    if (left.count != right.count) Fiber.abort("strands must be of equal length")

    return (0...left.count).reduce(0) { |diff, index|
      if (left[index] != right[index]) diff = diff + 1
      return diff
    }
  }
}