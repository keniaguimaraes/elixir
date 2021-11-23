defmodule MiniMarkdown do
  @moduledoc """
  Provê a interface `to_html/1` para transformar um texto em (um subconjunto
  extendido de) Markdown em código HTML através de uma pipeline de funções auxi-
  liares.
  """

  @doc """
  Transforma um texto em (um subconjunto extendido de) Markdown em código HTML.

  ## Parameters

    - texto: String com o texto em Markdown.

  ## Examples

      iex> MiniMarkdown.to_html("**This will become bold and will be inside a paragraph**\n*While this will be italicized*")
      "<p><strong>This will become bold and will be inside a paragraph</strong></p><p><em>While this will be italicized</em></p>"
  """
  @spec to_html(String.t()) :: String.t()
  def to_html(texto) do
    texto |> parse_h1 |> parse_h2 |> parse_paragrafos |> parse_pequeno |> parse_grande |> parse_negrito |> parse_italico
  end


  @doc """
  Processa texto em negrito de Markdown (entre duplo asterisco '**') para a tag <strong></strong> de HTML.

  ## Parameters

    - texto: String com o texto a ser processado.

  ## Examples

      iex> parse_negrito("**This will become bold**")
      "<strong>This will become bold</strong>"
  """
  @spec parse_negrito(String.t()) :: String.t()
  def parse_negrito(texto), do: Regex.replace(~r/\*\*(.*)\*\*/ , texto,  "<strong>\\1</strong>")


  @doc """
  Processa texto em itálico de Markdown (entre asteriscos '*') para a tag <em></em> do HTML.

  ## Parameters

    - texto: String com o texto a ser processado.

  ## Examples

      iex> parse_italico("*This will become italic*")
      "<em>This will become italic</em>"
  """
  @spec parse_italico(String.t()) :: String.t()
  def parse_italico(texto), do: Regex.replace(~r/\*(.*)\*/ , texto, "<em>\\1</em>")


  @doc """
  Processa quebras de linha  para a tag <p></p> do HTML.

  ## Parameters

    - texto: String com o texto a ser processado.

  ## Examples

      iex> parse_paragrafos("This is a paragraph\n")
      "<p>This is a paragraph</p>"
  """
  @spec parse_paragrafos(String.t()) :: String.t()
  def parse_paragrafos(texto), do: Regex.replace(~r/(\r\n|\n|\r|^)+([^\r\n]+)((\r\n|\n|\r)+$)?/, texto, "<p>\\2</p>")


  @doc """
  Processa títulos marcados com # no início da linha para a tag <h1></h1> do HTML.

  ## Parameters

    - texto: String com o texto a ser processado.

  ## Examples

      iex> parse_h1("# This is a title\n")
      "<h1>This is a title</h1>"
  """
  @spec parse_h1(String.t()) :: String.t()
  def parse_h1(texto), do: Regex.replace(~r/(\r\n|\n|\r|^)\# +([^#][^\n\r]+)/, texto, "<h1>\\2</h1>")


  @doc """
  Processa subtítulos marcados com ## no início da linha para a tag <h2></h2> do HTML.

  ## Parameters

    - texto: String com o texto a ser processado.

  ## Examples

      iex> parse_h2("## This is a subtitle\n")
      "<h2>This is a title</h2>"
  """
  @spec parse_h2(String.t()) :: String.t()
  def parse_h2(texto), do: Regex.replace(~r/(\r\n|\n|\r|^)\#\# +([^#][^\n\r]+)/, texto, "<h2>\\2</h2>")


  @doc """
  Processa texto entre duplo menos '--' para a tag <small></small> do HTML.

  ## Parameters

    - texto: String com o texto a ser processado.

  ## Examples

      iex> parse_pequeno("--This is small text.--")
      "<small>This is small text.</small>"
  """
  @spec parse_pequeno(String.t()) :: String.t()
  def parse_pequeno(texto), do: Regex.replace(~r/\-\-(.*)\-\-/,texto,"<small>\\1</small>")


  @doc """
  Processa texto entre duplo mais '++' para a tag <big></big> do HTML.

  ## Parameters

    - texto: String com o texto a ser processado.

  ## Examples

      iex> parse_grande("--This is big text.--")
      "<big>This is big text.</big>"
  """
  @spec parse_grande(String.t()) :: String.t()
  def parse_grande(texto), do: Regex.replace(~r/\+\+(.*)\+\+/,texto,"<big>\\1</big>")
end
