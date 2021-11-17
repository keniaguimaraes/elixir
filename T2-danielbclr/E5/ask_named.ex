defmodule AskName do
  @moduledoc """
  Inicia com main/0, pergunta seu nome e compara com Daniel.
  """
  def main() do
    @doc """
    funcao principal, pega nome do usuario
    """
    # Pega o nome do usuario
    nome = IO.gets("Qual o seu nome?\n")

    # Verifica se o nome e igual ao meu
    if String.upcase(String.trim(nome)) == "DANIEL" do
      IO.puts(
        "Oi #{String.trim(nome)}, você tem o mesmo nome que o criador deste programa!"
      )
    else
      IO.puts("Olá, #{String.trim(nome)}!")
    end
  end
end
