# Guessing game

defmodule AdivinharNumero do

#    def main() do
#        iniciar()
#    end

    def adivinhacao(menor, maior) do
        cond do
            menor > maior ->
                IO.puts("Você mentiu pra mim ou digitou um intervalo inválido. :(")
            true ->
                valor_medio = div(menor+maior,2)
                res = IO.gets("Seria seu número #{valor_medio}?\n") |> String.upcase |> String.trim
                cond do
                    res in ["ACERTOU", "SIM", "CORRETO"] ->
                        IO.puts("Obrigado por jogar comigo :)")
                    res == "MAIOR" ->
                        adivinhacao(valor_medio+1,maior)
                    res == "MENOR" ->
                        adivinhacao(menor,valor_medio-1)
                    true ->
                        IO.puts("Não entendi sua resposta, vamos repetir.")
                        adivinhacao(menor,maior)
                end
        end
    end

    def iniciar() do
        {menor, _} = IO.gets("Digite o menor valor do intervalo em que seu numero está: ") |> String.trim |> Integer.parse
        {maior, _} = IO.gets("Digite o maior valor do intervalo em que seu numero está: ") |> String.trim |> Integer.parse
        adivinhacao(menor, maior)
    end
end
