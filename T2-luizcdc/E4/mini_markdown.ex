defmodule MiniMarkdown do
  def to_html(texto) do
    texto |> parse_h1 |> parse_h2 |> parse_paragrafos |> parse_pequeno |> parse_grande |> parse_negrito |> parse_italico
  end

  def parse_negrito(texto), do: Regex.replace(~r/\*\*(.*)\*\*/ , texto,  "<strong>\\1</strong>")

  def parse_italico(texto), do: Regex.replace(~r/\*(.*)\*/ , texto, "<em>\\1</em>")
  def parse_paragrafos(texto), do: Regex.replace(~r/(\r\n|\n|\r|^)+([^\r\n]+)((\r\n|\n|\r)+$)?/, texto, "<p>\\2</p>"
  def parse_h1(texto), do: Regex.replace(~r/(\r\n|\n|\r|^)\# +([^#][^\n\r]+)/, texto, "<h1>\\2</h1>")
  def parse_h2(texto), do: Regex.replace(~r/(\r\n|\n|\r|^)\#\# +([^#][^\n\r]+)/, texto, "<h2>\\2</h2>")
  def parse_pequeno(texto), do: Regex.replace(~r/\-\-(.*)\-\-/,texto,"<small>\\1</small>")
  def parse_grande(texto), do: Regex.replace(~r/\+\+(.*)\+\+/,texto,"<big>\\1</big>")
end
