defmodule Caboose do
  @default_lines 10

  def start(parsed, filename, invalid) do
    help_flag = Enum.member?(parsed, {:help, true})

    if Enum.count(filename) != 1 or invalid != [] or help_flag do
      unless help_flag, do: IO.puts("Entrada Errada\n")
      show_help()
    else
      flags = Enum.into(parsed, %{})
      read_file(filename, flags)
    end
  end

  def show_help() do
    IO.puts("""
    Usage: caboose [filename] -[flags] [flag args]

    Flags:
    --help               mostra essa mensagem
    --lines [numero]     mostra as ultimas n linhas do arquivo
    -h                   mesmo que --help
    -n [numero]          mesmo que --lines

    Se nenhuma flag e utilizada, o programa mostra as ultimas 10 linhas

    caboose somefile.txt
    caboose somefile.txt --lines 40
    """)
  end

  def read_file(filename, flags) do
    body = File.read!(filename)
    lines = String.split(body, ~r{(\r\n|\r|\n)})

    num_displayed = if flags[:lines], do: flags[:lines], else: @default_lines

    lines
    |> Enum.take(-num_displayed)
    |> Enum.join("\n")
    |> IO.puts()
  end
end

# mix escript.build
# escript ./caboose ./umtexto.txt -n numeroDeLinhas
