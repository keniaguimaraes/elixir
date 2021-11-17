# e pedido ao usuario para informar o arquivo em que sera feito
# a operacao de contar linhas, palavras e caracteres
nomeDoArquivo =
  IO.gets("Digite o arquivo para contar linhas, palavras e caracteres:\n")
  |> String.trim

  # trata o nome do arquivo
  parteDoTexto = String.split(nomeDoArquivo, "-")
  nomeDoArquivo = List.first(parteDoTexto) |> String.trim

  # e feito a leitura dos elementos do arquivo
  corpoDoArquivo = File.read! nomeDoArquivo
  linhas = String.split(corpoDoArquivo, ~r{(\r\n|\n|\r)})
  palavras =
    String.split(corpoDoArquivo, ~r{(\\n|[^\w'])+})
    |> Enum.filter(fn x -> x != "" end)
  caracteres = String.split(corpoDoArquivo, "") |> Enum.filter(fn x -> x != "" end)

    # por fim, é mostrado a execucao das operacoes, sendo elas a quantidade
    # de linhas, palavras e caracteres
     IO.puts "#{Enum.count(linhas)} linhas, #{Enum.count(palavras)} palavras e #{Enum.count(caracteres)} caracteres"

# para executar
# elixir wc.ex
# em seguida digite o nome do arquivo para executar as operacoes
