defmodule GuessingGame do
  @moduledoc """
    É um módulo que contém funções para "adivinhar" um numero em
    um intervalo entre dois números, um mínimo e um máximo.
  """

  @doc """
    Testa se o primeiro número é maior que o segundo, e caso seja verdade
    a função retorna esses dois invertidos.
  """
  def adivinhar(a,b) when a>b do
    adivinhar(b,a)
  end

  @doc """
    Função principal do módulo, onde há a entrada por parte do usuário.
    Se o número dado for maior, menor ou se o mesmo seja igual o que
    o usuuário está pensando.
  """
  def adivinhar(menor, maior) do
    entrada = IO.gets("Talvez você tenha pensado no número #{obter_metade(menor, maior)}?\n")
    case String.trim(entrada) do
      "Maior" ->
        obter_intervalo_maior(menor, maior)

      "Menor" ->
        obter_intervalo_menor(menor, maior)

      "Sim" ->
        "Adivinhei"

      _ ->
        IO.puts ~s{"Maior", "Menor", ou "Sim"}
        adivinhar(menor, maior)
    end
  end

  @doc """
    Função que retorna a metade da soma entre o menor e o maior
    número do intervalo.
  """
  def obter_metade(menor, maior) do
    div(menor + maior, 2)
  end

  @doc """
    Função que atualiza o intervalo, caso o número do usuário seja
    maior que o número sugerido.
  """
  def obter_intervalo_maior(menor, maior) do
    novo_menor = min maior, obter_metade(menor, maior) + 1
    adivinhar(novo_menor, maior)
  end

  @doc """
    Função que atualiza o intervalo, caso o número do usuário seja
    menor que o número sugerido.
  """
  def obter_intervalo_menor(menor, maior) do
    novo_maior= max menor, obter_metade(menor, maior) - 1
    adivinhar(menor, novo_maior)
  end
end
