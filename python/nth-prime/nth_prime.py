def prime(number):
    """get nth prime."""
    if number < 1:
        raise ValueError("there is no zeroth prime")
    count = 2
    prime_count = 0
    while True:
        isprime = all(
            count % candidate != 0
            for candidate in range(2, int(count**0.5 + 1))
        )
        if isprime:
            prime_count += 1
        if prime_count == number:
            return count
        count += 1
