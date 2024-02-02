module ResistorColorDuo
  COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

  def self.value(colors)
      if colors.length >= 2
        COLORS.index(colors.first) * 10 + COLORS.index(colors[1])
      end
  end
end
