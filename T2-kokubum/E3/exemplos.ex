# Funções anônimas:

# Multiplicacao de dois numeros
anonimaMult = fn x, y -> x * y end
anonimaMult.(10, 5)

# oposto de um numero
anonimaOposto = fn a -> -a end

# retorna o quadrado de um número
anonimaQuadrado = &(&1 * &1)

# Pattern matching

exemploPatternMatching = fn
  {var1} -> IO.puts("#{var1} - Passou apenas um parametro")
  {var2, var3} -> IO.puts("#{var2} - #{var3} : Passou dois parametros")
end

exemploPatternMatching.({"Unico Parametro"})
exemploPatternMatching.({"Primeiro Parametro", "Segundo Parametro"})

# Funções nomeadas:

defmodule Nomeadas do
  def nomeada() do
    numerosParaDividirPorDois = [2, 4, 8, 12, 24]

    numerosParaDividirPorDois =
      [2, 4, 8, 12, 24]
      |> Enum.map(fn numero ->
        numero / 2
      end)
  end

  def nomeadaComAnonima() do
    number = 2
    anonimaParaMultiplicarPorDez = fn number -> number * 10 end
    anonimaParaMultiplicarPorDez.(number)
  end

  def nomeadaComUmaLinha(a, b), do: a * b
end

# Funções privadas:

defmodule Privada do
  def funcaoPublica(nome), do: funcaoPrivada <> nome
  defp funcaoPrivada, do: "Mandando essa mensagem da funcao privada"
end

# Funções com diferentes aridades

defmodule DiferentesAridades do
  def printList(a, b) do
    IO.puts("#{a} - #{b}")
  end

  def printList(a, b, c) do
    IO.puts("#{a} - #{b} - #{c}")
  end

  def printList(a, b, c, d) do
    IO.puts("#{a} - #{b} - #{c} - #{d}")
  end
end

# Guard:

defmodule Guard do
  def colors_for(size) when size == 1 or size == "s" or size == "S" do
    ["Green", "Blue", "Pink"]
  end

  def colors_for(size) when size == 2 or size == "m" or size == "M" do
    ["Red", "Blue"]
  end

  def colors_for(size) when size == 3 or size == "l" or size == "L" do
    ["Red", "Black", "Blue", "Yellow"]
  end
end

#Argumentos Padroes

defmodule Default do
  def defaultParameterSum(a, b \\ 1, c \\ 2)
    a + b + c
  end
end
