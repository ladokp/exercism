object Series {
  // Convert the input string to a list of digits, ensuring all characters are valid digits
  private def digits(s: String): Option[List[Int]] = {
    if (s.forall(_.isDigit)) Some(s.map(_.asDigit).toList)
    else None
  }

  // Generate slices of length `n` from the list of digits
  private def slices(n: Int, digits: List[Int]): List[List[Int]] = {
    digits.sliding(n).toList
  }

  // Compute the largest product for slices of length `n` from the input string `s`
  def largestProduct(n: Int, s: String): Option[Int] = {
    if (n < 0) return None

    digits(s) match {
      case Some(ds) if n == 0 => Some(1)  // Edge case: a span of 0 returns 1 (empty product)
      case Some(ds) if n <= ds.length =>
        val products = slices(n, ds).map(_.product)
        Some(products.max)
      case _ => None
    }
  }
}
