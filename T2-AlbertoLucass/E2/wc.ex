nomeDoArquivo =
  IO.gets("Digite o arquivo para contar linhas, palavras e caracteres:\n")
  |> String.trim

  parteDoTexto = String.split(nomeDoArquivo, "-")
  nomeDoArquivo = List.first(parteDoTexto) |> String.trim

  corpoDoArquivo = File.read! nomeDoArquivo
  linhas = String.split(corpoDoArquivo, ~r{(\r\n|\n|\r)})
  palavras =
    String.split(corpoDoArquivo, ~r{(\\n|[^\w'])+})
    |> Enum.filter(fn x -> x != "" end)
  caracteres = String.split(corpoDoArquivo, "") |> Enum.filter(fn x -> x != "" end)

     IO.puts "#{Enum.count(linhas)} linhas, #{Enum.count(palavras)} palavras e #{Enum.count(caracteres)} caracteres"

# para executar
# elixir wc.ex
# em seguida digite o nome do arquivo para executar as operacoes
