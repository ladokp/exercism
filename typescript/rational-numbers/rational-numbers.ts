function root(x: number, n: number): number {
  if (n === 2) return Math.sqrt(x);
  if (n === 3) return Math.cbrt(x);
  return Math.pow(x, 1 / n);
}

function reduce(a: number, b: number): [number, number] {
  const d = gcd(a, b);
  const n = b < 0 ? Math.sign(b) : 1;
  return [n * a / d, n * b / d];
}

function gcd(a: number, b: number): number {
  while (b !== 0) {
    const t = b;
    b = a % b;
    a = t;
  }
  return Math.abs(a);
}

export class Rational {
  protected numerator: number;
  protected denominator: number;

  constructor(numerator: number, denominator: number) {
    const [a, b] = reduce(numerator, denominator);
    this.numerator = a;
    this.denominator = b;
  }

  add(x: Rational): Rational {
    return new Rational(this.numerator * x.denominator + x.numerator * this.denominator, this.denominator * x.denominator);
  }

  sub(x: Rational): Rational {
    return this.add(x.mul(new Rational(-1, 1)));
  }

  mul(x: Rational): Rational {
    return new Rational(this.numerator * x.numerator, this.denominator * x.denominator);
  }

  div(x: Rational): Rational {
    return this.mul(new Rational(x.denominator, x.numerator));
  }

  abs(): Rational {
    return new Rational(Math.abs(this.numerator), Math.abs(this.denominator));
  }

  exprational(n: number): Rational {
    const [a, b] = n < 0 ? [this.denominator, this.numerator] : [this.numerator, this.denominator];
    const m = Math.abs(n);
    return new Rational(Math.pow(a, m), Math.pow(b, m));
  }

  expreal(r: number): number {
    return root(Math.pow(r, this.numerator), this.denominator);
  }

  reduce() {
    return this;
  }
}