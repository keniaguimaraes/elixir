defmodule Tail.CLI do
  def main(args) do
      {parsed, args, invalido} = OptionParser.parse(
          args,
          switches: [linhas: :integer, ajuda: nil],
          aliases: [h: :ajuda, n: :linhas])

      Tail.start(parsed, args, invalido)
  end
end
