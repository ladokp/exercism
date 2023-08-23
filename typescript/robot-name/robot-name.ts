export class Robot {
  private static usedNames = new Set<string>();
  
  constructor(private _name: string) {
    this.resetName();
  }

  private generateString(): string {
    let result = '';
    for ( let i = 0; i < 2; i++ ) {
      result += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.charAt(Math.floor(Math.random() * 26));
    }
    return result;
  }
  
  public get name(): string {
    return this._name;
  }

  public resetName(): void {
    do {
      this._name = this.generateString() + Math.floor(Math.random() * (999 - 100 + 1) + 100)
    } while (Robot.usedNames.has(this._name))
    Robot.usedNames.add(this._name);
  }

  public static releaseNames(): void {
    Robot.usedNames.clear();
  }
}
