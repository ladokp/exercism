"""
Compute the prime factors of a given natural number.
A prime number is only evenly divisible by itself and 1.
"""


def factors(value: int) -> list[int]:
    factors = []

    while value != 1:
        for i in range(2, value + 1):
            if value % i == 0:
                factors.append(i)
                value //= i
    return factors