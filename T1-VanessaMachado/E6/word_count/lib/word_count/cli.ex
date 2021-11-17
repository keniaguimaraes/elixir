defmodule WordCount.CLI do
  def main(args) do
    {parsed, args, invalid} = OptionParser.parse(
      args,
      switches: [chars: nil, linhas: nil, palavras: nil],
      aliases: [c: :chars, l: :linhas, w: :palavras]
    )
    WordCount.start(parsed, args, invalid)
  end
end
