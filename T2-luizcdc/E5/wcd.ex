# não lê argumentos na chamada do programa, mas dentro do Elixir
argumentos = IO.gets("""
Digite o nome do arquivo, seguido das opções de uso. Ex:

umtexto.txt -linhas -caracteres -palavras

Caso nenhuma opção tenha sido especificada, conta apenas o número de palavras.

""") |> String.trim |> String.split(["-"," "])

# Extrai o nome do arquivo, que sempre é a primeira coisa digitada
arquivo = String.trim(Enum.at(argumentos,0))


conteudo = File.read!(arquivo)

n_caracteres = String.length(conteudo)

# Precisa armazenar o conteúdo das linhas para descontar newline no final do arquivo
linhas = String.split(conteudo, "\n")
n_linhas = Enum.count(linhas)

# conta o número de palavras usando uma regex para dividir a string e remove strings vazias
palavras = String.split(conteudo, ~r{(\\n|[^\w'])+}) |> Enum.filter(fn string -> string != "" end)
n_palavras = Enum.count(palavras)


if "linhas" in argumentos do
  # caso a última linha tenha sido vazia (depois de um \n) subtrai ela da contagem
  if List.last(linhas) == "" do
    IO.puts "Linhas: #{n_linhas-1}"
  else
    IO.puts "Linhas: #{n_linhas}"
  end
end

# Ativa se foi especificado "palavras" ou se nenhum dos outros foi especificado
# Por algum motivo sempre dá um a mais do que o wc do linux conta
if "palavras" in argumentos or not ("linhas" in argumentos or "caracteres" in argumentos) do
  IO.puts "Palavras: #{n_palavras-1}"
end

if "caracteres" in argumentos do
  IO.puts "Caracteres: #{n_caracteres}"
end
