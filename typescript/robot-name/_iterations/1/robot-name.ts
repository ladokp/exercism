const UPPERCASE_CHARACTERS ='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const USED_NAMES = new Set<string>();

export class Robot {  
  constructor(private _name: string = '#####') {}

  private generateString(length: number): string {
    let result = '';
    const charactersLength = UPPERCASE_CHARACTERS.length;
    for ( let i = 0; i < length; i++ ) {
      result += UPPERCASE_CHARACTERS.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  }
  
  public get name(): string {
    if (this._name === '#####') {
      do {
        this._name = this.generateString(2) + Math.floor(Math.random() * (999 - 100 + 1) + 100)
      } while (USED_NAMES.has(this._name))
      USED_NAMES.add(this._name);
    }
    return this._name;
  }

  public resetName(): void {
    this._name = '#####';
  }

  public static releaseNames(): void {
    USED_NAMES.clear();
  }
}
