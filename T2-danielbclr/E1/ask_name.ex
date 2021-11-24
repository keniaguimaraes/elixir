defmodule AskName do
  def main() do
    nome = IO.gets("Qual o seu nome?\n")

    if String.upcase(String.trim(nome)) == "DANIEL" do
      IO.puts(
        "Oi #{String.trim(nome)}, você tem o mesmo nome que o criador deste programa!"
      )
    else
      IO.puts("Olá, #{String.trim(nome)}!")
    end
  end
end
