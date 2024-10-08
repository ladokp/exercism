"""
A function to report if a given year is a leap year.
"""


def leap_year(year: int) -> bool:
    """Determine if the specified year is a leap year."""
    return not year & 3 and (year % 25 != 0 or not year & 15)
