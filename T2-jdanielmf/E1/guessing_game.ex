defmodule GuessingGame do
  def guess(a,b) when a>b do
    guess(b,a)
  end
  def guess(low,high) do
    resposta = IO.gets ("Voce esta pensando em #{mid(low,high)}?\n")
    case String.trim(resposta) do
      "maior" -> bigger(low,high)
      "menor" -> smaller(low,high)
      "sim" -> "Sabia que eu adivinharia seu numero!"
      _ ->
        IO.puts ~s{Digite "maior", "menor" ou "sim"}
        guess(low,high)
    end
  end
  def mid(low, high)do
    div(low+high,2)
  end
  def bigger(low, high)do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low,high)
  end
  def smaller(low, high)do
    new_high = max(low, mid(low, high) - 1)
    guess(low,new_high)
  end

end
