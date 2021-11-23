# Ask Name
defmodule AskName do

  def sameFirstName(name) do
    first_name_regex = ~r/^anderson(\s?\w+)*$/iu
    String.match?(name, first_name_regex)
  end

  def greeting(name) do
    if sameFirstName(name) do
      IO.puts("Sunkmanitu Tanka Ob Waci")
    else
      IO.puts("Hi there, nice to meet you #{name}")
    end
  end

  def ask() do
    name = IO.gets("What is your name?\n")
    greeting(name)
  end
end
