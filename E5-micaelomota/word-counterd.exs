# captura o nome do arquivo
filename = IO.gets("Arquivo: ") |> String.trim()

# Extrai o conteúdo do arquivo
texto = File.read!(filename)

# separa o texto em palavras
palavras = texto 
  |> String.split(~r{(\\n|[^\w'-])+}) 
  |> Enum.filter(fn x -> x != "" end) 


# Separa o texto em linhas
lines = texto |> String.split(~r{\n})

# inicia as variáveis de resultado
qtdCaracteres = String.length(texto)
qtdPalavras = palavras |> Enum.count
qtdLinhas = lines |> Enum.count

# imprime o resultado
IO.puts("#{qtdLinhas} #{qtdPalavras} #{qtdCaracteres} #{filename}")