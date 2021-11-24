defmodule Tail do
    @default_linhas 3

    def start(parsed, arquivo, invalido) do
        ajuda_flag = Enum.member?(parsed, {:ajuda, true})

      if Enum.count(arquivo) != 1 or invalido != [] or ajuda_flag do
          unless ajuda_flag, do: IO.puts("Bad input\n")
          mostra_ajuda()
      else
          flags = Enum.into(parsed, %{})
          ler_arquivo(arquivo, flags)
      end
    end

    def mostra_ajuda() do
        IO.puts("""
        Use: Tail [arquivo] -[flags] [flag args]
        Flags:
        --ajuda               mostra essa mensagem
        --linhas [number]     mostra as últimas n linhas de um arquivo
        -h                    atua como --ajuda
        -n [number]           atua como --linhas

        Se nenhuma flag for passada, Mostra as 10 últimas linhas.
        Ex.:
        Tail umtexto.txt
        Tail umtexto.txt --linhas 10
        """)
    end

    def ler_arquivo(arquivo, flags) do
        corpo = File.read!(arquivo)
        linhas = String.split(corpo, ~r{(\r\n|\r|\n)})

        num_exibidas = if flags[:linhas], do: flags[:linhas], else: @default_linhas

        linhas
        |> Enum.take(-num_exibidas)
        |> Enum.join("\n")
        |> IO.puts()
    end
end
