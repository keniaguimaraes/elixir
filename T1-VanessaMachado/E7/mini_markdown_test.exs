ExUnit.start()

defmodule MiniMarkdownTest do
  use ExUnit.Case

  test "Teste para a função italics" do
    assert MiniMarkdown.italics("*teste*") == "<em>teste</em>"
  end

  test "Teste para a função italics caso de falha" do
    refute MiniMarkdown.italics("**teste**") == "<strong>teste</strong>"
  end

  test "Teste para a função p quebras de linha" do
    assert MiniMarkdown.p("\nteste\n") == "<p>teste</p>"
  end

  test "Teste para a função p" do
    assert MiniMarkdown.p("teste") == "<p>teste</p>"
  end

  test "Teste para a função p caso de falha" do
    refute MiniMarkdown.p("#teste") == "<p>teste</p>"
  end
end
