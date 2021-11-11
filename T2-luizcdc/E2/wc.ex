argumentos = IO.gets("""
Digite o nome do arquivo, seguido das opções de uso. Ex:

umtexto.txt -linhas -caracteres -palavras

Caso nenhuma opção tenha sido especificada, conta apenas o número de palavras.

""") |> String.trim |> String.split(["-"," "])

arquivo = String.trim(Enum.at(argumentos,0))

conteudo = File.read!(arquivo)
n_caracteres = String.length(conteudo)
n_linhas = (String.split(conteudo, "\n") |> Enum.count())
palavras = String.split(conteudo, ~r{(\\n|[^\w'])+})
palavras =  Enum.filter(palavras,fn string -> string != "" end)
n_palavras = Enum.count(palavras)


if "linhas" in argumentos do
  IO.puts "Linhas: #{n_linhas-1}"
end
if "palavras" in argumentos or Enum.count(argumentos) == 1 do
  IO.puts "Palavras: #{n_palavras-1}"
end
if "caracteres" in argumentos do
  IO.puts "caracteres: #{n_caracteres}"
end
