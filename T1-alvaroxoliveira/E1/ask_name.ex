defmodule AskName do
  def nome_e_saudacao() do
    resposta = IO.gets("Qual o seu nome?\n")
    case String.trim(resposta) do
      "Alvaro" ->
        "SALVE, SALVE, #{String.trim(resposta)}!"

      _ ->
        "Ola, grande amigx > #{String.trim(resposta)} < :D!!!"
  end
end
