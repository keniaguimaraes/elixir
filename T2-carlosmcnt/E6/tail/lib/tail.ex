defmodule Tail do
  @linhaspadrao 1

  def start(parsed, arquivo, invalid) do
    ajuda = Enum.member?(parsed, {:help, true})

    if Enum.count(arquivo) != 1 or invalid != [] or ajuda do
        unless ajuda, do: IO.puts("Erro de input\n")
        comandos_ajuda()
    else
        flags = Enum.into(parsed, %{})
        ler_arquivo(arquivo, flags)
    end

  end

  def comandos_ajuda() do
      IO.puts("""
      Formatação: Tail [arquivo] -[flags] [quantidade de linhas]
      Flags:
      --help                comandos de ajuda
      --linhas [número]     mostra as últimas n linhas de um arquivo
      -h                    padrão para --help
      -n [número]           semelhante a --linhas

      Exemplo:
      Tail umtexto.txt --linhas 5 (vai mostrar as últimas 5 linhas)

      Se nenhuma flag for passada, mostra somente a última linha do txt.

      Exemplo:
      Tail umtexto.txt (vai mostrar a última linha)
      """)
  end

  def ler_arquivo(arquivo, flags) do
      corpo = File.read!(arquivo)
      linhas = String.split(corpo, ~r{(\r\n|\r|\n)})

      num = if flags[:linhas], do: flags[:linhas], else: @linhaspadrao

      linhas
      |> Enum.take(-num)
      |> Enum.join("\n")
      |> IO.puts()
  end

end
