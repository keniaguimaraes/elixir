defmodule Tail do
  
  def start(parsed, file, invalid) do
    if (file == []) or (invalid != []) do
      IO.puts "ERRO: Argumentos inválidos"
    else
      # captura o nome do arquivo
      filename = List.first(file) |> String.trim()

      # Extrai o conteúdo do arquivo
      texto = File.read!(filename) |> String.trim()

      # Pega a quantidade de linhas definidas
      numberOfLines = Keyword.get(parsed, :number, "-1") |> String.to_integer()

      if numberOfLines == -1 do
      # Se não for definida nada imprime o texto todo
        IO.puts texto
      else
        # Imprime as n últimas linhas
        lines = texto |> String.split(~r{\n}) |> Enum.take(numberOfLines * -1) |> Enum.join("\n")
        IO.puts(lines)
      end
    end
  end
end
