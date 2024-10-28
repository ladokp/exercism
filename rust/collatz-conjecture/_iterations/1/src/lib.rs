pub fn collatz(n: u64) -> Option<u64> {
    if n == 1 {
        return Some(0u64);
    }
    if n % 2 == 0 {
        return Some(1u64 + collatz(n / 2)?)
    }
    return Some(1u64 + collatz(n * 3 + 1)?)
}
