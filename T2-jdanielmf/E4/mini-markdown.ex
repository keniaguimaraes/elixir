defmodule MiniMarkdown do
  def to_html(text) do
    text
      |> negrito
      |> italico
      |> h1
      |> p
  end

  def italico(text) do
    Regex.replace(~r/\*(.*)\*/,text ,"<em>\\1</em>")
  end

  def negrito(text) do
    Regex.replace(~r/\*\*(.*)\*\*/,text ,"<strong>\\1</strong>")
  end

  def h1(text) do
    Regex.replace(~r/(\#(.*))+((\r\n|\r|\n)+$)?/, texto, "<h1>\\2</h1>")
  end

  def p(texto) do
		Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, texto, "<p>\\2<p/>")
	end
end
