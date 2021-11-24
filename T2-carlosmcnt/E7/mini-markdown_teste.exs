ExUnit.start()

defmodule MiniMarkdownTeste do
  use ExUnit.Case

  test "bold sem erros" do
    assert MiniMarkdown.bold("**Programando uma atividade**") == "<strong>Programando uma atividade</strong>"
  end

  test "italics sem erro" do
    assert MiniMarkdown.italics("*Programando uma atividade*") == "<em>Programando uma atividade</em>"
  end

  test "palavra errada" do
    assert MiniMarkdown.bold("**Programando uma atividade**") == "<forte>Programando uma atividade</strong>"
  end

  test "falta / em <em>" do
    assert MiniMarkdown.italics("*Programando uma atividade*") == "<em>Programando uma atividade<em>"
  end


end
