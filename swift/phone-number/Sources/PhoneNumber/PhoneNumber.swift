enum PhoneNumberError: Error {
  /// Error indicating the phone number is invalid due to incorrect format or invalid digits.
  case invalidPhoneNumber
}

class PhoneNumber {
  /// The phone number string that may include formatting characters.
  var number: String

  /// Initializes a `PhoneNumber` object with a given raw phone number string.
  /// - Parameter phrase: The raw phone number string, which may include non-numeric characters.
  init(_ phrase: String) {
    self.number = phrase
  }

  /// Cleans the phone number by removing any non-numeric characters and validating the number.
  ///
  /// This method removes any separators or non-numeric characters from the phone number.
  /// If the number has 11 digits and starts with '1', the leading '1' is removed, leaving a valid 10-digit number.
  /// The method also checks that:
  /// - The cleaned number is exactly 10 digits long.
  /// - The area code does not start with '0' or '1'.
  /// - The exchange code (the second group of three digits) does not start with '0' or '1'.
  ///
  /// - Throws: `PhoneNumberError.invalidPhoneNumber` if the cleaned number does not conform to the required rules.
  /// - Returns: A cleaned 10-digit phone number string.
  func clean() throws -> String {
    // Remove all non-numeric characters from the phone number
    var cleanNumber = number.filter { $0.isNumber }

    // If the number has 11 digits and starts with '1', remove the leading '1'
    if cleanNumber.count == 11 && cleanNumber.first == "1" {
      cleanNumber.removeFirst()
    }

    // Find the index of the area code (second set of three digits)
    let areaCode = cleanNumber.index(cleanNumber.startIndex, offsetBy: 3)

    // Validate that the cleaned number is exactly 10 digits long
    // and that the area and exchange codes do not start with '0' or '1'
    if cleanNumber.count != 10 ||
      ["0", "1"].contains(cleanNumber.first) ||
      ["0", "1"].contains(cleanNumber[areaCode])
    {
      throw PhoneNumberError.invalidPhoneNumber
    }

    // Return the valid cleaned phone number
    return cleanNumber
  }
}
