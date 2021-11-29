defmodule Exemplos do
	#Função anônima de multiplicação:
	def func_anonima() do
		mult1 = fn (a, b) -> a * b end
		IO.puts ~s{"Básico - 10*2 = #{mult1.(10, 2)}"}
	
		mult2 = &(&1 * &2)
		IO.puts ~s{"A & taquigrafia - 2*10 = #{mult2.(2, 10)}\n"}
	end

	#Pattern matching
	def pattern_matching() do
		saida = fn
			{:a, input} -> IO.puts ~s{"Opcao A com #{input} selecionado!"}
			{:b} -> IO.puts ~s{"Opcao B selecionada!"}
		end
		IO.puts ~s{"Pattern Matching - Opcao A + Resultado:"}
		saida.({:a, "Resultado"})
		IO.puts ~s{"Pattern Matching - Opcao B:"}
		saida.({:b})
	end
	
	#Função nomeada
	def func_nomeada(nome) do
		"Funcao Nomeada - O valor passado foi " <> nome
	end
	
	#Função privada
	def func_privada() do
		func_privada_saida("Fulano")
	end
	
  def func_privada_saida(input), do: frase_privada() <> input
  
  defp frase_privada, do: "Funcao Privada - Saudacoes, "
	
	#Guards
	def guard() do
		entrada_guard(["Caio", "Ana"])
	end
	
	def entrada_guard(nomes) when is_list(nomes) do
    nomes
    |> Enum.join(", ")
    |> entrada_guard
  end
  
  def entrada_guard(nome) when is_binary(nome) do
  	frase_guard() <> nome
  end
  
  defp frase_guard, do: "Guards - Os nomes são: "

end
