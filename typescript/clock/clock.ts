const DAILY_MINUTES: number = 1440;
const HOURLY_MINUTES: number = 60;

export class Clock {  
  constructor(hour: number, private minutes: number = 0) {
    minutes = (hour * HOURLY_MINUTES) + minutes;
    if (minutes < 0)
      minutes = DAILY_MINUTES + Math.floor(minutes % DAILY_MINUTES);
    else if (minutes >= DAILY_MINUTES)
      minutes = minutes % DAILY_MINUTES;
    this.minutes = minutes;
  }

  public toString(): string {
    const hours = Math.floor(this.minutes / HOURLY_MINUTES);
    const minutes = this.minutes % HOURLY_MINUTES;
    return String(hours).padStart(2, "0") + ":" + String(minutes).padStart(2, "0")
  }

  public plus(minutes: number): Clock {
    return new Clock(0, this.minutes + minutes);
  }

  public minus(minutes: number): Clock {
    return this.plus(-minutes);
  }

  public equals(other: Clock): boolean {
    return this.minutes === other.minutes;
  }
}
