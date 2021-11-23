defmodule AskName do 

  def ask() do
    name =
      IO.gets("Qual é o seu nome?\n")
      |> String.trim()

    case name do
      "Breno" -> "Que nome legal!"
      _ -> "Olá #{name}."
    end
  end
end
