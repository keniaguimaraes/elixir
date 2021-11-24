defmodule WordCount do
  def start(parsed, arquivo, invalido) do
    if (invalido != []) or (arquivo == "h") do
      interface()
    else
      leitura_de_arquivo(parsed, arquivo)
    end
  end

  def interface() do
    IO.puts """
      Usage: [arquivo] - [flags]
      Flag
      -l exibe a contagem de linha
      -c exibe a contagem de caracteres
      -w exibe a contagem de palavras (padrão)
      umtexto.txt -lc
      """
  end

  def leitura_de_arquivo(parsed, arquivo) do
    flags = case Enum.count(parsed) do
      0 -> [:words]
      _ -> Enum.map parsed, &(elem(&1, 0))
    end

    IO.inspect flags

    corpo = File.read!(arquivo)
    linhas = String.split(corpo, ~r{(\r\n|\n|\r)})
    palavras =
      String.split(corpo, ~r{(\\n|[^\w])+})
      |> Enum.filter(fn x -> x != "" end)
    chars = String.split(corpo, "") |> Enum.filter(fn x -> x !== "" end)
    Enum.each(flags, fn flag ->
      case flag do
        :linhas -> IO.puts("linhas: #{Enum.count(linhas)}")
        :palavras -> IO.puts("palavras: #{Enum.count(palavras)}")
        :chars -> IO.puts("Chars: #{Enum.count(chars)}")
        _   -> nil
      end
    end)
  end
end
