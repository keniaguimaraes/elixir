# Recebe o nome do arquivo que vai ter as palavras contadas
filename = String.trim(IO.gets("File to count the words from: "))
  |> String.trim()

# Separa as palavras pela regra da expressão regular e tira os espaços
words =
  File.read!(filename)
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)

# Executa a contagem das palavras e mostra no terminal a quantidade encontrada
words |> Enum.count() |> IO.puts()
