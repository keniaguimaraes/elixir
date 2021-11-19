# Exemplo para uso: Markdown.to_html("# HeaderH1!\n* BOLD\n* italico")
# Lembrar que os headers precisam ter um espaço do "#" de acordo com a norma do markdown

defmodule MiniMarkdown do
  def to_html(str) do
    str
    |> String.split("\n")
    |> Enum.map_join("", &process/1)
    |> unordered_tag
  end

  defp process("#" <> _rest = t) do
    t
    |> String.split()
    |> parse_header_md_level
    |> enclose_with_header_tag
  end

  defp process("*" <> _rest = t) do
    t |> parse_list_md_level
  end

  defp process(t) do
    t
    |> String.split()
    |> enclose_with_paragraph_tag
  end

  defp parse_header_md_level([hd | td]) do
    head = hd |> String.length() |> to_string
    tail = td |> Enum.join(" ")
    {head, tail}
  end

  defp parse_list_md_level(l) do
    t =
      l
      |> String.trim_leading("* ")
      |> String.split()

    "<li>" <> join_words_with_tags(t) <> "</li>"
  end

  defp enclose_with_header_tag({hl, content}) do
    "<h" <> hl <> ">" <> content <> "</h" <> hl <> ">"
  end

  defp enclose_with_paragraph_tag(t) do
    "<p>" <> join_words_with_tags(t) <> "</p>"
  end

  defp join_words_with_tags(t) do
    t |> Enum.map_join(" ", &replace_md_with_tag/1)
  end

  defp replace_md_with_tag(w) do
    w
    |> replace_prefix_md
    |> replace_suffix_md
  end

  defp replace_prefix_md(w) do
    w
    |> String.replace_prefix("__", "<strong>")
    |> String.replace_prefix("_", "<em>")
  end

  defp replace_suffix_md(w) do
    w
    |> String.replace_suffix("__", "</strong>")
    |> String.replace_suffix("_", "</em>")
  end

  defp unordered_tag(str) do
    str
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end
