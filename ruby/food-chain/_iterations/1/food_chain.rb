class FoodChain
  # Constant arrays store the animals and reasons she swallowed each one.
  ANIMALS = [
    'fly', 'spider', 'bird', 'cat', 'dog', 'goat', 'cow', 'horse'
  ]
  
  REASONS = [
    "", # No reason needed for the first animal (fly).
    "It wriggled and jiggled and tickled inside her.",
    "How absurd to swallow a bird!",
    "Imagine that, to swallow a cat!",
    "What a hog, to swallow a dog!",
    "Just opened her throat and swallowed a goat!",
    "I don't know how she swallowed a cow!",
    "She's dead, of course!" # End the song after swallowing the horse.
  ]

  # The main method to generate the full lyrics of the song.
  def self.song
    # We iterate over each animal index to build each verse and join them into one string.
    (0...ANIMALS.size).map { |i| verse(i) }.join("\n\n") + "\n"
  end

  # Generates a single verse of the song based on the animal's index.
  # @param index [Integer] The index of the animal in ANIMALS and REASONS arrays.
  # @return [String] A single verse of the song.
  def self.verse(index)
    # Start with the initial lines of the verse.
    lines = ["I know an old lady who swallowed a #{ANIMALS[index]}."]
    
    # Add reason line only if it exists (not the fly case)
    lines << REASONS[index] unless REASONS[index].empty?
    
    # Handle cumulative verses (only add the cumulative lines if it's not the last animal).
    unless ANIMALS[index] == 'horse'
      # Add lines in reverse for cumulative effect.
      index.downto(1) do |i|
        lines << "She swallowed the #{ANIMALS[i]} to catch the #{ANIMALS[i - 1]}#{" that wriggled and jiggled and tickled inside her" if ANIMALS[i - 1] == 'spider'}."
      end
      lines << "I don't know why she swallowed the fly. Perhaps she'll die."
    end
    
    # Join all lines with newline characters to form the complete verse.
    lines.join("\n")
  end
end
