# Guessing game

defmodule AdivinharNumero do

    @moduledoc """
    Implementa um jogo de adivinhação onde o usuário deve pensar num número e,
    de acordo com os "chutes" feitos pelo programa, indicar se o programa acer-
    tou, se foi muito alto ou muito baixo.

    """

    @doc """
    Função recursiva que executa cada rodada do jogo.

    ## Parameters

        - menor: inteiro que representa o limite inferior do intervalo.
        - maior: inteiro que representa o limite superior do intervalo.

    """
    @spec adivinhacao(integer,integer) :: :ok
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

    @doc """
    Função que inicia o jogo perguntando os limites iniciais do intervalo.
    """
    @spec iniciar() :: :ok
    def iniciar() do
        {menor, _} = IO.gets("Digite o menor valor do intervalo em que seu numero está: ") |> String.trim |> Integer.parse
        {maior, _} = IO.gets("Digite o maior valor do intervalo em que seu numero está: ") |> String.trim |> Integer.parse
        adivinhacao(menor, maior)
    end
end
