"""
Module to convert integers to Roman numerals.
"""

VALUE_SYMBOLS = (
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
)


def roman(number):
    """
    Convert an integer to a Roman numeral.

    Parameters:
    number (int): The integer to convert.

    Returns:
    str: The Roman numeral representation of the input integer.
    """
    roman_numbers = []
    remain = number
    for value, symbol in VALUE_SYMBOLS:
        while remain >= value:
            roman_numbers += symbol
            remain -= value
    return "".join(roman_numbers)
