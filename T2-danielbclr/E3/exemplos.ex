# Funções anônimas:

# Quadrado de um numero
quad = fn (a) -> a * a end
quad.(5)

# Oposto de um numero
opo = &(-&1)
opo.(2)

# Pattern matching

patternMatching = fn
  {true, str} -> IO.puts("#{str} - True, imprimiu")
  {false} -> IO.puts("False, nao vai imprimir nada")
end

patternMatching.({true, "batata"})
patternMatching.({false})

# Funções nomeadas:

defmodule FuncoesNomeadas do
  def nomeada(a, b), do: "${a*b}\n"

end

#Nomear Funcoes e aridade

defmodule Numero do
  def num(), do: "0 \n"                       # num/0
  def num(a), do: "Number is ${a} \n"         # num/1
  def num(a, b), do: "Result is #{a * b} \n"  # num/2
end

num()
num(3)
num(3, 4)

# Funções privadas:

defmodule FuncoesPrivadas do
  defp privada(name), do: "Essa funcao eh privada"
end
