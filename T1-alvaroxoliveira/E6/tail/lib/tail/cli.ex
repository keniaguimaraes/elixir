defmodule Tail.CLI do
  def main(args) do
    {parsed, args, invalid} = OptionParser.parse(
      args,
      switches: [linhas: :integer, ajuda: nil],
      aliases: [n: :linhas, h: :ajuda])

    Tail.main(parsed, args, invalid)
  end
end
