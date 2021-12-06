
meuarquivo = String.trim(IO.gets("Arquivo conta palavras: "))|> String.trim()
palavra =
  File.read!(meuarquivo)
  |> String.split(~r{(\\n|[^\w])+})
  |> Enum.filter(fn x -> x != "" end)

palavra |> Enum.count() |> IO.puts()


