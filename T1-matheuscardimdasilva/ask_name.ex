
defmodule GreetByName do
  def askName() do
    resposta = IO.gets("Olá! Poderia digitar o seu nome?\n")
    gotResposta(resposta)
  end
  
  def gotResposta(resposta) do
    resposta = String.trim(resposta)
    case resposta do
      "Matheus Silva" -> IO.puts("Meu nome também é #{resposta}!\n")
      _ -> IO.puts("Bem-vindo #{resposta}!\n")
    end
  end
end