defmodule HighScore do
  @initial_score 0

  def new() do
    Map.new()
  end

  def add_player(scores, name, score \\ @initial_score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    add_player(scores, name, @initial_score)
  end

  def update_score(scores, name, score) do
    current_score = Map.get(scores, name)
    if not is_nil(current_score) do
      add_player(scores, name, current_score+score)
    else
      add_player(scores, name, score)
    end
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
