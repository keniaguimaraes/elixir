argumentos = IO.gets("""
Digite o nome do arquivo, seguido das opções de uso. Ex:

umtexto.txt -linhas -caracteres -palavras

Caso nenhuma opção tenha sido especificada, conta apenas o número de palavras.

""") |> String.trim |> String.split(["-"," "])

arquivo = String.trim(Enum.at(argumentos,0))


conteudo = File.read!(arquivo)

n_caracteres = String.length(conteudo)

linhas = String.split(conteudo, "\n")
n_linhas = Enum.count(linhas)

palavras = String.split(conteudo, ~r{(\\n|[^\w'])+}) |> Enum.filter(fn string -> string != "" end)
n_palavras = Enum.count(palavras)


if "linhas" in argumentos do
  if List.last(linhas) == "" do
    IO.puts "Linhas: #{n_linhas-1}"
  else
    IO.puts "Linhas: #{n_linhas}"
  end
end

if "palavras" in argumentos or not ("linhas" in argumentos or "caracteres" in argumentos) do
  IO.puts "Palavras: #{n_palavras-1}"
end

if "caracteres" in argumentos do
  IO.puts "Caracteres: #{n_caracteres}"
end
