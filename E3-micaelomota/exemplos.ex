sub = fn (a, b) -> a - b end

shortSub = &(&1 - &2)

checaUniversidade = fn
  {:ufba, nota} -> IO.puts "Você tá na UFBA"
  {:ucsal, _} -> IO.puts "Você tá na UCSAL"
  {:ifba} -> IO.puts "Você tá no IFBA"
end

defmodule Falador do
  def falaAsHoras(name) do
    "Olá, " <> name <> ", são " <> Date.to_string(Date.utc_today())
  end

  def falaPraEles(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> falaAsHoras
  end

  def falaAsHoras(name) when is_binary(name) do
    falaPrivado() <> name
  end

  def falaONome(%{nome: nomeDaPessoa}) do
    "Olá, " <> nomeDaPessoa <> ", seja bem vindo!"
  end

  defp falaPrivado, do: "Olá..."

  def traduz(name, language_code \\ "pt") do
    fala(language_code) <> name
  end

  defp fala("pt"), do: "Olá, "
  defp fala("en"), do: "Hello, "
  defp fala("es"), do: "Hola, "
end

defmodule Fibonacci do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)
end

defmodule Falador2 do
  def fala(), do: "Fala seu nome, cidadão"
  def fala(name), do: "Olá, " <> name        
  def fala(name1, name2), do: "Olá, #{name1} e #{name2}, tudo bem com vocês?"
end
