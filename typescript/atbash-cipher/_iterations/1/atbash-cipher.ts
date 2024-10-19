const LOWERCASE_CHARACTERS = "abcdefghijklmnopqrstuvwxyz";

export function encode(plainText: string): string {
  return transcode(plainText).reduce((s, c, i) => s += (i === 0) || (i % 5) ? c : " " + c, "");
}

export function decode(cipherText: string): string {
  return transcode(cipherText).join("");
}

function transcode(text: string): string[] {
  const lowerCaseText = Array.from(text.replace(/\W/g, "").toLowerCase());
  return lowerCaseText.map(c => c.match(/\d/) ? c : LOWERCASE_CHARACTERS.charAt(25 - LOWERCASE_CHARACTERS.indexOf(c)));
}