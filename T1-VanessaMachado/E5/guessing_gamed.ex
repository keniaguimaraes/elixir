defmodule GuessingGame do

  @moduledoc """
    Modulo de definição do programa que  "adivinha" um número que está em
    um intervalo entre dois outros números passados pelo usuário através do
    terminal de entrada, sendo um valor mínimo e um valor máximo.
  """

  @doc """
    A função  vai testar se, entre os números passados pelo usuário,
    o primeiro número é maior que o segundo, e caso isso se confirme, retorna
    os dois números invertidos.
  """

  def suposicao(a,b) when a>b do

      suposicao(b,a)

  end

  @doc """
    Essa é a função principal do módulo. Aqui é feita a captura da entrada executada
    pelo usuário. O programa tenta "advinhar" o número que o usuário pensou a partir
    do intervalo dado por ele e sugere um número. O usuário responde, através do
    terminal, se o número pensado por ele é maior ou menor que o sugerido ou se o
    programa acertou.
  """

  def suposicao(inf, sup) do

      resposta = IO.gets("você pensou no número #{meio(inf, sup)}?\n")

      case String.trim(resposta) do

          "maior" ->
              maior(inf, sup)

          "menor" ->
              menor(inf, sup)

          "sim" ->
              "Consegui advinhar o seu número !!!!!!!"

          _ ->
              IO.puts ~s{"maior", "menor", ou "sim"}
              suposicao(inf, sup)

      end

  end

  @doc """
    A função meio é responsável por retornar a metade da soma entre o menor e o maior
    número do intervalo. E será usada para compôr outras funções.
  """
  def meio(inf, sup) do

      div(inf + sup, 2)

  end

  @doc """
    A função maior é responsável por fazer a atualização do intervalo,
    caso o número pensado pelo usuário seja maior que o número sugerido
    pelo programa.
  """
  def maior(inf, sup) do

      novoInf = min sup, meio(inf, sup) + 1
      suposicao(novoInf, sup)

  end

  @doc """
    A função menor é responsável por fazer a atualização do intervalo,
    caso o número pensado pelo usuário seja menor que o número sugerido
    pelo programa.
  """

  def menor(inf, sup) do

      novoSup= max inf, meio(inf, sup) - 1
      suposicao(inf, novoSup)

  end

end
