defmodule MinimalTodo do
	@moduledoc """
		Módulo que tem funções de CRUD em um arquivo .csv.
	"""
	
	@doc """
		Função que recebe o nome de um arquivo .csv que será utilizado.
	"""
  def start do
    filename = IO.gets("Name of .csv to load: ") |> String.trim
    read(filename)
    |> parse
    |> get_command
  end

	@doc """
		Interface onde recebe um comando do usuário e executa uma das ações.
	"""
  def get_command(data) do
    prompt = """
    type the first letter of the command you want to run\n
    R)ead Todos A)dd a Todo D)elete a Todo L)oad a .csv S)ave a .csv
    """
    command = IO.gets(prompt)
    |> String.trim
    |> String.downcase

    case command do
      "r" -> show_todos(data)
      "d" -> delete_todo(data)
      "q" -> "Good bye!"
      _ -> get_command(data)
    end
  end


	@doc """
		Função que deleta um dado, caso a chave correspondente seja identificada. Se não for, imprime a mensagem de que não foi possível encontrar.
	"""
  def delete_todo(data) do
    todo = IO.gets("Wish Todo would you like to delete?\n")
    |> String.trim
    if Map.has_key? data, todo do
      IO.puts "ok"
      new_map = Map.drop(data, [todo])
      IO.puts ~s("#{todo}" has been deleted.)
      get_command(new_map)
    else
      IO.puts ~s(There is no Todo named "#{todo}".)
      show_todos(data, false)
      delete_todo(data)
    end
  end

	@doc """
	Função responsável por fazer a leitura do arquivo, imprimindo se foi possível fazer a leitura ou não.
	"""
  def read(filename) do
    case File.read(filename) do
      {:ok, body} -> body
      {:error, reason} -> IO.puts ~s(Could not open file "#{filename}" \n)
                          IO.puts ~s("#{:file.format_error reason}"\n)
                          start()
    end
  end

	@doc """
	Função que separa o arquivo em linhas e depois aplica a regra da expressão regular nas linhas,
	"""
  def parse(body) do
    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header, ",")
    parse_lines(lines, titles)
  end

	@doc """
		Função que transforma cada linha em uma chave baseado nas regras do arquivo .csv.
	"""
  def parse_lines(lines, titles) do
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

	@doc """
		Função que mostra os "todos" e chama a interface de comando.
	"""
  def show_todos(data, next_command? \\ true) do
    items = Map.keys data
    IO.puts "You have the following Todos:\n"
    Enum.each items, fn item -> IO.puts item end
    IO.puts "\n"
    if next_command? do
      get_command(data)
    end
  end
end
