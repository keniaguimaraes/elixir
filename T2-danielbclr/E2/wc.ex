IO.puts("Exemplo de entrada: umtexto.txt\n")

filename = IO.gets("Arquivo: ") |> String.trim()

conteudo = File.read!(filename)

linhas = String.split(conteudo, ~r{(\r\n|\n|\r)}) |> Enum.count

palavras =
  String.split(conteudo, ~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)
  |> Enum.count
#

caracteres = String.length(conteudo)

IO.puts("#{linhas} #{palavras} #{caracteres} #{filename}")
