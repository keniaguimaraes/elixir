defmodule GreetByName do
  @moduledoc """
    O programa pergunta o nome do usuário, e o cumprimenta.
  """

  @doc """
    A funcao pergunta o nome do usuário, e o cumprimenta.
    Caso o nome de usuario for Matheus Silva, ao invez de cumprimenta-lo, o programa afirma ter o mesmo nome.
  """
  def askName() do
    resposta = IO.gets("Olá! Poderia digitar o seu nome?\n")
    resposta = String.trim(resposta)
    case resposta do
      "Matheus Silva" -> IO.puts("Meu nome também é #{resposta}!\n")
      _ -> IO.puts("Bem-vindo #{resposta}!\n")
    end
  end
end


GreetByName.askName