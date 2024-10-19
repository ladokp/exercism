pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (1..limit)
        .filter(|index| factors.iter()
                .any(|factor| factor != &0 && index % factor == 0))
        .sum()
}
