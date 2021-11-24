defmodule GuessingGame do
  @moduledoc """
  Inicia com Jogar, pergunta o intervalo do numero que
  o jogador quer jogar (espera dois numeros)
  e inicia uma recursao ate acertar
  """
  def jogar() do
    @doc """
    Funcao inicial, pergunta os valores do intervalo ao usuario
    """
    IO.puts("Vamos Jogar! Vou chutar onde qual seu numero e voce me respondera 'mais', 'menos' ou 'sim. \n")

    #Pega os dois valores que serao o intervalo
    intervalo = IO.gets("Vamos Jogar! Insira o intervalo onde seu numero esta. \n")

    #Puxa os dois valores e assinala as variaveis
    array = String.split(String.trim(intervalo))
    a = String.to_integer(Enum.at(array, 0))
    b = String.to_integer(Enum.at(array, 1))

    #comeca recursao
    chutar(a, b)

  end

  def chutar(a, b) do
    @doc """
    Pergunta ao jogador se o numero desejado e a media de a e b e reage de acordo

    ##Parameters
      - a: valor inferior do intervalo
      - b: valor superior do intervalo
    """
    #Faz um chute pegando a media dos valores e pega a resposta do usuario
    chute = IO.gets("Seu numero eh #{mid(a, b)}?\n")

    # Verifica a resposta e chama a funcao correspondente
    case String.trim(chute) do
      "mais" ->
        mais(a, b)

      "menos" ->
        menos(a, b)

      "sim" ->
        IO.puts("Acertei!")

      _ ->
        IO.puts(~s{Type "mais", "menos" or "sim"})
        chutar(a, b)
    end
  end

  def mid(a, b) do
    @doc """
    Retorna a media entre a e b

    ##Parameters
      - a: valor inferior do intervalo
      - b: valor superior do intervalo
    """
    #Retorna o resultado da media
    div(a + b, 2)
  end

  def mais(a, b) do
    @doc """
    Refaz a recursao com os novos valores de intervalo, sendo a media entre a e b o novo limite inferior

    ##Parameters
      - a: valor inferior do intervalo
      - b: valor superior do intervalo
    """
    novo_a = min(b, mid(a, b) + 1)
    #Refaz o chute com os novos valores
    chutar(novo_a, b)
  end

  def menos(a, b) do
    @doc """
    Refaz a recursao com os novos valores de intervalo, sendo a media entre a e b o novo limite superior

    ##Parameters
      - a: valor inferior do intervalo
      - b: valor superior do intervalo
    """
    novo_b = max(a, mid(a, b) - 1)
    #Refaz o chute com os novos valores
    chutar(a, novo_b)
  end
end
