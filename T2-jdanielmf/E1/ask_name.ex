defmodule AskName do
  def perguntar() do
    nome = IO.gets ("Digite 'seu nome'\n")
    case String.trim(nome) do
      "seu nome" -> IO.puts ("Voce e bem espertinho heim!\n")
      _ ->
        IO.puts ~s{Seja bem vindo #{String.trim(nome)}}
    end
  end
end
