defmodule WC do
  @moduledoc """
  Este modulo tem a funcao de ler um arquivo e mostrar quantas linhas palavras e caracteres ele possui
  """
  #Le o arquivo
  filename = IO.gets("Arquivo a ser lido: ") |> String.trim()
  #Define o numero de palavras
  words =
    File.read!(filename)
    |> String.split(~r{(\\n|[^\w'])+})
    |> Enum.filter(fn x -> x != "" end)
  #Define o numero de linhas
  lines =
    File.read!(filename)
    |> String.split( ~r{(\r\n|\n|\r)})
  #Define o numero de caracteres
  chars =
    File.read!(filename)
    |> String.length()

  palavras = words |> Enum.count()
  linhas = lines |> Enum.count()

  IO.puts ~s(Nome do arquivo: "#{filename}")
  IO.puts ~s(Linhas: #{linhas})
  IO.puts ~s(Palavras #{palavras})
  IO.puts ~s(Caracteres #{chars})
end
