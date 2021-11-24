# funcao_anonima
dividir = fn(a, b) -> a / b end
defmodule Exemplos do
    # funcao_nomeada
    def imprimir(argumento) do
        IO.puts(argumento)
    end

    # funcao aridade 2
    def imprimir(argumento, argumentos) do
        IO.puts("aridade 2")
        IO.puts(argumento)
        IO.puts(argumentos)
    end

    # pattern matching
    funcao media(%{notaA: notaA, notaB: notaB, notaC: notaC}) do
        IO.puts "A média é #{(notaA + notaB + notaC) / 3}"
    end

    # funcao privada
    defp segredo do
        IO.puts "Nao acessivel"
    end

    #guards
    def dobro(a) when is_integer(a) do
        IO.puts(a*2)
    end

    #argumentos padroes
    def total(a, b \\ 0) do
        IO.puts a+b
    end

end
