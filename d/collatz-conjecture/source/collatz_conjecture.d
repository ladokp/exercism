module collatz_conjecture;

pure int steps(immutable int number)
{
    if (number < 1) throw new Exception("Only positive integers are allowed");

    int result = 0;
    int n = number;

    while (n > 1)
    {
        result++;
        if (n % 2 == 0) n /= 2;
        else n = 3 * n + 1;
    }

    return result;
}

unittest
{
    import std.exception : assertThrown;

    const int allTestsEnabled = 0;

    // Zero steps for one
    assert(steps(1) == 0);

    static if (allTestsEnabled)
    {
        // Divide if even
        assert(steps(16) == 4);

        // Even and odd steps
        assert(steps(12) == 9);

        // Large number of even and odd steps
        assert(steps(1000000) == 152);

        // Zero is an error
        assertThrown(steps(0));

        // Negative value is an error
        assertThrown(steps(-15));
    }
}
