resposta = IO.gets "Qual é o seu nome? "

case String.trim(resposta) do
	"Kenia" ->
	IO.puts "Bem vinda, Kenia! Nós somos Charas"

	_ ->
		IO.puts "Seja bem vindo)"
		IO.puts resposta
end