const EARTH_YEAR_IN_SECONDS: number = 31557600
const CONVERSION_TABLE: { [time: string]: number } = {
  "earth": 1.0 ,
  "mercury": 0.2408467,
  "venus": 0.61519726,
  "mars": 1.8808158,
  "jupiter": 11.862615,
  "saturn": 29.447498,
  "uranus": 84.016846,
  "neptune": 164.79132
}

export function age(planet: string, seconds: number): number {
  if (planet in CONVERSION_TABLE) {
    return Number((seconds / (CONVERSION_TABLE[planet] * EARTH_YEAR_IN_SECONDS)).toFixed(2))
  }
  throw new Error("No Planet given!")
}
