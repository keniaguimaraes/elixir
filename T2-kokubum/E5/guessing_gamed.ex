defmodule GuessingGame do
  @moduledoc """
  Implementa um jogo de adivinhação, que com base no feedback do usuário vai tentando descobrir qual número que ele pensou.
  """

  @doc """
  Função recursiva que verifica a ordem dos parametros passados e re-ordena para que o primeiro seja sempre menor que o segundo.
  ## Parameters
      - a: inteiro que representa o menor valor do intervalo.
      - b: inteiro que representa o maior valor do intervalo.
  """
  @spec guess(integer, integer) :: :ok
  def guess(a, b) when a > b, do: guess(b, a)

  @doc """
  Função recursiva que a depender do retorno do usuário chama outras funções, ou ela mesmo para tentar adivinhar o número novamente.
  ## Parameters
      - low: inteiro que representa o menor valor do intervalo.
      - high: inteiro que representa o maior valor do intervalo.
  """
  @spec guess(integer, integer) :: :ok
  def guess(low, high) do
    answer = IO.gets("Is your number: #{mid(low, high)}?\n")

    case String.trim(answer) do
      "too low" ->
        bigger(low, high)

      "too high" ->
        smaller(low, high)

      "yes" ->
        "I knew I could guess your number!"

      _ ->
        IO.puts(~s{Type "too low", "too high" or "yes"})
        guess(low, high)
    end
  end

  @doc """
  Função que soma o menor valor com o maior e retorna a metade desse valor.
  ## Parameters
      - low: inteiro que representa o menor valor do intervalo.
      - high: inteiro que representa o maior valor do intervalo.
  """
  @spec mid(integer, integer) :: :ok
  def mid(low, high) do
    div(low + high, 2)
  end

  @doc """
  Função que redefine o novo menor valor possivel pegando o mínimo valor entre o maior e a metade da soma dos limites mais um.
  ## Parameters
      - low: inteiro que representa o menor valor do intervalo.
      - high: inteiro que representa o maior valor do intervalo.
  """
  @spec bigger(integer, integer) :: :ok
  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  @doc """
  Função que redefine o novo maior valor possivel pegando o máximo valor entre o menor e a metade da soma dos limites menos um.
  ## Parameters
      - low: inteiro que representa o menor valor do intervalo.
      - high: inteiro que representa o maior valor do intervalo.
  """
  @spec smaller(integer, integer) :: :ok
  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end
