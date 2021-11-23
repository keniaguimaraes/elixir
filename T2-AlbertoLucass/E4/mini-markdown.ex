defmodule MiniMarkdown do
	def to_html(texto) do

		texto
			|> paraCabecalho
			|> paraNegrito
		    |> paraItalico
		    |> paraP
		    |> paraPequeno
		    |> paraGrande
	end

	def paraCabecalho(texto) do
		Regex.replace(~r/(\#(.*))+((\r\n|\r|\n)+$)?/, texto, "<h1>\\2</h1>")
	end

	def paraNegrito(texto) do
		Regex.replace(~r/\*\*(.*)\*\*/, texto, "<strong>\\1</strong>")
	end

	def paraItalico(texto) do
		Regex.replace(~r/\*(.*)\*/, texto, "<em>\\1</em>")
	end

	def paraP(texto) do
		Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, texto, "<p>\\2<p/>")

	end

	def paraPequeno(texto) do
		Regex.replace(~r/\-(.*)\-/, texto, "<small>\\1</small>")
	end

	def paraGrande(texto) do
		Regex.replace(~r/\+(.*)\+/, texto, "<big>\\1</big>")
	end

	def stringTeste do
		"""
		#Ola pessoal!
    Estou *apredendo* muito com essas aulas de **Elixir**!
    +Mas prefiria que o semestre ja tivesse acabado+
		-asdf-
		"""
	end
end
