defmodule MiniMarkdown do

  def converte_html(texto) do
      texto
      |> p
      |> bold
      |> italics
  end

  def bold(texto) do

      Regex.replace(~r/\*\*(.*)\*\*/, texto, "<strong>\\1</strong>")

  end

  def italics(texto) do

      Regex.replace(~r/\*(.*)\*/, texto, "<em>\\1</em>")

  end

  def p(texto) do

      Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, texto, "<p>\\2</p>")

  end

  def teste_conversao do

      """
      O meu mandamento é este: amem uns aos outros como eu amo vocês. (João 15:12)
      asdf.
      """

  end

end
