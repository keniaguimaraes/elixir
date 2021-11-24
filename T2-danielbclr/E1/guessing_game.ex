defmodule GuessingGame do
  def jogar() do
    IO.puts("Vamos Jogar! Vou chutar onde qual seu numero e voce me respondera 'mais', 'menos' ou 'sim. \n")
    intervalo = IO.gets("Vamos Jogar! Insira o intervalo onde seu numero esta. \n")

    array = String.split(String.trim(intervalo))
    a = String.to_integer(Enum.at(array, 0))
    b = String.to_integer(Enum.at(array, 1))

    chutar(a, b)

  end

  def chutar(a, b) do
    chute = IO.gets("Seu numero eh #{mid(a, b)}?\n")

    case String.trim(chute) do
      "mais" ->
        mais(a, b)

      "menos" ->
        menos(a, b)

      "sim" ->
        IO.puts("Acertei!")

      _ ->
        IO.puts(~s{Type "mais", "menos" or "sim"})
        chutar(a, b)
    end
  end

  def mid(a, b) do
    div(a + b, 2)
  end

  def mais(a, b) do
    novo_a = min(b, mid(a, b) + 1)
    chutar(novo_a, b)
  end

  def menos(a, b) do
    novo_b = max(a, mid(a, b) - 1)
    chutar(a, novo_b)
  end
end
