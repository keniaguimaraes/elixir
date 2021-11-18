defmodule GuessingGame do
  @moduledoc """
    Modulo do jogo da adivinhação.
  """

  @doc """
  Imprime as intruções do jogo, coleta o intervalo do número a ser adivinhado e inicia o jogo.
  """
  
  @spec jogar() :: nil
  def jogar() do
    IO.puts("Bem vindo ao Guessing Game\n")
    IO.puts("Neste jogo você pensa em um número e me informa um intervalo em que este número está contido.\n")
    IO.puts("Eu vou chutar qual número é, e você deve me dizer se é mais, menos ou sim caso eu tenha acertado\n")
    IO.puts("Vamos começar...\n")

    
    intervalo = IO.gets("Me diga o intervalo onde seu número está\n")
    array = String.split(String.trim(intervalo))
    a = String.to_integer(Enum.at(array, 0))
    b = String.to_integer(Enum.at(array, 1))
    adivinha(a, b)
  end

  @doc """
  Chuta qual é o número escolhido pelo usuário.

  A função realiza uma busca binária e só para quando encontrar o número escolhido pelo usuário.
  """
  @spec adivinha(integer, integer) :: nil
  def adivinha(a, b) do
    chute = div(a + b, 2)
    resposta = IO.gets("Seu número é #{chute}?\n")
    
    case String.trim(resposta) do
      "sim" -> IO.puts("Aeeee, acertei!\n")
      "mais" -> adivinha(chute, b)
      "menos" -> adivinha(a, chute)
    end
  end
end