#Aluno: Carlos Mosselman Cabral Neto
#Programa de contador de palavras
arquivo = IO.gets("Arquivo de texto: ") |> String.trim() #Recebe o arquivo de texto

arq = File.read! arquivo

linhas = String.split(arq, ~r{(\r\n|\n|\r)})

palavras =
    String.split(arq, ~r{(\\n|[^\w'])+})
    |> Enum.filter(fn x -> x != "" end)

caracteres = String.split(arq, "") |> Enum.filter(fn x -> x != "" end)

IO.puts(Enum.count(linhas))
IO.puts(Enum.count(palavras))
IO.puts(Enum.count(caracteres))
