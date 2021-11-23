

defmodule AskName do
@moduledoc """
  Chama uma funcao printName para mostrar o nome do usuario
  """

  @doc """
  É solicitado o nome do usuario para posteriormente cumprimenta-lo
  """
  def printName() do
    name = IO.gets("What's you name my beatiful person?\n")
    IO.puts("Hello world #{String.trim(name)} from Elixir")

  end
end
#to execute it use
# c "ask_name.ex"
# AskName.printName 'nameHere'
