defmodule AskName do
	@moduledoc """
		Modulo de definição do programa que recebe o nome do usuário e imprime uma saudação.
		"""
		
	@doc """
		Função que recebe a entrada com o nome do usuário e imprime uma saudação. Caso o nome do usuário seja igual a "Caio", retorna uma saudação diferente.
	def name_greets do
		input = IO.gets("Qual o seu nome?\n")
		case String.trim(input) do
			"Caio" ->
       	"Voce eh meu xara, #{String.trim(input)}!!!!"
       	
			 _ ->
        "Saudacoes, #{String.trim(input)}!"
		end
	end
end
