defmodule Util do
  # Named function
  def concat(a, b) do
    a <> b
  end
  def askName do
    name = IO.gets("Type your name: ")
    |> String.replace(~r/\n/, "")
    addGreeting(name)
  end
  # Private function
  defp addGreeting(name) do
    "Hi " <> name
  end
end

# Anonymous function
concat_a = fn (a,b) -> a<>b  end
# Anonymous function with shorthand syntax
concat_b =  &(&1 <> &2)

arg_a =  "abcde"
arg_b = "fghi"

IO.puts(concat_a.(arg_a, arg_b))
IO.puts(concat_b.(arg_a, arg_b))
IO.puts(Util.concat(arg_a, arg_b))
IO.puts(Util.askName)
