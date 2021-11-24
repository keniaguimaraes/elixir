defmodule GuessingGame do
  @moduledoc """
  Este modulo fornece a funcao que ira adivinhar um numero em um intervalo fornecido pelo usuario
  """
  @doc """
  Esta e a funcao que proteje a funcao principal do modulo para caso o usuario passe parametros
  na ordem incorreta

  #Parametros
  - a: menor numero do intervalo
  - b: maior numero do intervalo

  """
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

  @doc """
  Esta funcao retorna o valor mediano do intervalo
  """
  def mid(low, high)do
    div(low+high,2)
  end
  @doc """
  Esta funcao retorna um novo intervalo caso o usuario digite que pensou em um numero maior
  """
  def bigger(low, high)do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low,high)
  end
  @doc """
  Esta funcao retorna um novo intervalo caso o usuario digite que pensou em um numero menor
  """
  def smaller(low, high)do
    new_high = max(low, mid(low, high) - 1)
    guess(low,new_high)
  end

end
