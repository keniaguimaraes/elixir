
defmodule GuessingGame do
  def adivinhar(low, high) do
    last_guess = mid(low, high)
    
    IO.puts("O número é #{last_guess}?\n")
    getNextInput(low, high, last_guess)
  end

  def getNextInput(low, high, last_guess) do
    resposta = IO.gets("")
    case String.trim(resposta) do
      "maior" -> bigger(last_guess, high)
      "menor" -> smaller(low, last_guess)
      "sim" -> IO.puts("Adivinhei o número!")
      _ -> failInput(low, high, last_guess)
    end
  end

  def failInput(low, high, last_guess) do
    IO.puts(~s{Digite "maior", "menor" ou "sim"})
    getNextInput(low, high, last_guess)
  end


  def bigger(last_guess, high) do
    adivinhar(min(high, last_guess + 1), high)
  end

  def smaller(low, last_guess) do
    adivinhar(low, max(low, last_guess - 1))
  end

  def mid(low, high) do
    div(low + high, 2)
  end


end