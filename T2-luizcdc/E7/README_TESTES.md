# Para executar testes fora de um projeto mix:

* o arquivo de testes deve chamar *ExUnit.start()* no início
* o comando para executar os testes deve ser:
    >elixir -r ARQUIVO_DO_MODULO.ex ARQUIVO_DE_TESTES.exs

**No caso dessa pasta, os comandos são:**
    : > elixir -r mini_markdown.ex MiniMarkdownTest.exs
      > elixir -r exemplos.ex exemplosTest.exs
