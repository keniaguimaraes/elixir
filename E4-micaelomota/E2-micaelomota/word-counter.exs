filename = IO.gets("Arquivo: ") |> String.trim()

# IO.puts "Contando palavras do arquivo #{filename}"

texto = File.read!(filename)

palavras = texto 
  |> String.split(~r{(\\n|[^\w'-])+}) 
  |> Enum.filter(fn x -> x != "" end) 


# caracteres = palavras 
#   |> Enum.reduce(0, fn x, acc -> acc + String.length(x) end)

lines = texto |> String.split(~r{\n})

qtdCaracteres = String.length(texto)
qtdPalavras = palavras |> Enum.count
qtdLinhas = lines |> Enum.count

IO.puts("#{qtdLinhas} #{qtdPalavras} #{qtdCaracteres} #{filename}")