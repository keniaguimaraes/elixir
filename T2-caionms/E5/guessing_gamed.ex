defmodule GuessingGame do
	@moduledoc """
	Modulo de definição do programa que recebe dois números e faz um processo de "busca binária" para descobrir qual é esse o número a partir das respostas do usuário.
		"""
		
	@doc """
		Função que ordena os valores recebidos, caso esteja decrescente.
	"""
	def guess(a,b) when a>b do
		guess(b,a)
	end
	
	@doc """
		Função principal do módulo, responsável por "adivinhar" o número que o usuário escolheu, performa a lógica da busca binária através de respostas do usuário de se o número atual é maior, menor ou igual ao que foi escolhido.
	"""
	def guess(l, h) do
		input = IO.gets("Você pensou no número #{half(l, h)}?\n")
		case String.trim(input) do
			"Maior" ->
				bigger(l, h)
			
			"Menor" ->
				lower(l, h)
				
			"Sim" ->
				"Acertei!"
			
			_ ->
				IO.puts ~s{"Maior", "Menor", ou "Sim"}
        guess(l, h)
		end
	end
	
	@doc """
		Função que retorna a metade da soma entre o maior e menor valor.
	"""
	def half(l, h) do
		div(l + h, 2)
	end
	
	@doc """
		Função que atualiza o intervalo, modificando o menor valor para a metade + 1.
	"""
	def bigger(l, h) do
		l2 = min h, half(l, h) + 1
		guess(l2, h)
	end
	
	@doc """
		Função que atualiza o intervalo, modificando o maior valor para metade - 1.
	"""
	def lower(l, h) do
		h2 = max l, half(l, h) - 1
		guess(l, h2)
	end
end
			
