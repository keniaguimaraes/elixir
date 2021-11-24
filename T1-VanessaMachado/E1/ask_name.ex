defmodule AskName do

  def nome() do

      resposta = IO.gets("Qual o seu nome?\n")

      case String.trim(resposta) do

          "Vanessa" ->
            "Olá, seja muito bem vinda. Tenha um dia abençoado, #{String.trim(resposta)}!"

          _ ->
              "Oi, #{String.trim(resposta)}!"

      end

  end

end
