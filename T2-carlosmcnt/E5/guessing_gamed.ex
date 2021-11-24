#Aluno: Carlos Mosselman Cabral Neto
defmodule GuessingGame do

  @moduledoc """
    O programa GuessingGame tenta adivinhar um número que esteja presente
    no intervalo de outros dois números, um valor mínimo e um valor máximo.
  """

  @doc """
    A função meio recebe dois números, que representam os intervalos maior e menor, e retorna a metade deles.
  """

  def meio(menor, maior) do
    div(menor+maior, 2)
  end

  @doc """
    A função maior recebe dois números e atualiza o intervalo com um novo valor mínimo, caso o número
    a ser adivinhado seja maior do que o programa sugeriu.
  """

  def maior(menor, maior) do
    minimo = min(maior, meio(menor, maior)+1)
    adivinhar(minimo, maior)
  end

  @doc """
    A função menor recebe dois números e atualiza o intervalo com um novo valor mánimo, caso o número
    a ser adivinhado seja menor do que o programa sugeriu.
  """

  def menor(menor, maior) do
    maximo = max(menor, meio(menor, maior)-1)
    adivinhar(menor, maximo)
  end

   @doc """
    Essa função de adivinhar vai testar se o primeiro número é maior que o segundo. Caso seja,
    irá inverter os valores na função para que sempre o primeiro número chamado na função principal
    seja o maior e o segundo número seja o menor.
  """

  def adivinhar(x, y) when x > y, do: adivinhar(y,x)

  @doc """
    A função adivinhar é a principal do programa, e primeiro testa se a metade dos números é o número pensado.
    Caso não seja, é necessário informar se o número a ser adivinhado é maior ou menor, para o intervalo
    ser atualizado até que seja encontrado o valor final.
  """

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
