defmodule WordCount.CLI do
    def main(args) do
        {parsed, args, invalid} = OptionParser.parse(
            args,
            switches: [caracteres: nil, linhas: nil, palavras: nil],
            aliases: [c: :caracteres, l: :linhas, p: :palavras])

        WordCount.start(parsed,args,invalid)
    end
end
