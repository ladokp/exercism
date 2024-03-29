# All Your Base

Welcome to All Your Base on Exercism's WebAssembly Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Convert a number, represented as a sequence of digits in one base, to any other base.

Implement general base conversion. Given a number in base **a**,
represented as a sequence of digits, convert it to base **b**.

## Note

- Try to implement the conversion yourself.
  Do not use something else to perform the conversion for you.

## About [Positional Notation](https://en.wikipedia.org/wiki/Positional_notation)

In positional notation, a number in base **b** can be understood as a linear
combination of powers of **b**.

The number 42, _in base 10_, means:

(4 _ 10^1) + (2 _ 10^0)

The number 101010, _in base 2_, means:

(1 _ 2^5) + (0 _ 2^4) + (1 _ 2^3) + (0 _ 2^2) + (1 _ 2^1) + (0 _ 2^0)

The number 1120, _in base 3_, means:

(1 _ 3^3) + (1 _ 3^2) + (2 _ 3^1) + (0 _ 3^0)

I think you got the idea!

_Yes. Those three numbers above are exactly the same. Congratulations!_

## Reserved Addresses

All input is provided as parameters, so no addresses in the linear memory are reserved.

## Source

### Created by

- @bushidocodes