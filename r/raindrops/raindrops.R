raindrops <- function(number, divisors = list(Pling = 3, Plang = 5, Plong = 7)) {
  noises <- names(divisors)[number %% unlist(divisors) == 0]
  if (length(noises) > 0) {
    paste(noises, collapse="")
  } else {
    as.character(number)
  }
}