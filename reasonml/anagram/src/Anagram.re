let stringToCharArray = s => {
  let len = String.length(s);
  Array.init(len, n => s.[n]);
};

let sortedCharArray = s => {
  let lower = String.lowercase_ascii(s);
  let charArray = stringToCharArray(lower);
  Array.sort(Char.compare, charArray);
  charArray;
};

let isAnagram = (base, word) => {
  if (String.length(base) != String.length(word)) {
    false;
  } else {
    let lowerBase = String.lowercase_ascii(base);
    let lowerWord = String.lowercase_ascii(word);
    if (lowerBase == lowerWord) {
      false;
    } else {
      let sortedBase = sortedCharArray(base);
      let sortedWord = sortedCharArray(word);
      Array.to_list(sortedBase) == Array.to_list(sortedWord);
    }
  }
};

let anagrams = (base, candidates) =>
  candidates
  |> List.filter(isAnagram(base));
