defmodule WC do
  filename = IO.gets("Arquivo a ser lido: ") |> String.trim()
  words =
    File.read!(filename)
    |> String.split(~r{(\\n|[^\w'])+})
    |> Enum.filter(fn x -> x != "" end)

  lines =
    File.read!(filename)
    |> String.split( ~r{(\r\n|\n|\r)})

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
