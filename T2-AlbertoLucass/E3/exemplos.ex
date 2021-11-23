#Funções anônimas
# faz a operacao de subtracao
funcaoAnonima = fn (a, b) -> a - b end

# A & taquigrafia
taquigrafia = &(&1 - &2)

#Funções nomeadas
defmodule Exemplo do
  def funcaoNomeada() do
        {valor1, _} = IO.gets("Digite um valor: ") |> String.trim |> Integer.parse
        {valor2, _} = IO.gets("Digite outro valor: ") |> String.trim |> Integer.parse
        if valor1 > valor2 do
          IO.puts("O valor #{valor1} e maior que o valor #{valor2}")
        end

        if valor2 > valor1 do
          IO.puts("O valor #{valor2} e maior que o valor #{valor1}")
        end

    end
  end

  #Nomear Funções e a Aridade
  defmodule FuncaoEaridade do
    def conta(), do: "Ola, aqui voce pode fazer operacoes"
    def conta(v1,v2), do: "A soma de #{v1} com #{v2} e igual a #{v1+v2}"
    def conta(v), do: "O inverso de #{v} e #{-v}"
  end

  #patternMatching
  defmodule PatternMatching do
    # dados de uma conta estao nesse mapa, mas só nos interessa a data de pagamento
    def diaDoPagamento(%{data: dataParaPagar} = ano) do
      if dataParaPagar == 2021 do
        IO.puts("Sua conta irá vencer esse ano")
      else
        IO.puts("Voce tem mais #{ano-2021}(s) para pagar sua conta")
      end
    end
  end

  #Funções privadas
  defmodule FuncaoPrivada do
    def printar(), do: "Aqui printa"
    defp printar2, do: "Aqui nao printa "
  end

  #Guards
  defmodule Guards do

    def printar(valor) when is_integer(valor) do
      IO.puts("Voce digitou um numero inteiro")
    end

    def printar(valor) when is_float(valor) do
      IO.puts("Voce digitou um numero decimal")
    end
  end

  #Argumentos padrões
  defmodule Padrao do

    def login(aviso \\ "Passe alcool nas maos ao entrar no predio") do
      IO.puts("Seja bem vindo. #{aviso}")
    end
  end
