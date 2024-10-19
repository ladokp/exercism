const mapping: string[] =
  ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']

export function decodedResistorValue(colors:[string,string,string]):string {
    let value: number = (
    mapping.indexOf(colors[0])*10 +
      mapping.indexOf(colors[1])
      ) * (
        10**(mapping.indexOf(colors[2]))
      )
    if(value/(10**9)>=1){
      return (value/(10**9)) + ' gigaohms'
    } else if(value/(10**6)>=1){
      return (value/(10**6)) + ' megaohms'
    } else if(value/(10**3)>=1){
      return (value/(10**3)) + ' kiloohms'
    } else {
      return `${value} ohms`
  }
}