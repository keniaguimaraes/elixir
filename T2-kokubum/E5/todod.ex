defmodule Todo do
  @moduledoc """
  Implementa um programa que ler uma lista de Todo csv, faz o parser para um Elixir map e aceita entradas do usuário.
  """

  @doc """
  Recebe o nome do arquivo e faz a leitura.
  """
  @spec beginMinimalTodo() :: :ok
  def beginMinimalTodo do
    filename = IO.gets("File: \n") |> String.trim()
    readFile(filename)
  end

  @doc """
  Recebe o nome do arquivo e faz a leitura.
  """
  def readFile(fileName, nextCommand \\ true) do
    case File.read(fileName) do
      {:ok, body} ->
        data =
          body
          |> bodyTodoParser

        if nextCommand do
          getInput(data)
        end

        data

      {:error, msg} ->
        raise msg
    end
  end

  @doc """
  Realiza o parser do header e das linhas do arquivo
  """
  def bodyTodoParser(body) do
    [header | lines] = String.split(body, ~r(\r\n|\r|\n))
    titles = tl(csvSplit(header))
    parseLine(lines, titles)
  end

  @doc """
  Realiza a separção do csv com base nas virgulas
  """
  def csvSplit(text) do
    String.split(text, ",")
  end

  @doc """
  Verifica se dois parametros tem o mesmo tamanho
  """
  def sizeChecker(left, right) do
    Enum.count(left) === Enum.count(right)
  end

  @doc """
  Faz o parser das linhas para construção do csv
  """
  def parseLine(lines, headers) do
    Enum.reduce(lines, %{}, fn line, accumulator ->
      [todoName | fields] = csvSplit(line)

      if sizeChecker(fields, headers) do
        line_data = Enum.zip(headers, fields) |> Enum.into(%{})
        Map.merge(accumulator, %{todoName => line_data})
      else
        accumulator
      end
    end)
  end

  @doc """
  Pega o Input do usuário, e com base na entrada, realiza uma determinada operação:a - Add, r - Read, d - Delete, l - Load, s - Save or q - Exit
  """
  def getInput(data) do
    command =
      IO.gets("Enter a command: a - Add, r - Read, d - Delete, l - Load, s - Save or q - Exit ")
      |> String.trim()
      |> String.downcase()

    case command do
      "a" ->
        create(data)

      "r" ->
        read(data)

      "d" ->
        remove(data)

      "l" ->
        load(data)

      "s" ->
        save(data)

      "q" ->
        "End"

      _ ->
        IO.puts("Wrong command")
        getInput(data)
    end
  end

  @doc """
  Recebe o conteudo da task, e retorna um map com o nome e o conteudo.
  """
  def fieldsFromUser(name) do
    field = IO.gets("Enter the #{name} of the task:") |> String.trim()

    case field do
      _ -> {name, field}
    end
  end

  @doc """
  Faz o parser do arquivo que é passado com base nas keys e values
  """
  def parseFields(data) do
    data[hd(Map.keys(data))] |> Map.keys()
  end

  @doc """
  Recebe o nome do Todo, e busca ele dentro do csv, caso ele exista, é retornado "Already Exists!"
  """
  def getTodoName(data) do
    name = IO.gets("Name of Item:") |> String.trim()

    if Map.has_key?(data, name) do
      IO.puts("Already exists!")
      getTodoName(data)
    else
      name
    end
  end

  @doc """
  Cria um novo todo
  """
  def create(data) do
    todoName = getTodoName(data)

    titles = parseFields(data)

    fields = Enum.map(titles, &fieldsFromUser(&1))

    newTodo = %{todoName => Enum.into(fields, %{})}

    newData = Map.merge(data, newTodo)

    getInput(newData)
  end

  @doc """
  Lê o csv com os todos e imprime no terminal
  """
  def read(data, next_command? \\ true) do
    items = Map.keys(data)
    IO.puts("You have the following todos:")

    Enum.each(items, &IO.puts(&1))

    if next_command? do
      getInput(data)
    end
  end

  @doc """
  Recebe o nome de um todo e o remove do arquivo
  """
  def remove(data) do
    todo = IO.gets("Enter the todo to delete:") |> String.trim()

    if Map.has_key?(data, todo) do
      new_data = Map.drop(data, [todo])
      IO.puts("#{todo} deleted")
      getInput(new_data)
    else
      IO.puts("#{todo} not found")
      read(data, false)
      remove(data)
    end
  end

  @doc """
  Recebe o nome do arquivo e imprime ele no terminal
  """
  def load(data) do
    filename = IO.gets("File to load:") |> String.trim()
    newData = readFile(filename, false)

    Map.merge(data, newData)
  end

  @doc """
  Mapeia o arquivo csv com base nas keys e values, para facilitar o salvamento do arquivo
  """
  def prepareCsv(data) do
    headers = ["Item" | parseFields(data)]
    items = Map.keys(data)

    itemRows = Enum.map(items, &[&1 | Map.values(data[&1])])
    rows = [headers | itemRows]

    row_strings = Enum.map(rows, &Enum.join(&1, ","))

    Enum.join(row_strings, "\n")
  end

  @doc """
  Recebe o nome do arquivo e salva o csv.
  """
  def save(data) do
    filename = IO.gets("File to save:") |> String.trim()

    csv = prepareCsv(data)

    case File.write(filename, csv) do
      :ok ->
        IO.puts("Saved successfuly!")
        getInput(data)

      {:error, msg} ->
        IO.puts("Error")
        getInput(data)
    end

    getInput(data)
  end
end
