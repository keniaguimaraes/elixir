defmodule Tail do
  @quantidade_padrao 10

  def main(parsed, arquivo, invalid) do
    ajuda = Enum.member?(parsed, {:ajuda, true})

    if Enum.count(arquivo) != 1 or invalid != [] or ajuda do
      unless ajuda, do: IO.puts("Bad input\n")
      show_help()
    else
      flags = Enum.into(parsed, %{})
      read_file(arquivo, flags)
    end
  end

  def show_help() do
    IO.puts("""
    Tail [arquivo] -[flags] [flag args]
    Flags:
    --ajuda               mostra essa mensagem
    --linhas [number]     mostra as últimas n linhas de um arquivo
    -h                    atua como --ajuda
    -n [number]           atua como --linhas

    Mostra 10 ultimas linhas caso não for passado um número específico no parâmetro
    da linha de comando
    Ex.:
    Tail umtexto.txt
    Tail umtexto.txt --linhas 10
    """)
  end

  def read_file(arquivo, flags) do
    texto = File.read!(arquivo)
    linhas = String.split(texto, ~r{(\r\n|\r|\n)})

    num_exibidas = if flags[:linhas] , do: flags[:linhas], else: @quantidade_padrao

    linhas
    |> Enum.take(-num_exibidas)
    |> Enum.join("\n")
    |> IO.puts()
  end
end
