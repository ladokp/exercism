module armstrong_numbers;

import std.algorithm.iteration : map, sum;
import std.conv : to;

pure bool isArmstrongNumber(immutable int number)
{
    immutable string s = number.to!string;
    immutable auto sum = s.map!(a => a.to!string
            .to!int ^^ s.length).sum;
    return sum == number;
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Zero is an Armstrong number
    assert(isArmstrongNumber(0));

    static if (allTestsEnabled)
    {
        // Single digit numbers are Armstrong numbers
        assert(isArmstrongNumber(5));

        // There are no 2 digit Armstrong numbers
        assert(!isArmstrongNumber(10));

        // Three digit number that is an Armstrong number
        assert(isArmstrongNumber(153));

        // Three digit number that is not an Armstrong number
        assert(!isArmstrongNumber(100));

        // Four digit number that is an Armstrong number
        assert(isArmstrongNumber(9474));

        // Four digit number that is not an Armstrong number
        assert(!isArmstrongNumber(9475));

        // Seven digit number that is an Armstrong number
        assert(isArmstrongNumber(9926315));

        // Seven digit number that is not an Armstrong number
        assert(!isArmstrongNumber(9926314));
    }
}
