ExUnit.start()

defmodule MiniMarkdownTest do
  use ExUnit.Case

  test "dividir: promocao para float arg. 1" do
    assert is_float(FuncaoExemplo.dividir(0.5, 1)) == true
  end

  test "dividir: promocao para float arg. 2" do
    assert is_float(FuncaoExemplo.dividir(1, 2.5)) == true
  end

  test "dividir: integer division" do
    assert is_integer(FuncaoExemplo.dividir(1, 2)) == true
  end

  test "dividir: integers return float" do
    assert is_float(FuncaoExemplo.dividir(1, 2)) == true
  end
end
