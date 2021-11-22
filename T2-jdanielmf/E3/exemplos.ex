defmodule Exemplos do

#Funcao anonima
start = fn () -> IO.puts "Esta e uma funcao anonima\n" end
start.()

#Funcao nomeada
  def somar(a,b)do
    soma_privada(a,b)
  end

#Funcao privada
  defp soma_privada(a,b) do
    a + b
  end

#Pattern Matching
caminho = fn
  "direita" -> "Voce foi para direita!"
  "esquerda" -> "Voce foi para esquerda!"
  _ -> "Va para direita ou esquerda"
end
caminho.("frente")

end
