defmodule GreetByName do
  @moduledoc """
    O programa pergunta o nome do usuário, e o cumprimenta.
  """

  @doc """
    A funcao pergunta o nome do usuário
  """
  def askName() do
    resposta = IO.gets("Olá! Poderia digitar o seu nome?\n")
    gotResposta(resposta)
  end

  @doc """
    A funcao o cumprimenta o usuario
    Caso o nome de usuario for Matheus Silva, ao invez de cumprimenta-lo, o programa afirma ter o mesmo nome.
  """
  def gotResposta(resposta) do
    resposta = String.trim(resposta)
    case resposta do
      "Matheus Silva" -> IO.puts("Meu nome também é #{resposta}!\n")
      _ -> IO.puts("Bem-vindo #{resposta}!\n")
    end
  end
end
