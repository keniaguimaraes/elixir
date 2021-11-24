arquivo = String.trim(IO.gets("Arquivo para contar as palavras: ")) |> String.trim()

palavras =
    File.read!(arquivo)
    |> String.split(~r{(\\n|[^\w])+})
    |> Enum.filter(fn x -> x != "" end)

palavras |> Enum.count() |> IO.puts()
