defmodule AskName do
  @moduledoc """
    Modulo de definição de um programa que recebe um parametro e retorna um saudação de acordo com a 
	identificação do parametro
  """

  @doc """
    Função que recebe um nome como parametro para verificação se essa pessoas é conhecida. Caso seja
	retorna uma saudação para esta pessoa senão cé retornado uma saudação simples.
  """
  def saudacao() do
    nome = IO.gets("Qual é o seu nome?\n")
    case String.trim(nome) do
      "Kenia" ->
        "Bem vinda, Kenia! , #{String.trim(nome)}!"

      _ ->
        "Ola, grande amigx > #{String.trim(resposta)} < :D!!!"
    end
  end



