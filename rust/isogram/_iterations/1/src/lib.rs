use std::collections::HashSet;

pub fn check(word: &str) -> bool {
    // Convert the word to lowercase and filter out non-alphabetic characters
    let filtered_chars: String = word
        .to_lowercase()  // Normalize case
        .chars()         // Iterate over each character
        .filter(|c| c.is_alphabetic())  // Keep only alphabetic characters
        .collect();      // Collect into a new String

    // Create a HashSet to track characters we've seen so far
    let mut seen_chars = HashSet::new();

    // Check each character in the filtered string
    for c in filtered_chars.chars() {
        // If the character is already in the HashSet, it means there's a duplicate
        if seen_chars.contains(&c) {
            return false;  // Not an isogram if we find a duplicate
        }
        // Add the character to the HashSet to track it
        seen_chars.insert(c);
    }

    // If no duplicates were found, the word is an isogram
    true
}
