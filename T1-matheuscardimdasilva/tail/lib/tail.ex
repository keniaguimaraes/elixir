defmodule Tail do
  @quantidade_de_linhas_padrao 10
  def start(parsed, filename, invalid) do
    if (Enum.count(filename) != 1) or (invalid != []) do
      show_help()
    else
      flags = Enum.into parsed, %{}
      read_file(filename, flags)
    end
  end

  def show_help() do
    IO.puts """
    Digite o nome de arquivo e uma flag -n seguida do numero de linhas
    """
  end

  def read_file(filename, flags) do
    conteudo_arquivo = File.read!(filename)
    linhas = String.split(conteudo_arquivo, ~r{(\r\n|\r|\n)})
    quantidade_de_linhas = if flags[:lines], do: flags[:lines], else: @quantidade_de_linhas_padrao

    linhas 
      |> Enum.take(-quantidade_de_linhas)
      |> Enum.join("\n")
      |> IO.puts
  end
end
