defmodule GuessingGame do
  @moduledoc """
    O programa tenta adivinhar um numero que o usuario esta pensando
  """

  @doc """
    A funcao que comeca o programa. Low e high sao os minimos e os maximos que o numero pode ser. 
  """
  def adivinhar(low, high) do
    last_guess = mid(low, high)
    
    IO.puts("O número é #{last_guess}?\n")
    getNextInput(low, high, last_guess)
  end

  @doc """
    A funcao pergunta se a ultima tentativa de adivinhacao e menor, maior ou igual ao numero. 
  """
  def getNextInput(low, high, last_guess) do
    resposta = IO.gets("")
    case String.trim(resposta) do
      "maior" -> bigger(last_guess, high)
      "menor" -> smaller(low, last_guess)
      "sim" -> IO.puts("Adivinhei o número!")
      _ -> failInput(low, high, last_guess)
    end
  end

  @doc """
    A funcao que e chamada quando getNextInput recebe um input invalido. Especifica os inputs possiveis e chama getNextInput novamente
  """
  def failInput(low, high, last_guess) do
    IO.puts(~s{Digite "maior", "menor" ou "sim"})
    getNextInput(low, high, last_guess)
  end

  @doc """
    A funcao que e chamada quando getNextInput recebe um input maior. Define o minimo como o minimo entre o maximo atual e a ultima adivinhacao mais um.
  """
  def bigger(last_guess, high) do
    adivinhar(min(high, last_guess + 1), high)
  end

  @doc """
    A funcao que e chamada quando getNextInput recebe um input menor. Define o maximo como o maximo entre o minimo atual e a ultima adivinhacao menos um.
  """
  def smaller(low, last_guess) do
    adivinhar(low, max(low, last_guess - 1))
  end

  @doc """
    Retorna um numero na metade entre low e high
  """
  def mid(low, high) do
    div(low + high, 2)
  end


end


GuessingGame.adivinhar 0, 100