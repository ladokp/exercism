pub fn raindrops(n: u32) -> String {
    let mut result: String = "".to_string();
    if n % 3 == 0 {
        result += "Pling";
    }
    if n % 5 == 0 {
        result += "Plang";
    }
    if n % 7 == 0 {
        result += "Plong";
    }
    if result == "" {
        result = n.to_string();
    }
    return result;
}
