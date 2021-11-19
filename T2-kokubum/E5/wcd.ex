# Imprime um exemplo para que o usuário entenda como deve ser a entrada padrão
IO.puts("Example of input: umtexto.txt -l -c -w\n")

# Recebe o nome do arquivo juntamente com as flags que o usuário quer usar (-l para contar as linhas / -c para contar os caracteres / -w para contar as palavras).
options =
  IO.gets("File to count (-l for lines / -c for characters / -w for words): ")
  |> String.trim()
  |> String.split(["-", " "])

# Faz um trim do nome do arquivo para remover espacos desnecessários no fim ou inicio da string.
filename = String.trim(Enum.at(options, 0))

# Lê o arquivo
body = File.read!(filename)

# Faz um split para pegar todas as linhas
lines = String.split(body, ~r{(\r\n|\n|\r)})

# Pega todas as palavras do arquivo lido
words =
  String.split(body, ~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)

# Pega a quantidade de caracteres do arquivo lido
chars = String.length(body)

# Faz uma verificação, caso a flag -l tenha sido usada, é preciso saber se a ultima linha for "", se sim eu removo uma unidade da quantidade total.
if "l" in options do
  if List.last(lines) == "" do
    IO.puts("Lines: #{Enum.count(lines) - 1}")
  else
    IO.puts("Lines: #{Enum.count(lines)}")
  end
end

# Caso tenha sido utilizado a flag -w, retorna a quantidade de palavras do arquivo
if "w" in options do
  IO.puts("Words: #{Enum.count(words) - 1}")
end

# Caso tenha sido utilizado a flag -c, retorna a quantidade de caracteres do arquivo
if "c" in options do
  IO.puts("Chars: #{chars}")
end
