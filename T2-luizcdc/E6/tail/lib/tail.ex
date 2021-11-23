defmodule Tail do
  def start(parsed, file, invalid) do
    if invalid != [] or file in ["h", "-h", "--help"] do
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
        0 -> %{:lines => 10}
        _ -> Enum.into(parsed, %{})
      end

    conteudo = File.read!(arquivo)

    linhas1 = String.split(conteudo, ~r{(\r\n|\r|\n)})

    linhas =
      if List.last(linhas1) == "" do
        linhas1 |> :lists.reverse() |> tl() |> :lists.reverse()
      else
        linhas1
      end

    print_linhas(linhas, flags[:lines])
  end

  def print_linhas(linhas, number_to_print) do
    cond do
      number_to_print == 0 ->
        :ok

      Enum.count(linhas) == number_to_print ->
        c = hd(linhas)
        IO.puts(c)

        tl(linhas) |> print_linhas(number_to_print - 1)

      Enum.count(linhas) > number_to_print ->
        tl(linhas) |> print_linhas(number_to_print)
    end
  end
end
