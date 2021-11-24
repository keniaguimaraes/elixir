#Aluno: Carlos Mosselman Cabral Neto
#Programa para perguntar o nome
defmodule AskName do

  def perguntar() do
    #Recebe o nome na entrada
    nome = IO.gets("Qual eh o seu nome?\n") |> String.trim()

    case String.trim(nome) do
      #Caso seja meu nome, a mensagem é diferente
      "Carlos Neto" ->
        "Ola Carlos, esse programa foi criado por vc, bom trabalho e um bom dia"

      #Caso seja qualquer outro nome
      _ ->
        "Ola #{nome}, tenha um bom dia"
    end

  end

end
