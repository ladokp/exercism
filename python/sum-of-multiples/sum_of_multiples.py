def sum_of_multiples(limit, multiples):
    """Return the energy points from level multiples the base values."""
    return sum(i for i in range(1, limit) if any(j for j in multiples if j != 0 and i % j == 0))