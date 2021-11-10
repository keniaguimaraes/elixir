#Aluno: Carlos Mosselman Cabral Neto
#Programa para adivinhar o número
defmodule GuessingGame do
  #Procura por um valor que está no meio dos valores indicados
  def meio(menor, maior) do
    div(menor+maior, 2)
  end

  #Procura por um valor que seja maior e checa se é o valor correto
  def maior(menor, maior) do
    minimo = min(maior, meio(menor, maior)+1)
    adivinhar(minimo, maior)
  end

  #Procura por um valor que seja menor e checa se é o valor correto
  def menor(menor, maior) do
    maximo = max(menor, meio(menor, maior)-1)
    adivinhar(menor, maximo)
  end

  #Caso a entrada dos números esteja invertida (primeiro o número maior e depois o menor)
  def adivinhar(x, y) when x > y, do: adivinhar(y,x)

  def adivinhar(menor, maior) do
    #Verifica se a resposta é certa
    resposta = IO.gets("Seu numero eh #{meio(maior,menor)}?\n")

    case String.trim(resposta) do
      #Se for maior, procura por um número maior
      "maior" ->
        maior(menor, maior)

      #Se for menor, procura por um número maior
      "menor" ->
        menor(menor, maior)

      #Encontrou a resposta
      "acertou" ->
        "sempre soube que a resposta era essa"

      #Tenta adivinhar de novo se ainda não encontrou o número
      _ ->
        IO.puts(~s{Type "maior", "menor" or "acertou"})
        adivinhar(menor, maior)
    end
  end

end
