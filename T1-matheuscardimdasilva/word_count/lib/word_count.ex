defmodule WordCount do
  def start(parsed, nome_arquivo, invalid) do
    if (invalid != []) or (nome_arquivo == "h") do
      show_help()
    else
      read_file(parsed, nome_arquivo)
    end
  end

  def read_file(parsed, nome_arquivo) do
    flags = case Enum.count(parsed) do
      0 -> [:words]
      _ -> Enum.map parsed, &(elem(&1, 0))
    end

    
    tmp = File.read!(nome_arquivo)


    linhas = String.split(tmp, ~r{(\r\n|\n|\r)}) |> Enum.count

    palavras = 
      tmp
      |> String.split(~r{(\\n|[^\w'])+})
      |> Enum.filter(fn x -> x != "" end)
      |> Enum.count()

    caracters = String.length(tmp)


    Enum.each(flags, fn flag ->
      case flag do
        :lines -> IO.puts "Linhas: #{linhas}"
        :words -> IO.puts "Palavras: #{palavras}"
        :chars -> IO.puts "Caracteres: #{caracters}"
      end
    end)
  end

  def show_help() do
    IO.puts """
      Digite um nome de arquivo seguido por flags c w l para caracters, palavras e linhas respectivamente. 
    """
  end
end