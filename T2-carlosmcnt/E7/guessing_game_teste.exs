ExUnit.start()

defmodule GuessingGameTeste do
  use ExUnit.Case

  test "string nao eh numero" do
    assert GuessingGame.meio(10, 100) == "55"
  end

  test "numero correto" do
    assert GuessingGame.meio(10, 100) == 55
  end


end
