#Aluno: Carlos Mosselman Cabral Neto
defmodule AskName do

  @moduledoc """
    O programa AskName tem o intuito de mostrar na tela uma mensagem após um nome
    ter sido digitado. Caso o nome seja o meu, o usuário principal do programa,
    a mensagem é diferente.
  """

  @doc """
    A função perguntar realiza o procedimento de perguntar o nome e mostrar a mensagem na tela,
    a depender do nome do usuário. Caso seja eu, a mensagem é diferente do que se fossem
    outros nomes.
  """

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
