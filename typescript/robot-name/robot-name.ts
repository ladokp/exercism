const UPPERCASE_CHARACTERS ='ABCDEFGHIJKLMNOPQRSTUVWXYZ';

export class Robot {
  private static usedNames = new Set<string>();
  
  constructor(
    private _name: string = '#####'
  ) {}

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
      } while (Robot.usedNames.has(this._name))
      Robot.usedNames.add(this._name);
    }
    return this._name;
  }

  public resetName(): void {
    this._name = '#####';
  }

  public static releaseNames(): void {
    Robot.usedNames.clear();
  }
}
