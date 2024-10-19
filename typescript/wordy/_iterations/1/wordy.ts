export const answer = (phrase: string) => {
  if(phrase.match(/cubed/gi) || !phrase.match(/^What is.*?$/gi)) throw new Error('Unknown operation');

  const equation = phrase.toLowerCase().replaceAll("plus", "+").replaceAll("minus", "-").replaceAll("multiplied by", "*").replaceAll("divided by", "/").replaceAll(/[^0-9\*\+\-\s/]/gi,"").replaceAll("--", "+").trim();
  
  if(!equation) throw new Error('Syntax error');
  
  let result = "";
  try {
    for (var char of [...equation]) {
      if(char.match(/[*\+/]/)) {
        result = eval(result);
      }
      result += char;
    }
    result = eval(result)
  } catch(e) {
    throw new Error('Syntax error');
  }
  return result;
}