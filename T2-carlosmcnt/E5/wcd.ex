#Aluno: Carlos Mosselman Cabral Neto

#Recebe o arquivo de texto
arquivo = IO.gets("Arquivo de texto: ") |> String.trim()

#Salva o arquivo lido na variável arq
arq = File.read! arquivo

#Conta o número de linhas no arquivo
linhas = String.split(arq, ~r{(\r\n|\n|\r)})

#Conta o número de palavras no arquivo, retirando os espaços vazios
palavras =
    String.split(arq, ~r{(\\n|[^\w'])+})
    |> Enum.filter(fn x -> x != "" end)

#Conta o número de caracteres no arquivo
caracteres = String.split(arq, "") |> Enum.filter(fn x -> x != "" end)

#Mostra no terminal a quantidade de linhas, palavras e caracteres
IO.puts(Enum.count(linhas))
IO.puts(Enum.count(palavras))
IO.puts(Enum.count(caracteres))
