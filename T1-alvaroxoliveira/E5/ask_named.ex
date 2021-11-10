defmodule AskName do
  @moduledoc """
    Modulo de definição de um programa que recebe o nome de uma pessoa
    através da entrada pelo usuário e retorna uma saudação contendo o nome
    da pessoa.
  """

  @doc """
    Função que tem uma interface para receber do usuário um nome de uma
    pessoa e retorna uma saudação para esta pessoa. Caso o nome for do
    próprio usuário, retorna uma saudação especial. No caso contrário,
    recebe uma saudação simples.
  """
  def nome_e_saudacao() do
    resposta = IO.gets("Qual o seu nome?\n")
    case String.trim(resposta) do
      "Alvaro" ->
        "SALVE, SALVE, #{String.trim(resposta)}!"

      _ ->
        "Ola, grande amigx > #{String.trim(resposta)} < :D!!!"
    end
  end
