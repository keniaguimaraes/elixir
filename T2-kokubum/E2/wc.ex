IO.puts("Example of input: umtexto.txt -l -c -w\n")

options =
  IO.gets("File to count (-l for lines / -c for characters / -w for words): ")
  |> String.trim()
  |> String.split(["-", " "])

filename = String.trim(Enum.at(options, 0))

body = File.read!(filename)
lines = String.split(body, ~r{(\r\n|\n|\r)})

words =
  String.split(body, ~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)

chars = String.length(body)

if "l" in options do
  if List.last(lines) == "" do
    IO.puts("Lines: #{Enum.count(lines) - 1}")
  else
    IO.puts("Lines: #{Enum.count(lines)}")
  end
end

if "w" in options do
  IO.puts("Words: #{Enum.count(words) - 1}")
end

if "c" in options do
  IO.puts("Chars: #{chars}")
end
