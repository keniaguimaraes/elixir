defmodule GuessingGame do

  def suposicao(a,b) when a>b do

      suposicao(b,a)

  end

  def suposicao(inf, sup) do

      resposta = IO.gets("você pensou no número #{meio(inf, sup)}?\n")

      case String.trim(resposta) do

          "maior" ->
              maior(inf, sup)

          "menor" ->
              menor(inf, sup)

          "sim" ->
              "Consegui advinhar o seu número !!!!!!!"

          _ ->
              IO.puts ~s{"maior", "menor", ou "sim"}
              suposicao(inf, sup)

      end

  end

  def meio(inf, sup) do

      div(inf + sup, 2)

  end

  def maior(inf, sup) do

      novoInf = min sup, meio(inf, sup) + 1
      suposicao(novoInf, sup)

  end

  def menor(inf, sup) do

      novoSup= max inf, meio(inf, sup) - 1
      suposicao(inf, novoSup)

  end

end
