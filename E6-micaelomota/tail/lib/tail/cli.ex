defmodule Tail.CLI do
  def main(args) do
    {parsed, args, invalid} = OptionParser.parse(
        args,
        switches: [
          number: nil,
        ],
        aliases: [
          n: :number,
        ]
      )

      Tail.start(parsed, args, invalid)
  end
end