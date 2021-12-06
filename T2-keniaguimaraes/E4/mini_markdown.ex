defmodule MiniMarkdown do

  def configura_html(text) do
    text
    |> p
    |> negrito
    |> italico
  end

  def negrito(text) do
    Regex.replace(~r/\*\*(.*)\*\*/, text, "<strong>\\1</strong>")
  end
   
  def p(text) do
    Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, text, "<p>\\2</p>")
  end

  def italico(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
  end

  def teste_textoconfigurado do
    """
     Fazendo atividade de elixir
     O que vc esta fazendo?
	 asfd
    """
  end
end
