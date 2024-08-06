// Custom error for invalid inputs
export class InvalidInputError extends Error {
  constructor(message: string) {
    super(message || 'Invalid Input');
  }
}

// Type aliases for direction and instruction
type Bearing = 'north' | 'south' | 'east' | 'west';
type Instruction = 'turnLeft' | 'turnRight' | 'advance';

// Valid directions the robot can face
const validDirections: Bearing[] = ['north', 'south', 'east', 'west'];

// Function to check if a string is a valid direction
function isValidBearing(next: string): next is Bearing {
  return validDirections.includes(next as Bearing);
}

export class Robot {
  public coordinates: [number, number];
  public bearing: Bearing;

  // Converts a string of characters into an array of instructions
  private static instructions(s: string): Instruction[] {
    return [...s].map((character) => {
      switch (character) {
        case 'L':
          return 'turnLeft';
        case 'R':
          return 'turnRight';
        case 'A':
          return 'advance';
        default:
          throw new InvalidInputError(
            `${character} is not a valid instruction character.`
          );
      }
    });
  }

  constructor() {
    this.coordinates = [0, 0];
    this.bearing = 'north';
  }

  // Setter for direction with validation
  private set direction(next: string) {
    if (!isValidBearing(next)) {
      throw new InvalidInputError('Invalid Robot Bearing');
    }
    this.bearing = next;
  }

  // Advances the robot one step in the current direction
  private advance(): void {
    switch (this.bearing) {
      case 'north':
        this.coordinates[1] += 1;
        break;
      case 'south':
        this.coordinates[1] -= 1;
        break;
      case 'east':
        this.coordinates[0] += 1;
        break;
      case 'west':
        this.coordinates[0] -= 1;
        break;
    }
  }

  // Turns the robot to the left
  private turnLeft(): void {
    switch (this.bearing) {
      case 'north':
        this.direction = 'west';
        break;
      case 'south':
        this.direction = 'east';
        break;
      case 'east':
        this.direction = 'north';
        break;
      case 'west':
        this.direction = 'south';
        break;
    }
  }

  // Turns the robot to the right
  private turnRight(): void {
    switch (this.bearing) {
      case 'north':
        this.direction = 'east';
        break;
      case 'south':
        this.direction = 'west';
        break;
      case 'east':
        this.direction = 'south';
        break;
      case 'west':
        this.direction = 'north';
        break;
    }
  }

  // Places the robot at a specific coordinate and direction
  public place(args: { x: number; y: number; direction: string }): void {
    this.coordinates = [args.x, args.y];
    this.direction = args.direction;
  }

  // Executes a sequence of instructions
  public evaluate(s: string): void {
    Robot.instructions(s).forEach((instruction) => {
      this[instruction]();
    });
  }
}
