defmodule AskName do
  @moduledoc """
    Modulo da classe que pergunta o nome.
    Fornece uma função que cumprimenta o usuário.
  """

  @doc """
  Pergunta o nome e cumprimenta o usuário.

  ## Exemplos

      iex> Greeter.cumprimentar()
      "Olá, qual é o seu nome?"
      iex> Micael
      "Opa, você é meu chará!"

      iex> Greeter.cumprimentar()
      "Olá, qual é o seu nome?"
      iex> João
      Prazer em te conhecer, João

  """
  @spec cumprimentar() :: nil
  def cumprimentar() do
    nome = IO.gets("Olá, qual é o seu nome?\n")

    case String.downcase(String.trim(nome)) do
      "micael" -> IO.puts("Opa, você é meu chará!")
      _ -> IO.puts("Prazer em te conhecer, #{nome}")
    end
  end

end