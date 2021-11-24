IO.puts("Exemplo de entrada: umtexto.txt\n")

#Pega do usuario o nome do arquivo
filename = IO.gets("Arquivo: ") |> String.trim()

#Le o conteudo
conteudo = File.read!(filename)

#Separa as linhas e conta elas
linhas = String.split(conteudo, ~r{(\r\n|\n|\r)}) |> Enum.count

#Separa as palavras por espaco e conta elas
palavras =
  String.split(conteudo, ~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)
  |> Enum.count
#

#Simplesmente conta todos os caracteres no arquivo
caracteres = String.length(conteudo)

#Imprime as variaveis
IO.puts("#{linhas} #{palavras} #{caracteres} #{filename}")
