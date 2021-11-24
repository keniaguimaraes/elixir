ExUnit.start()

defmodule ExemplosTest do
  use ExUnit.Case

  test "Teste da função que dobra elementos de uma lista" do
    lista = [1,2,3,4,5]
    lista_dobrada = lista
    |> Enum.map(fn numero ->
      numero * 2
    end)
    assert Exemplos.dobra_lista() == lista_dobrada
  end

  test "Teste da função que dobra elementos de uma lista caso de falha" do
    lista = [1,2,3,4,5]
    lista_dobrada = lista
    |> Enum.map(fn numero ->
      numero * 1
    end)
    refute Exemplos.dobra_lista() == lista_dobrada
  end

  test "Teste da função que dobra um numero" do
    assert Exemplos.dobra_numero(8) == 16
  end

  test "Teste da função que dobra um numero - caso de falha" do
    refute Exemplos.dobra_numero(8) == 20
  end

end
