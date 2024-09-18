unit module PhoneNumber;

# A list of possible error messages that can be returned when validating a phone number.
constant @errors = (
   '11 digits must start with 1',          # Error when an 11-digit number does not start with '1'
   'must not be greater than 11 digits',   # Error when the number exceeds 11 digits
   'must not be fewer than 10 digits',     # Error when the number is less than 10 digits
   'letters not permitted',                # Error when the number contains alphabetic characters
   'punctuations not permitted',           # Error when the number contains punctuation marks
   'area code cannot start with zero',     # Error when the area code starts with '0'
   'area code cannot start with one',      # Error when the area code starts with '1'
   'exchange code cannot start with zero', # Error when the exchange code starts with '0'
   'exchange code cannot start with one',  # Error when the exchange code starts with '1'
);

# Cleans and validates a phone number by removing separators and checking for errors.
#
# This function:
# - Removes separators such as spaces, periods, parentheses, hyphens, and plus signs.
# - Validates the phone number based on specific rules (length, area code, exchange code, etc.).
# - Throws an error if any validation rule is violated.
#
# Parameters:
# - $input: A string representing the raw phone number (may contain formatting characters).
#
# Returns:
# - A cleaned string of digits representing the valid phone number.
#
# Throws:
# - An appropriate error message from the @errors constant if validation fails.
sub clean-number ($input) is export {
    number-is-valid( $input.trans( / <[\ .()+-]> / => '' ).comb.List );
}

# Validates the phone number based on specific criteria.
#
# This helper function ensures that:
# - An 11-digit number starts with '1'.
# - The number is exactly 10 digits long after cleaning.
# - The number does not contain letters or punctuation marks.
# - The area code (first digit) does not start with '0' or '1'.
# - The exchange code (fourth digit) does not start with '0' or '1'.
#
# Parameters:
# - $_: A list of characters (digits) representing the phone number after removing separators.
#
# Returns:
# - A string of cleaned digits if the number is valid.
#
# Throws:
# - An appropriate error message from the @errors constant if validation fails.
sub number-is-valid ($_) {
    when .elems == 11 {
        # If 11 digits, the first must be '1'
        when .[0] ≠ 1 { die @errors[0] }
        default { number-is-valid(.[1..*]) }  # Remove the leading '1' and validate the rest
    }

    # Validate number length
    when .elems > 11         { die @errors[1] }
    when .elems ≠ 10         { die @errors[2] }

    # Check for invalid characters
    when .any ~~ /<:letter>/ { die @errors[3] }
    when .any ~~ /<-alnum>/  { die @errors[4] }

    # Validate area code (first digit) and exchange code (fourth digit)
    when .[0] == 0           { die @errors[5] }
    when .[0] == 1           { die @errors[6] }
    when .[3] == 0           { die @errors[7] }
    when .[3] == 1           { die @errors[8] }

    # If all validations pass, return the cleaned phone number as a string
    default { .join }
}
