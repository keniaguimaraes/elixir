#Aluno: Carlos Mosselman Cabral Neto
#Exemplos de funções

#Função anônima (podem ser passadas dentro de outras funções ou na linha de comando)
dividir = fn (x, y) -> x/y end

defmodule FuncaoNomeada do

  #Função nomeada padrão
  def multiplicar(x,y) do
    IO.puts("A multiplicacao de #{x}*#{y} eh #{x*y}")
  end

  #Funções de aridade diferente
  def multiplicar() do    #Função de multiplicar sem parâmetros
    IO.puts("Nao ha numeros para multiplicar")
  end

  def multiplicar(x, y, z) do     #Função de multiplicar com 3 parâmetros
    IO.puts("A multiplicacao de #{x}*#{y}*#{z} eh #{x*y*z}")
  end

  #Função privada de soma (só pode ser acessada dentro do módulo)
  defp soma(x, y) do
    IO.puts("A soma de #{x} + #{y} eh #{x+y}")
  end

  #Função com guard (vai arredondar o valor de x se for do tipo float)
  def arredondar(x) when is_float(x) do
    IO.puts("O número arredondado é #{round(x)}")
  end

end
