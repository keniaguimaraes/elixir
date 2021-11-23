defmodule AskName do 

  def ask() do
    #recebe o nome
    name =
      IO.gets("Qual é o seu nome?\n")
      |> String.trim()

    #caso o nome seja Breno um resposta diferente sera exibida
    case name do
      "Breno" -> "Que nome legal!"
      _ -> "Olá #{name}."
    end
  end
end
