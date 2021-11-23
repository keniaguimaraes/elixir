defmodule WordCount do
  def start(parsed, file, invalid) do
    if invalid != [] or file == "h" do
      ajuda()
    else
      read_file(parsed, file)
    end
  end

  def ajuda() do
    IO.puts("""
    Digite o nome do arquivo, seguido das opções de uso. Ex:

    umtexto.txt -lc

    Caso nenhuma opção tenha sido especificada, conta apenas o número de palavras.
    """)
  end

  def read_file(parsed, arquivo) do
    flags =
      case Enum.count(parsed) do
        0 -> [:words]
        _ -> Enum.map(parsed, &elem(&1, 0))
      end

    conteudo = File.read!(arquivo)

    n_caracteres = String.length(conteudo)

    linhas = String.split(conteudo, "\n")
    n_linhas = Enum.count(linhas)

    palavras =
      String.split(conteudo, ~r{(\\n|[^\w'])+}) |> Enum.filter(fn string -> string != "" end)

    n_palavras = Enum.count(palavras)

    Enum.each(flags, fn flag ->
      case flag do
        :linhas ->
          if List.last(linhas) == "" do
            IO.puts("Linhas: #{n_linhas - 1}")
          else
            IO.puts("Linhas: #{n_linhas}")
          end

        :palavras ->
          IO.puts("Palavras: #{n_palavras}")

        :caracteres ->
          IO.puts("Caracteres: #{n_caracteres}")
      end
    end)
  end
end
