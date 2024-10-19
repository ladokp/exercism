class Raindrops
  def self.convert(number)
    return_value = ""
    if number % 3 == 0
      return_value = return_value + "Pling"
    end
    if number % 5 == 0
      return_value = return_value + "Plang"
    end
    if number % 7 == 0
      return_value = return_value + "Plong"
    end
    return_value.empty? ? "#{number}" : return_value
  end  
end