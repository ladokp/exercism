class DndCharacter

  BASE_HITPOINTS = 10
  private_constant :BASE_HITPOINTS

  private
  def initialize
    @strength     = roll_die
    @dexterity    = roll_die
    @constitution = roll_die
    @intelligence = roll_die
    @wisdom       = roll_die
    @charisma     = roll_die
    @hitpoints    = BASE_HITPOINTS + self.class.modifier(constitution)
  end
  
  private
  def self.modifier(ability_score)
    ability_score / 2 - 5 
  end

  public
  def roll_die(roll: 4, die: 6, remove_lowest: 1)
    roll.times.map { rand(1..die) }.sort.pop(roll - remove_lowest).sum
  end

  public
  attr_reader :strength,
    :dexterity,
    :constitution,
    :intelligence,
    :wisdom,
    :charisma,
    :hitpoints
end