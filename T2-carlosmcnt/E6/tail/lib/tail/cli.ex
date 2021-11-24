defmodule Tail.CLI do
  def main(args) do
      {parsed, args, invalid} = OptionParser.parse(
          args,
          switches: [linhas: :integer, help: nil],
          aliases: [h: :help, n: :linhas])

      Tail.start(parsed, args, invalid)
  end
end
