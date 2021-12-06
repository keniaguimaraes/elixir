defmodule Exemplos do

  defp pattern_matching_message({:ok, param}) do
    IO.puts "Sucesso: #{param}"
  end
  
  defp certo_errado_pattern_matching(paramo) do
    condicao = fn
      {:ok, value} -> IO.puts "#{pattern_matching_message({:ok, value})}"
      {:error} -> IO.puts "#{pattern_matching_message({:error})}"
    end
    condicao.(param)
  end
  
  def pi do
    3.1415
  end
  

  def somando(a, b) do
    a + b
  end
  
  defmodule Greeter do
	  def hello(name), do: phrase <> name
	  defp phrase, do: "Hello, "
  end

  defmodule Length do
	  def of([]), do: 0
	  def of([_ | tail]), do: 1 + of(tail)
  end
	
   def sorteia_numero_1_a_10 do
    Enum.random(1..10)
   end
  
  
end
