defmodule AskName do
  @moduledoc """
  Este modulo fornece uma funcao que ira saudar de acordo com o nome fornecido
  """
  @doc """
  Esta funcao solicita um nome ao usuario e o sauda. Existe um easter egg nela.

  ## Parametros

    - nome: String que ira representar o nome fornecido pelo usuario

  """
  def perguntar() do
    nome = IO.gets ("Digite 'seu nome'\n")
    case String.trim(nome) do
      "seu nome" -> IO.puts ("Voce e bem espertinho heim!\n")
      _ ->
        IO.puts ~s{Seja bem vindo #{String.trim(nome)}}
    end
  end
end
