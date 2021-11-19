defmodule Wc do
  def start(parsed, file, invalid) do
    if invalid != [] or file == "h" do
      show_help()
    else
      read_file(parsed, file)
    end
  end

  def show_help() do
    IO.puts("""
    Usage: [filename] - [flags]
    Flag
    -l show number of lines
    -c show number of chars
    -w show number of words
    umtexto.txt -lc
    """)
  end

  def read_file(parsed, filename) do
    flags =
      case Enum.count(parsed) do
        0 -> [:words]
        _ -> Enum.map(parsed, &elem(&1, 0))
      end

    body = File.read!(filename)
    lines = String.split(body, ~r{(\r\n|\n|\r)})

    words =
      String.split(body, ~r{(\\n|[^\w])+})
      |> Enum.filter(fn x -> x != "" end)

    chars = String.split(body, "") |> Enum.filter(fn x -> x !== "" end)

    Enum.each(flags, fn flag ->
      case flag do
        :lines -> IO.puts("lines: #{Enum.count(lines)}")
        :words -> IO.puts("words: #{Enum.count(words)}")
        :chars -> IO.puts("Chars: #{Enum.count(chars)}")
        _ -> nil
      end
    end)
  end
end
