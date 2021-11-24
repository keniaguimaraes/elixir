defmodule AskName do
  @moduledoc """
    Modulo de definição do programa que a partir da entrada do terminal recebe
    o nome de uma pessoa e devolve uma saudação para a mesma, referindo-se a ela
    pelo nome.
  """

  @doc """
    Essa função é responsável por receber o nome da pessoa e devolver uma saudação
    para esta. Caso o nome informado seja o do usuário principal, será devolvidada
    uma saudação especial. Caso contrário, a pessoa receberá uma saudação simples.
  """
  defmodule AskName do

    def nome() do

        resposta = IO.gets("Qual o seu nome?\n")

        case String.trim(resposta) do

            "Vanessa" ->
                "Olá, seja muito bem vinda. Tenha um dia abençoado, #{String.trim(resposta)}!"

            _ ->
                "Oi, #{String.trim(resposta)}!"

        end

    end

  end
