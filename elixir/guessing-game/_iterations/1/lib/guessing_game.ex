defmodule GuessingGame do
  def compare(secret_number) do
    "Make a guess"
  end
  def compare(secret_number, guess) when guess == :no_guess do
    "Make a guess"
  end
  def compare(secret_number, guess) when guess in [secret_number + 1, secret_number - 1] do
    "So close"
  end
  def compare(secret_number, guess) when secret_number < guess do
    "Too high"
  end
  def compare(secret_number, guess) when secret_number > guess do
    "Too low"
  end
  def compare(secret_number, guess) when secret_number == guess do
    "Correct"
  end
end
