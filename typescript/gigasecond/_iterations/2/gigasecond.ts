export class Gigasecond {  
  constructor(private inputDate: Date) {}

  public date() {
    return new Date(this.inputDate.getTime() + 1e12);
  }
}
