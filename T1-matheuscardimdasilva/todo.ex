defmodule MinimalTodo do
  def comecar do
    nome_arquivo = IO.gets("Nome do arquivo csv: ") |> String.trim()
    ler_arquivo(nome_arquivo)
      |> parse
      |> proximo_comando
  end

  def parse(body) do
    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl(String.split(header, ","))

    Enum.reduce(lines, %{}, fn line, built ->
      [name | fields] = String.split(line, ",")
      if Enum.count(fields) == Enum.count(titles) do
        line_data = Enum.zip(titles, fields) |> Enum.into(%{})
        Map.merge(built, %{name => line_data})
      else
        built
      end
    end)
  end

  def ler_arquivo(nome_arquivo) do
    case File.read(nome_arquivo) do
      {:ok, body} ->
        body

      {:error} ->
        IO.puts("Não foi possível abrir o arquivo \"#{nome_arquivo}\"")
        comecar()

    end
  end

  def proximo_comando(conteudo_arquivo) do
    comando = IO.gets("""
      Digite o comando que quer rodar:\n
      i) Imprimir todas as tarefas\n
      d) Deletar tarefa\n
      q) Fechar o programa\n
    """)
      |> String.trim
      |> String.downcase

    case comando do
      "i" -> imprime_todas_tarefas(conteudo_arquivo)
      "d" -> deletar_tarefa(conteudo_arquivo)
      "q" -> "Fechando!"
      _ -> proximo_comando(conteudo_arquivo)
    end

  end

  def imprime_todas_tarefas(conteudo_arquivo, next_command? \\ true) do

    items = Map.keys(conteudo_arquivo)
    IO.puts("Você tem estas tarefas:\n")
    Enum.each(items, fn item -> IO.puts(item) end)
    IO.puts("\n")
    if next_command? do
      proximo_comando(conteudo_arquivo)
    end
  end

  def deletar_tarefa(conteudo_arquivo) do
    tarefa = IO.gets("Qual tarefa gostaria de deletar?\n") |> String.trim

    if Map.has_key?(conteudo_arquivo, tarefa) do
      new_map = Map.drop(conteudo_arquivo, [tarefa])
      IO.puts("A tarefa \"#{tarefa}\" foi deletada.")
      proximo_comando(new_map)

    else
      IO.puts("Não há nenhuma tarefa com o nome \"#{tarefa}\"")
      imprime_todas_tarefas(conteudo_arquivo, false)
      deletar_tarefa(conteudo_arquivo)
    end
  end
end 

MinimalTodo.comecar()