defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    exponent = length(digits)

    number == Enum.reduce(digits, 0, fn number, accumulator ->
      accumulator + Integer.pow(number, exponent)
    end)
  end
end
