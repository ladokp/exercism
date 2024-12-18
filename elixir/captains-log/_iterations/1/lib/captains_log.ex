defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    @planetary_classes 
    |> Enum.at( trunc(:rand.uniform * (length(@planetary_classes))) )
  end

  def random_ship_registry_number() do
    "NCC-#{ Enum.random(1000..9999) }"
  end

  def random_stardate() do
    42000 - :rand.uniform * 1000
  end

  def format_stardate(stardate) do
    :io_lib.format("~.1f", [stardate])
    |> to_string
  end
end
