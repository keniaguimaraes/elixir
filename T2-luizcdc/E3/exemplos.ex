anonima = fn a -> -a end # retorna o oposto de um número

anonima_abreviada = &(&1 * &1) # retorna o quadrado de um número

pattern_matching = fn
    x -> x * x
    x, y -> x * y
end

defmodule FuncaoExemplo do
  def funcaoNomeada() do
        {menor, _} = IO.gets("Digite o menor valor.") |> String.trim |> Integer.parse
        {maior, _} = IO.gets("Digite o maior valor.") |> String.trim |> Integer.parse
        IO.puts("A média entre os dois números é #{div(menor + maior,2)}")
    end
  end
  def funcaoDeUmaLinha(), do: IO.gets("Digite a frase que quer transformar em maiúscula") |> String.upcase

  def fatorial_pattern_matching(1), do: 1
  def fatorial_pattern_matching(x), do: x * fatorial_pattern_matching(x-1)

  def raiz_varia_com_aridade(x), do: :math.sqrt(x)
  def raiz_varia_com_aridade(x,y), do: :math.pow(x,1/y)

  def pode_viajar_sozinho(%{idade: idade_da_pessoa}) do # dados de uma pessoa estão nesse map, mas só nos interessa a idade
    idade_da_pessoa >= 18
  end
  def pode_viajar_sozinho_2(%{idade: idade_da_pessoa} = pessoa) do # dados de uma pessoa estão nesse map, mas só nos interessa a idade
    if idade_da_pessoa >= 18 do
      IO.puts("#{pessoa[:nome]} pode viajar sozinho/a, pois tem #{idade_da_pessoa} anos.")
    else
      IO.puts("#{pessoa[:nome]} não pode viajar sozinho/a, pois tem apenas #{idade_da_pessoa} anos.")
    end
  end

  defp funcao_privada() do
    IO.puts("Essa função faz algo bem secreto")
  end

  def funcao_nao_privada() do
    IO.puts("De dentro do módulo posso chamar a função privada")
    funcao_privada()
  end

  def dividir(x,y) when is_float(x) or is_float(y) do
    x / y
  end

  def dividir(x,y) when is_integer(x) and is_integer(y) do
    div(x,y)
  end

  def login(username \\ "convidado") do
    IO.puts("Você está entrou como \"#{username}\"")

end
