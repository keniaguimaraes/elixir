# Ask Name
defmodule AskName do
  def cumprimentar() do
    nome = IO.gets("Olá, qual é o seu nome?\n")

    case String.downcase(String.trim(nome)) do
      "micael" -> IO.puts("Opa, você é meu chará!")
      _ -> IO.puts("Prazer em te conhecer, #{nome}")
    end
  end

end