defmodule GuessingGame do
  def guess(a, b) when a > b, do: guess(b, a)

  def guess(low, high) do
    answer = IO.gets("Acho que você está pensando em #{mid(low, high)}\n")

    case String.trim(answer) do
      "maior" ->
        bigger(low, high)

      "menor" ->
        smaller(low, high)

      "Sim" ->
        "HaHa eu sabia!"

      _ ->
        IO.puts(~s{Type "bigger", "smaller", or "yes"})
        guess(low, high)
    end
  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end
