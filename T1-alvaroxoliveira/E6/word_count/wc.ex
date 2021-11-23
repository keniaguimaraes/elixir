arquivo =
    IO.gets("Arquivo para contar as palavras (h para ajuda):\n")
    |> String.trim

if arquivo == "h" do
    IO.puts
    """
    Usage: [arquivo] - [flags]
    Flag
    -l exibe a contagem de linha
    -c exibe a contagem de caracteres
    -w exibe a contagem de palavras (padrão)
    umtexto.txt -lc
    """
else
    parts = String.split(arquivo, " -")
    arquivo = List.first(parts) |> String.trim
    flags = case Enum.at(parts, 1) do
        nil -> ["w"]
        chars -> String.split(chars, "") |> Enum.filter(fn x -> x != "" end)
end

  corpo = File.read!(arquivo)
  linhas = String.split(corpo, ~r{(\r\n|\n|\r)})
  palavras =
    String.split(corpo, ~r{(\\n|[^\w])+})
    |> Enum.filter(fn x -> x != "" end)
  chars = String.split(corpo, "") |> Enum.filter(fn x -> x !== "" end)

  Enum.each(flags, fn flag ->
    case flag do
      "l" -> IO.puts("linhas: #{Enum.count(linhas)}")
      "w" -> IO.puts("palavras: #{Enum.count(palavras)}")
      "c" -> IO.puts("Chars: #{Enum.count(chars)}")
      _   -> nil
    end
  end)
end
