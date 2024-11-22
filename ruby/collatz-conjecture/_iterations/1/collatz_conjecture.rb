class CollatzConjecture
   def self.steps(number)
      raise ArgumentError if number < 1
      return 0 if number == 1
      1 + steps(number.even? ? number / 2 : 3 * number + 1)
   end
end