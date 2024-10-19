export class Gigasecond {
  inputDate: Date;
  
  constructor(inputDate: Date) {
    inputDate.setSeconds(inputDate.getSeconds() + 1e9);
    this.inputDate = inputDate;
  }

  public date() {
    return this.inputDate; 
  }
}
