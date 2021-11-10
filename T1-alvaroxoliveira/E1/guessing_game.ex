defmodule GuessingGame do
  def adivinhar(a,b) when a>b do
    adivinhar(b,a)
  end
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

  def obter_metade(menor, maior) do
    div(menor + maior, 2)
  end

  def obter_intervalo_maior(menor, maior) do
    novo_menor = min maior, obter_metade(menor, maior) + 1
    adivinhar(novo_menor, maior)
  end

  def obter_intervalo_menor(menor, maior) do
    novo_maior= max menor, obter_metade(menor, maior) - 1
    adivinhar(menor, novo_maior)
  end
end
