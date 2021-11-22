defmodule MiniMarkdown do
  def to_html(text) do
    parsed_text = text
      |> big
      |> small
      |> bold
      |> italics
      |> paragraph
      |> third_header
      |> secondary_header
      |> primary_header
    case File.write("output.html", parsed_text) do
      :ok -> IO.puts("File output.html created successfully!")
      {:error, reason} -> IO.puts(~s(Could not save file: output.html"))
                          IO.puts(~s(#{:file.format_error reason}\n))

    end
  end

  def bold(text) do
    Regex.replace(~r/\*\*(.*)\*\*/, text, ~s{<strong>\\1</strong>})
  end

  def italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, ~s{<em>\\1</em>})
  end

  def paragraph(text) do
    Regex.replace(
      ~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)$)?/,
      text,
      ~s{<p>\\2</p>}
    )
  end

  def primary_header(text) do
    Regex.replace(~r/(#)(.*)$/m, text, ~s{<h1>\\2</h1>})
  end

  def secondary_header(text) do
    Regex.replace(~r/(#){2}(.*)$/m, text, ~s{<h2>\\2</h2>})
  end

  def third_header(text) do
    Regex.replace(~r/(#){3}(.*)$/m, text, ~s{<h3>\\2</h3>})
  end

  def big(text) do
    Regex.replace(~r/\#\*\*(.*)\*\*\#/, text, ~s{<big>\\1</big>})
  end

  def small(text) do
    Regex.replace(~r/\#\#\*(.*)\*\#\#/, text, ~s{<small>\\1</small>})
  end


  def test_str do
    """
    # This is a header
    ## This is a secondary header
    ### This is a terceary header
    **I'm written in bold**
    *I'm written in itallic*
    #** I'm a big boy **#
    ##* I'm a small boy *##
    """
  end
end
