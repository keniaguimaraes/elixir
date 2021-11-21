nome_arquivo = IO.gets("Nome do arquivo a ter palavras contadas: ") |> String.trim()

tmp = File.read!(nome_arquivo)

linhas = String.split(tmp, ~r{(\r\n|\n|\r)}) |> Enum.count

palavras = 
  tmp
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)
  |> Enum.count()

caracters = String.length(tmp)


"#{linhas} #{palavras} #{caracters} #{nome_arquivo}" |> IO.puts()
