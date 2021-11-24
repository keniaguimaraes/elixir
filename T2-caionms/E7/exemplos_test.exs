ExUnit.start()

defmodule ExemplosTest do
	use ExUnit.Case
	
	test "Teste da função nomeada que imprime o nome com sucesso" do
		assert Exemplos.func_nomeada("Caio") == "Funcao Nomeada - O valor passado foi Caio"
	end
	
	test "Teste da função nomeada que imprime o nome com falha" do
		refute Exemplos.func_nomeada("Pedro") == "Funcao Nomeada - O valor passado foi Caio"
	end
	
	test "Teste da função privada que imprime saudação com sucesso" do
		assert Exemplos.func_privada_saida("Caio") == "Funcao Privada - Saudacoes, Caio"
	end
	
	test "Teste da função privada que imprime saudação com falha" do
		refute Exemplos.func_privada_saida("Pedro") == "Funcao Privada - Saudacoes, Caio"
	end
end
