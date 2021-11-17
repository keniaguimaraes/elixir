ExUnit.start()

defmodule MiniMarkdownTest do
  use ExUnit.Case

  test "Funciona para <h1>" do
    assert MiniMarkdown.parse_h1("# Não deve #ser #alterado # # #") ==
             "<h1>Não deve #ser #alterado # # #</h1>"
  end

  test "Funciona para <h2>" do
    assert MiniMarkdown.parse_h2("## Não deve #ser #alterado # # #") ==
             "<h2>Não deve #ser #alterado # # #</h2>"
  end

  test "Funciona para <strong>" do
    assert MiniMarkdown.parse_negrito("**Não deve #ser #alterado # # #**") ==
             "<strong>Não deve #ser #alterado # # #</strong>"
  end

  test "Funciona para <h3>" do
    assert MiniMarkdown.to_html("### Não deve #ser #alterado # # #") ==
             "<p><h3>Não deve #ser #alterado # # #</h3></p>"
  end
end
