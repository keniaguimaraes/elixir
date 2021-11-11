# Ask Name

defmodule Cumprimentar do
  def cumprimentar_alguem() do
    nome = IO.gets("Qual é o seu nome? ") |> String.trim
    case String.upcase(nome) do
      meunome when meunome in ["LUIZ", "CLÁUDIO", "CLAUDIO", "LUIZ CLAUDIO", "LUIZ CLÁUDIO"] ->
        IO.puts("Olá, #{nome}. O criador desse programa também se chama #{nome}!")
      _ ->
        IO.puts("Olá, #{nome}. É um prazer!")
    end
  end
end
