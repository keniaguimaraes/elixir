ExUnit.start()

defmodule ExemplosTest do
	use ExUnit.Case
	
	test "Teste para a função bold com sucesso" do
		assert MiniMarkdown.bold("**teste**") == "<strong>teste</strong>"
	end
	
	test "Teste para a função bold caso de falha" do
		refute MiniMarkdown.bold("*teste*") == "<em>teste</em>"
	end
	
	test "Teste para a função italics com sucesso" do
		assert MiniMarkdown.italics("*teste*") == "<em>teste</em>"
	end
	
	test "Teste para a função italics com falha" do
		refute MiniMarkdown.italics("*teste*") == "<strong>teste</strong>"
	end
end
