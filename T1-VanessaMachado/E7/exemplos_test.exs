ExUnit.start()

defmodule ExemplosTest do
  use ExUnit.Case

  test "Teste da função que soma dois numeros" do
    assert Exemplos.sum(100, 200) == 300
  end

  test "Teste da função que soma dois numeros - soma incorreta" do
    refute Exemplos.sum(100, 200) == 320
  end

  test "Teste da função que imprime se valor é 10 com sucesso" do
    assert Exemplos.impressao(10) == "Valor é 10"
  end

  test "Teste da função que imprime se valor é maior 10 com sucesso" do
    assert Exemplos.impressao(11) == "Maior que 10"
  end

  test "Teste da função que imprime se valor é menor 10 com sucesso" do
    assert Exemplos.impressao(9) == "Menor que 10"
  end

  test "Teste da função que imprime que valor é maior 10 com erro passando o numero 10" do
    refute Exemplos.impressao(10) == "Maior que 10"
  end

  test "Teste da função que imprime que valor é menor 10 com erro passando o numero 10" do
    refute Exemplos.impressao(10) == "Menor que 10"
  end

  test "Teste da função que imprime que valor é menor 10 com erro passando um numero maior" do
    refute Exemplos.impressao(11) == "Menor que 10"
  end

  test "Teste da função que imprime que valor é 10 com erro passando um numero maior" do
    refute Exemplos.impressao(11) == "Valor é 10"
  end

  test "Teste da função que imprime que valor é maior 10 com erro passando um numero menor" do
    refute Exemplos.impressao(9) == "Maior que 10"
  end

  test "Teste da função que imprime que valor é 10 com erro passando um numero menor" do
    refute Exemplos.impressao(9) == "Valor é 10"
  end

end
