ExUnit.start()

defmodule ExemplosTest do
  use ExUnit.Case

  # testes que não passam
  test "teste que nao passa 1" do
    assert is_integer(Guards.printarFlo(15.2)) == true
  end

  test "teste que nao passa 2" do
    assert is_float(Guards.printarInt(20)) == true
  end

  # testes que passam
  test "teste que passa 1" do
    assert is_integer(Guards.printarFlo(20.2)) == false
  end

  test "teste que passa 2" do
    assert is_float(Guards.printarInt(15)) == false
  end

end

# para executar  elixir -r exemplos.ex exemplosTest.exs
