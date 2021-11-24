defmodule AskName do
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
