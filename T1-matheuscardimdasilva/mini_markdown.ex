defmodule MiniMarkdown do
  def markdown_test do
    """
    Teste de *itálico*
    Teste de **negrito**
    Paragrafo 3
    Paragrafo 4
    Paragrafo 5
    ...
    """
  end

  def paragrafo(string) do
    Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)$)?/, string, "<p>\\2</p>")
  end

  def negrito(string) do
    Regex.replace(~r/\*\*(.*)\*\*/, string, "<strong>\\1</strong>")
  end

  def italico(string) do
    Regex.replace(~r/\*(.*)\*/, string, "<em>\\1</em>")
  end

  def to_html(string) do
    string
      |> paragrafo
      |> italico
      |> negrito
  end
end

MiniMarkdown.markdown_test |> MiniMarkdown.to_html() |> IO.puts()