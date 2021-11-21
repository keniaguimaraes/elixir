# Le o nome do arquivo
nome_arquivo = IO.gets("Nome do arquivo a ter palavras contadas: ") |> String.trim()

# Le o arquivo numa variavel temporaria
tmp = File.read!(nome_arquivo)

# Salva o numero de linhas na variavel linhas
linhas = String.split(tmp, ~r{(\r\n|\n|\r)}) |> Enum.count

# Salva o numero de palavras na variavel palavras
palavras = 
  tmp
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)
  |> Enum.count()

# Salva o caracters de palavras na variavel caracters
caracters = String.length(tmp)


# Imprime linhas, palavras e caracters alem do nome do arquivo.
"#{linhas} #{palavras} #{caracters} #{nome_arquivo}" |> IO.puts()
