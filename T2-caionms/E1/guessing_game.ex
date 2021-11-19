defmodule GuessingGame do
	def guess(a,b) when a>b do
		guess(b,a)
	end
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
	
	def half(l, h) do
		div(l + h, 2)
	end
	
	def bigger(l, h) do
		l2 = min h, half(l, h) + 1
		guess(l2, h)
	end
	
	def lower(l, h) do
		h2 = max l, half(l, h) - 1
		guess(l, h2)
	end
end
			
