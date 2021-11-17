#Funções anônimas:

    #Funções simples de adição e subtração respectivamente

    add = fn (x,y) -> x + y end
    add.(10,5)

    sub = &(&1 - &2)
    sub.(20,15)

    #Funções simples de multiplicação e divforão respectivamente

    mult = fn (x,y) -> x * y end
    mult.(12,5)

    div = &(&1 / &2)
    div.(8,4)



#Pattern matching

    result = fn
        {var1} -> IO.puts("#{var1} Encontrado!")
        {var2, var3} -> IO.puts("#{var2} and #{var3} Encontrados!")
    end
    result.({"Oi mundo"})
    result.({"mundo", "oi"})


#Funções nomeadas:

    #Padrão

    defmodule Soma do

        def sum(a, b) do
          a + b
        end

    end

    #Se o corpo da função tem apenas uma linha, podemos reduzir usando do

    defmodule Mult do
        def mul(a, b), do: a * b
    end

    #Funções privadas:

        #Podem ser acessadas de dentro do módulo em que estão definidas.
        #Para definir uma função privada, use defp em vez de def

        defmodule Saudacao do
            def hello(nome), do: frase <> nome
            defp frase, do: "Olá "
        end

    #Funções com diferentes aridades

        defmodule Operacoes do

            def sum(a, b) do
              a + b
            end

            def sum(a, b, c) do
              a + b + c
            end

            def sum(a, b, c, d) do
              a + b + c + d
            end

        end

        #Guard:

        defmodule Guard do

          def impressao(x) when x > 10, do: "Maior que 10"

          def impressao(x) when x < 10, do: "menor que 10"

        end
