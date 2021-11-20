defmodule AskName do
  def printName(name) do
    IO.puts("Hello world #{String.trim(name)} from Elixir")

  end
end
#to execute it use
# c "ask_name.ex"
# AskName.printName 'nameHere'
#
