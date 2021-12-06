defmodule jogo do
  @moduledoc """
    MOódulo contendo funções para que seja adivinhado um numero sendo que é passado um intervalo com valores
    sendo um valor mínimo e um valor máximo.relacionado a numero que sera adivinhado.	
  """
  
  @doc """
     A função adivinhar vai testa se o primeiro num passado pelo usuario  maior que o segundo 
	 caso isso aconteça,  inverte a ordem entre eles.
  """

	def adivinhar(a, b) when a > b, do: adivinhar(b, a)
  @doc """
    Essa é a função recbe a entrada, ou seja, intervalo com valores e tentar "advinhar" o número que o usuário pensou 
	inicialmente e sugerindo um número. O usuario responde se o número pensado por ele é maior ou menor que a sugestao ou se o
    programa adivinhou.
  """
	def adivinhar(menor, maior) do
		resposta = IO.gets("Ei talvez você esteja pensando em #{metade_numero(menor, maior)}?\n")
		case String.trim(resposta) do
			"maior" ->
				maior_que_numero(menor, maior)
			
			"menor" ->
				menor_que_numero(menor, maior)

			"sim" ->
				"Adivinheiro"

			_ ->
				IO.puts(~s{"maior", "menor" ou "sim"})
				IO.puts ~s{"Maior", "Menor", ou "Sim"}adivinhar(menor, maior)
		end
	end
	
  @doc """
    A função metade_numero  retornar a metade da soma entre o menor e o maiornúmero do intervalo dados.
  """
	def metade_numero(menor, maior) do
		div(menor, maior, 2)
	end
	
  @doc """
    A função maior_que_numero atualiza o intervalo dos numero caso o número pensado pelo usuário seja maior que o número sugerido
    pela função addivinhar.
  """
	def maior_que_numero(menor, maior) do
		novo_menor_numero = min(maior, metade_numero(menor, maior) + 1)
		jogo(novo_menor_numero, maior)
	end
	
  @doc """
    A função menor_que_numero atualiza o intervalo dos numero passados, caso o número pensado seja menor que o número sugerido
    pela função addivinhar.
  """	
	def menor_que_numero(menor, maior) do
		novo_maior = max(menor, metade_numero(menor, maior) - 1)
		jogo(menor, novo_maior)
	end	
end