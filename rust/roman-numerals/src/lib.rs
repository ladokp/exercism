use std::fmt;

static ROMAN_LOOKUP: [(usize, &str); 13] = [
    (1000, "M"),
    ( 900, "CM"),
    ( 500, "D"),
    ( 400, "CD"),
    ( 100, "C"),
    (  90, "XC"),
    (  50, "L"),
    (  40, "XL"),
    (  10, "X"),
    (  9,  "IX"),
    (  5,  "V"),
    (  4,  "IV"),
    (  1,  "I"),
];

pub struct Roman {
    number: usize,
}

impl From<usize> for Roman {
    fn from(number: usize) -> Self {
        Roman::new(number)
    }
}

impl fmt::Display for Roman {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let mut result = String::new();
        let mut start = self.number;
        for &(numeric, roman_string) in ROMAN_LOOKUP.iter() {
            while start >= numeric {
                start -= numeric;
                result.push_str(roman_string);
            }
        }
        write!(f, "{}", result)
    }
}

impl Roman {
    fn new(number: usize) -> Roman {
        Roman { number }
    }
}