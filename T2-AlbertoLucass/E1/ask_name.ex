defmodule AskName do
  def printName() do
    name = IO.gets("What's you name my beatiful person?\n")
    IO.puts("Hello world #{String.trim(name)} from Elixir")

  end
end
#to execute it use
# c "ask_name.ex"
# AskName.printName 'nameHere'
#
