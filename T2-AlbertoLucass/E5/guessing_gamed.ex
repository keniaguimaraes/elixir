defmodule GuessingGame do

  @moduledoc """
  É executado um jogo de adivinhacao de um numero. Para isso, sera solicitado
  ao usuario inserir algum numero ate acertar, sendo mostrado maior ou menor
  de acordo com a entrada
  """

  @doc """
  Funcao que verifica o maior elemento entre dois numeros

  ## Parameters
        - a: primeiro numero
        - b: segundo numero
  """
  def guess(a,b) when a > b , do: guess(b,a)


  @doc """
  Funcao que executa o jogo

  ## Parameters
        - low: representa o menor numero
        - high: representa o maior numero
  """
  def guess(low,high) do
    answer = IO.gets("Humm... maybe you're a thinking of #{mid(low,high)}?\n")
    case String.trim(answer) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)
      "yes" ->
        "I knew I could guess your number!"
      _ ->
        IO.puts ~s{Type "bigeer", "smaller", or "yes"}
        guess(low,high)
    end
  end
   @doc """
  Funcao que tira a media de dois vaores

  ## Parameters
        - low: representa o menor numero
        - high: representa o maior numero
  """
  def mid(low, high) do
      div(low + high, 2)
  end

   @doc """
  Funcao que verifica o maior numero

  ## Parameters
        - low: representa o menor numero
        - high: representa o maior numero
  """
  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  @doc """
  Funcao que verifica o menor numero

  ## Parameters
        - low: representa o menor numero
        - high: representa o maior numero
  """
  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end

# to execute it use
# c "guessing_game.ex"
# GuessingGame.guess(1,100)
