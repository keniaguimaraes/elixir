# Recebe o nome de um arquivo
filename = String.trim(IO.gets("File to count the words from: "))
  |> String.trim()

# Separa as palavras de um arquivo através de uma regra
# descrita por uma Expressão Regular (RegEx)
# e retira os espaçoes vazios
words =
  File.read!(filename)
  |> String.split(~r{(\\n|[^\w])+})
  |> Enum.filter(fn x -> x != "" end)

# Faz as operações de contagem das palavras e mostra no terminal
# a quantidade de palavras encontrada.
words |> Enum.count() |> IO.puts()
