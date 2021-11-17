defmodule MiniMarkdown do
  def to_html(text) do
    text 
      |> linebreak
      |> italics 
      |> strikethrough 
      |> bold 
      |> header 
      |> link 
      |> image 
      |> blockquote 
      |> code 
      |> list 
      |> paragraph
  end

  def italics(text) do
    Regex.replace(~r/\*(.+?)\*/, text, "<em>\\1</em>")
  end

  def bold(text) do
    Regex.replace(~r/\*\*(.+?)\*\*/, text, "<strong>\\1</strong>")
  end

  def strikethrough(text) do
    Regex.replace(~r/~~(.+?)~~/, text, "<del>\\1</del>")
  end

  def link(text) do
    Regex.replace(~r/\[(.+?)\]\((.+?)\)/, text, "<a href=\"\\2\">\\1</a>")
  end

  def image(text) do
    Regex.replace(~r/!\[(.+?)\]\((.+?)\)/, text, "<img src=\"\\2\" alt=\"\\1\" />")
  end

  def blockquote(text) do
    Regex.replace(~r/^> (.+?)$/, text, "<blockquote>\\1</blockquote>")
  end

  def code(text) do
    Regex.replace(~r/`(.+?)`/, text, "<code>\\1</code>")
  end

  def header(text) do
    Regex.replace(~r/^(#+)\s(.+?)$/, text, "<h1>\\2</h1>")
  end

  def list(text) do
    Regex.replace(~r/^(-|\*)\s(.+?)$/, text, "<li>\\1</li>")
  end

  def paragraph(text) do
    Regex.replace(~r/^(.+?)$/, text, "<p>\\1</p>")
  end

  def linebreak(text) do
    Regex.replace(~r/\n/, text, "<br />")
  end

  def test do
    "# Código
    `print('Hello World')`
    *Negrito*
    ~~Tachado~~
    "
  end
end