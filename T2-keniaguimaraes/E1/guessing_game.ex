defmodule jogo do
	def adivinhar(a, b) when a > b, do: adivinhar(b, a)
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
				IO.puts(~s{Escreva "maior", "menor" ou "sim"})
				IO.puts ~s{"Maior", "Menor", ou "Sim"}adivinhar(menor, maior)
		end
	end
	def metade_numero(menor, maior) do
		div(menor, maior, 2)
	end
	def maior_que_numero(menor, maior) do
		novo_menor_numero = min(maior, metade_numero(menor, maior) + 1)
		jogo(novo_menor_numero, maior)
	end
	def menor_que_numero(menor, maior) do
		novo_maior = max(menor, metade_numero(menor, maior) - 1)
		jogo(menor, novo_maior)
	end	
end