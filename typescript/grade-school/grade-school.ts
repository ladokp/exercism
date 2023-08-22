export class GradeSchool {
  private _roster: {[index: number]: string[]} = {}

  private intitializeGradeIfNeeded(grade: number) {
    if (!this._roster.hasOwnProperty(grade)) this._roster[grade] = [];
  }

  private makeUniqueNames(name: string) {
    for (const grade in this._roster) {
      const names = this._roster[grade];
      if (names.includes(name)) {
        this._roster[grade].splice(names.indexOf(name), 1);
      }
    }
  }
  
  public roster() {
    return structuredClone(this._roster);
  }

  public add(name: string, grade: number) {
    this.makeUniqueNames(name);
    this.intitializeGradeIfNeeded(grade);
    this._roster[grade].push(name);
    this._roster[grade].sort();
  }

  public grade(grade: number) {
    this.intitializeGradeIfNeeded(grade);
    return structuredClone(this._roster[grade]);
  }
}
