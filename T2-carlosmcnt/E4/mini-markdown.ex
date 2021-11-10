#Aluno: Carlos Mosselman Cabral Neto
#Programa que implementa um tradutor de um subconjunto mínimo de Markdown para HTML
defmodule MiniMarkdown do
  def to_html(sub) do
    sub
      |> bold
      |> italics
      |> p
  end

  def bold(sub) do
    Regex.replace(~r/\*\*(.*)\*\*/, sub, "<strong>\\1</strong>")
  end

  def italics(sub) do
    Regex.replace(~r/\*(.*)\*/, sub, "<em>\\1</em>")
  end

  def p(sub) do
    Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)$)?/, sub, "<p>\\2</p>")
  end

  def texto do
    """
    Como foi o seu dia, meu *grande* amigo?
    Meu dia foi **incrivel**, passei o dia me divertindo lendo um livro.
    Livros sao uma otima forma de se distrair da vida
    Sim, com certeza
    """
  end

end
