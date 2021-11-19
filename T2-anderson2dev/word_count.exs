
isNotEmpty =  fn word -> word != "" end

applyPattern = fn (body, pattern) -> String.split(body, pattern)
  |> Enum.filter(isNotEmpty)
end

newLinePattern = ~r/\n/

wordCountSeparatorPattern = ~r/((\\n)|[^\w']+)/
lineCountSeparatorPattern = ~r/(\r\n|\r|\n)/

fileName =  IO.gets("Enter the file name: ")
  |> String.replace(newLinePattern, "")
fileBody = File.read!(fileName)

IO.inspect(String.split(fileBody, lineCountSeparatorPattern))

wordCount = applyPattern.(fileBody, wordCountSeparatorPattern)
|> Enum.count

lineCount = String.split(fileBody, lineCountSeparatorPattern)
  |> Enum.count

charCount = applyPattern.(fileBody, "")
  |> Enum.count


IO.puts("#{lineCount} #{wordCount} #{charCount} #{fileName}")
