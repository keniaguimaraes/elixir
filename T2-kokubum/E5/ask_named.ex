defmodule AskName do
  @moduledoc """
  Fornece a função ask_name que pergunta o nome do usuário e o cumprimenta de acordo com o nome que ele colocou.
  Se o nome for igual ao do autor (Erick), a mensagem então será diferente.
  """

  @doc """
  Pergunta o nome do usuário e imprime uma mensagem comum, caso o nome seja igual ao do autor do código (Erick), será
  impresso uma mensagem diferente.
  """
  @spec ask_name() :: :ok
  def ask_name() do
    name = IO.gets("What's your name? ")
    baseName = String.upcase(name)
    isEqual = String.trim(baseName) == "ERICK"

    if isEqual do
      IO.puts(
        "Hey #{String.trim(name)}, congratulations, you have the same name as me! Nice to meet you, we will definitely be friends!"
      )
    else
      IO.puts("Hello, #{String.trim(name)}! Nice to meet you!")
    end
  end
end
