# Recebe do usuário o nome de um arquivo, do qual as palavras deverão ser contadas

arquivo = String.trim(IO.gets("Arquivo para contar as palavras: ")) |> String.trim()

# A partir do arquivo passado pelo usuário, separa as palavras deste através de uma RegEx
# Faz a retirada dos espaçoes vazios

palavras =
    File.read!(arquivo)
    |> String.split(~r{(\\n|[^\w])+})
    |> Enum.filter(fn x -> x != "" end)

# Executa a contagem das palavras e mostra no terminal a quantidade encontrada

palavras |> Enum.count() |> IO.puts()
