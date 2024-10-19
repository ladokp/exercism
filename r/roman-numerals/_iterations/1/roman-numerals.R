roman <- function(arabic) {
  result   <- c()
  arabics  <- c(1000, 900, 500, 400, 100, 90,
                50, 40, 10, 9, 5, 4, 1)
  romans   <- c("M", "CM", "D", "CD", "C", "XC",
                "L", "XL", "X", "IX", "V", "IV", "I")

  for (index in seq_along(arabics)) {
    current <- arabics[index]
    while (current <= arabic) {
      arabic <- arabic - current
      result <- append(result, romans[index])
    }
  }
  paste(result, sep = "", collapse = "")
}