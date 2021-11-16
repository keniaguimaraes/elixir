defmodule MinimalTodo do
  def start do
    filename = IO.gets("Arquivo.csv: ") |> String.trim

    read(filename) 
      |> parse
      |> getCommand
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, body} -> body
      {:error, reason} -> IO.puts("Failure opening the file")
                          IO.puts ~s("#{:file.format_error reason}"\n)
                          start()
    end
  end

  def parse(body) do
    [header | lines] = body |> String.split("\n")
    titles = tl String.split(header, ",")
    parseLines(lines, titles)
  end

  def parseLines(lines, titles) do
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

  def showTodos(data) do
    items = Map.keys data
    IO.puts "Essa é a sua lista de tarefas:\n"
    Enum.each items, fn item -> IO.puts(item) end
    IO.puts "\n"
  end

  def getCommand(data) do
  prompt = """
  "Digite:
  'add' para adicionar uma nova tarefa, 
  'list' para ver sua lista de tarefas,
  'delete' para deletar uma tarefa,
  'quit' para sair."
  """
    IO.puts prompt
    command = IO.gets("") |> String.trim
    case command do
      "add" -> addTodo(data)
      "list" -> showTodos(data)
                getCommand(data)
      "delete" -> deleteTodo(data)
      "quit" -> IO.puts("Tchau!")
      _ -> IO.puts("Invalid command")
    end
  end

  def addTodo(data) do
    name = IO.gets("Nome: ") |> String.trim
    description = IO.gets("Descrição: ") |> String.trim
    prioridade = IO.gets("Prioridade: ") |> String.trim

    if Map.has_key?(data, name) do
      IO.puts("Tarefa já existe")
      addTodo(data)
    else
      newMap = Map.merge(data, %{name => %{description => prioridade}})
      IO.puts("Tarefa adicionada com sucesso!\n")
      getCommand(newMap)
    end
  end

  def deleteTodo(data) do
    name = IO.gets("Nome: ") |> String.trim
    if Map.has_key?(data, name) do
      newMap = Map.drop(data, [name]) 
      IO.puts("Tarefa removida com sucesso!\n")
      getCommand(newMap)
    else
      IO.puts("Tarefa não existe\n")
      showTodos(data)
      deleteTodo(data)
    end
  end
end