defmodule Exemplos do
  @moduledoc """
  Módulo que contém algumas funções de exemplo para conhecimento
  """

  ##### Funções de módulo, nomeadas e anônimas, além de pipe operator #####

  @doc """
  Função de módulo nomeada que define uma tupla e através de uma função do próprio
  elixir,que recebe outra função, sendo esta anônima, dobra os valores dessa tupla.
  """
  def dobra_lista() do
    lista_de_numeros_para_dobrar = [1,2,3,4,5]
    lista_de_numeros_para_dobrar
    |> Enum.map(fn numero ->
      numero * 2
    end)
  end

  @doc """
  Função nomeada que dobra um número através de uma função anônima
  """
  def dobra_numero(numero) do
    funcao_anonima_para_dobrar = fn numero -> numero * 2 end
    funcao_anonima_para_dobrar.(numero)
  end

  @doc """
  Função nomeada que dobra um número através de uma & taquigrafia de uma
  função anônima
  """
  def dobra_numero_taquigrafia() do
    funcao_anonima_para_dobrar = &(&1 * 2)
    funcao_anonima_para_dobrar.(777)
  end

  ##### Pattern Matching, funções privadas e nomeadas #####

  # Função nomeada privada que retorna uma mensagem de sucesso caso o matching foi
  # feito com um :ok na função de maior nivel que a chamou
  defp pattern_matching_message({:ok, parametro}) do
    IO.puts "Opa, algo foi passado com sucesso e é: #{parametro}"
  end

  # Função nomeada privada que retorna uma mensagem de erro caso o matching foi feito com
  # um :error na função de maior nivel que a chamou
  defp pattern_matching_message({:error}) do
    IO.puts "Deu erro, desculpe"
  end


  # Função privada do módulo que chama uma função anônima que através de um pattern
  # matching chama uma função para retornar uma mensagem de uma outra função anônima
  defp certo_ou_errado_pattern_matching(parametro) do
    condicao = fn
      {:ok, value} -> IO.puts "#{pattern_matching_message({:ok, value})}"
      {:error} -> IO.puts "#{pattern_matching_message({:error})}"
    end
    condicao.(parametro)
  end

  @doc """
  Função que chama outra função passando um caso de sucesso e mais um valor para
  serem printados no terminal simulando um caso de sucesso.
  """
  def chama_caso_correto() do
    value = 10
    certo_ou_errado_pattern_matching({:ok, value})
  end

  @doc """
  Função que chama outra função passando um caso de erro para ser printado no
  terminal simulando um caso de erro.
  """
  def chama_caso_errado() do
    certo_ou_errado_pattern_matching({:error})
  end

  ##### Aridade #####

  @doc """
  Função de aridade 1 que imprime um valor x
  """
  def imprime_valores(x) do
    IO.puts "Valor x: #{x}"
  end

  @doc """
  Função de aridade 2 que imprime um valor x e um valor y
  """
  def imprime_valores(x,y) do
    IO.puts "Valor x: #{x}"
    IO.puts "Valor y: #{y}"
  end

  @doc """
  Função de aridade 3 que imprime um valor x, um y e um valor z
  """
  def imprime_valores(x,y,z) do
    IO.puts "Valor x: #{x}"
    IO.puts "Valor y: #{y}"
    IO.puts "Valor z: #{z}"
  end

  ##### Guard e valor padrão #####

  # Função anônima que é chamada quando o parametro passado para a função
  # é maior ou igual a 1000, printando a classificação de valor "caro"
  defp classifica_valor(preco) when (preco >= 1000) do
    IO.puts "Valor é caro"
  end

  # Função anônima que é chamada quando o parametro passado para a função
  # é maior ou igual a 1000, printando a classificação de valor "médio"
  defp classifica_valor(preco) when (preco < 1000 and preco >= 500) do
    IO.puts "Valor é médio"
  end

  # Função anônima que é chamada quando o parametro passado para a função
  # é maior ou igual a 1000, printando a classificação de valor "barato"
  defp classifica_valor(preco) when preco < 500 do
    IO.puts "Valor é barato"
  end

  @doc """
  Função em que a entrada representa o preco de algo que é vendido e chama uma
  função anônima, com o padrão Guard, para classificar o preço, de acordo com
  três classificações: barato, médio, caro. Possui um valor padrão, que caso,
  não seja passado como parâmetro, tem valor de 500.
  """
  def valor_compra(preco \\ 500) do
    classifica_valor(preco)
  end
end
