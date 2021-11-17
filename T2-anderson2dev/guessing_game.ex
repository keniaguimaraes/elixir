# Guessing Game
defmodule GuessingGame do
  def guess(a, b) when a > b, do: guess(b, a)


  def guess(low, high) do
    answer = IO.gets("Hmmm... I think  the number you had thought about is #{mid(low, high)}. Am i right?\n")
    case (String.trim(answer)) do
      "bigger" -> bigger(low, high)
      "smaller" -> smaller(low, high)
      "yes" -> IO.puts("I knew it")
      _ ->
        IO.puts(~s{Type "bigger", "smaller" or "yes"})
        guess(low, high)
    end

  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    new_low = min(mid(low, high) + 1, high)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(mid(low, high)-1, low)
    guess(low, new_high)
  end

end
