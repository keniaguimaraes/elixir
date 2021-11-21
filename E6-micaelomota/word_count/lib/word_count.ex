defmodule WordCount do
  def start(parsed, file, invalid) do

    if (invalid != []) do
      IO.puts "Error: Invalid arguments: #{invalid.join(', ')}"
      showHelp()
    end

    # captura o nome do arquivo
    filename = List.first(file) |> String.trim()

    # IO.puts "Reading file: #{filename}"

    # # Extrai o conteúdo do arquivo
    texto = File.read!(filename)

    # IO.puts texto

    # separa o texto em palavras
    palavras = texto 
      |> String.split(~r{(\\n|[^\w'-])+}) 
      |> Enum.filter(fn x -> x != "" end) 

    # # Separa o texto em linhas
    lines = texto |> String.split(~r{\n})

    # # inicia as variáveis de resultado
    qtdCaracteres = String.length(texto)
    qtdPalavras = palavras |> Enum.count
    qtdLinhas = lines |> Enum.count

    options = case Enum.count(parsed) do
      0 -> [:words]
      _ -> Enum.map(parsed, &(elem(&1, 0)))
    end

    # IO.inspect(options)

    Enum.each(options, fn option ->
      case option do
        :words -> IO.puts "Words: #{qtdPalavras}"
        :lines -> IO.puts "Lines: #{qtdLinhas}"
        :chars -> IO.puts "Characters: #{qtdCaracteres}"
      end
    end
    )

    # imprime o resultado
  end

  def showHelp() do
    IO.puts("""
    Use lalala para executar o script.
    """)
  end
end
