# Ask Name

defmodule Cumprimentar do
  @moduledoc """
  Provê a função cumprimentar_alguem/1 que cumprimenta o usuário com o seu nome,
  e se o nome for o mesmo que o autor do programa, a mensagem muda.
  """

  @doc """
  Pergunta ao usuário qual é o seu nome e imprime na tela um cumprimento ao
  usuário com o seu nome, e se o nome for o mesmo que o autor do programa,
  a mensagem é diferente.
  """
  @spec cumprimentar_alguem() :: :ok
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
