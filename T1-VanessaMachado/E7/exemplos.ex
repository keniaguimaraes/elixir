defmodule Exemplos do
  # Funções anônimas:
  # Funções simples de adição e subtração respectivamente

  def add_two_numbers() do
    add = fn x, y -> x + y end
    add.(10, 5)
  end

  def sub_two_numbers() do
    sub = &(&1 - &2)
    sub.(20, 15)
  end

  # Funções simples de multiplicação e divforão respectivamente

  def mult_two_numbers() do
    mult = fn x, y -> x * y end
    mult.(12, 5)
  end

  def div_two_numbers() do
    div = &(&1 / &2)
    div.(8, 4)
  end

  # Pattern matching

  result = fn
    {var1} -> IO.puts("#{var1} Encontrado!")
    {var2, var3} -> IO.puts("#{var2} and #{var3} Encontrados!")
  end

  result.({"Oi mundo"})
  result.({"mundo", "oi"})

  # Se o corpo da função tem apenas uma linha, podemos reduzir usando do

  def mul(a, b), do: a * b

  # Funções privadas:
  # Funções nomeadas:
  # Podem ser acessadas de dentro do módulo em que estão definidas.
  # Para definir uma função privada, use defp em vez de def
  def hello(nome), do: frase() <> nome
  defp frase, do: "Olá "

  # Funções com diferentes aridades
  def sum(a, b) do
    a + b
  end

  def sum(a, b, c) do
    a + b + c
  end

  def sum(a, b, c, d) do
    a + b + c + d
  end

  # Guard:
  def impressao(x) when x > 10, do: "Maior que 10"
  def impressao(x) when x == 10, do: "Valor é 10"
  def impressao(x) when x < 10, do: "Menor que 10"
end
