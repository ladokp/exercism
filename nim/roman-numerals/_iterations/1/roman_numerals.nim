const arabicToRoman = {
  1000: "M", 900: "CM", 500: "D", 400: "CD",
   100: "C",  90: "XC",  50: "L",  40: "XL",
    10: "X",   9: "IX",   5: "V",   4: "IV",
     1: "I",
}

func roman*(decimal: int): string =
  result = ""
  var decimal = decimal
  for (arabic, roman) in arabicToRoman:
    while decimal >= arabic:
      decimal -= arabic
      result.add roman