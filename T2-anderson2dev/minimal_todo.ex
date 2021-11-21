defmodule MinimalTodo do
def start() do
  input = IO.gets("Would you like to create a new csv file? (y/n)\n")
    |> String.trim
    |> String.downcase
  if (input == "y") do
    create_initial_todo()
      |> get_command
  else
    load_csv()
  end
end

def create_header(headers) do
  case IO.gets("Add field:")
    |> String.trim
  do
    "" -> headers
    header -> create_header([header | headers])
  end


end

def create_headers do
  IO.puts (
    "What data should each todo have?\n"
    <> "Enter field names one by one and an empty line then you're done.\n"
  )
  create_header([])
end

def create_initial_todo do
  titles = create_headers()
  name = get_item_name(%{})
  fields =  Enum.map(titles, fn field -> field_from_user(field) end)
  IO.puts(~s(New todo "#{name} added successfully"))
  %{name => Enum.into(fields, %{})}
end

def read_file(file_name) do
  case File.read(file_name) do
   {:ok, body} -> body
   {:error, reason} -> IO.puts(~s(Cannot open file "#{file_name}"\n))
                       IO.puts(~s(#{:file.format_error reason}\n))
                       start()
  end
end

def field_from_user(name) do
  field = IO.gets("#{name}: ")
    |> String.trim
  case field do
    _ -> {name, field}
  end
end

def get_command(data) do
  prompt_message = """
  Type the first letter of the command you want:
    (r) read todos
    (a) add todo
    (d) delete todo
    (l) load csv
    (s) save csv
    (q) quit
  """
  command = IO.gets(prompt_message)
    |> String.trim
    |> String.downcase
  case command do
    "r" -> show_todos(data)
    "d" -> delete_todo(data)
    "q" -> "Ciao!"
    "l" -> load_csv()
    "a" -> add_todo(data)
    "s" -> save_csv(data)
    _ -> get_command(data)
  end
end

def delete_todo(data) do
  todo = IO.gets("What todo would you like to delete\n")
    |> String.trim

  if Map.has_key?(data, todo) do
    new_data = Map.drop(data, [todo])
    IO.puts("#{todo} deleted successfully")
    get_command(new_data)
  else
    IO.puts(~s(There's no todo named "#{todo}!"))
    show_todos(data, false)
  end
end

def parse_file_name(file_name) do
  String.replace(file_name, ~r/\n/, "")
end

def parse_content(content) do
  lines  = String.split(content, ~r{(\n|\r|\r\n)})
  [header | items] = lines
  titles = tl String.split(header, ",")
  parse_lines(items, titles)
end

def parse_lines(lines, titles) do
  Enum.reduce(lines, %{}, fn line, built ->
    [name | fields] = String.split(line, ",")
    if Enum.count(fields) === Enum.count(titles) do
      line_data =  Enum.zip(titles, fields)
        |> Enum.into(%{})
      Map.merge(built, %{name => line_data})
    else
      built
    end
  end)
end

def add_todo(data) do
  name = get_item_name(data)
  titles = get_fields(data)
  fields = Enum.map(titles, fn field -> field_from_user(field) end)
  new_todo =  %{name => Enum.into(fields, %{})}
  IO.puts("New Todo: #{name}")
  new_data =  Map.merge(data, new_todo)
  get_command(new_data)
end

def get_item_name(data) do
  todo_name = IO.gets("Enter the todo name:\n")
    |> String.trim
  if (Map.has_key?(data, todo_name)) do
    IO.puts(~s(Todo "#{todo_name} already exists"))
    get_item_name(todo_name)
  else
    todo_name
  end
end

def get_fields(data) do
  data[hd Map.keys(data)]
    |> Map.keys
end

def load_csv() do
  file_name = IO.gets("Name of .csv: ")
    |> parse_file_name
  read_file(file_name)
    |> parse_content
    |> show_todos
end

def show_todos(data, next_command? \\ true) do
  items = Map.keys(data)
  IO.puts(~s{You have the following todos:\n})
  Enum.each(items, fn item ->  IO.puts(item) end)
  IO.puts(~s{\n})
  if (next_command?) do
    get_command(data)
  end
end

def prepare_csv(data) do
  fields =  get_fields(data)
  headers = ["Items" | fields]
  items =  Map.keys(data)
  item_rows = Enum.map(items, fn item ->
    [item | Map.values(data[item])]
  end)
  rows  = [headers | item_rows]
  rows_string =  Enum.map(rows, fn row -> Enum.join(row, ",") end)
  Enum.join(rows_string, "\n")
end

def save_csv(data) do
  file_name =  IO.gets("Name of the csv:\n")
    |> String.trim
  file_data = prepare_csv(data)
  case File.write(file_name, file_data) do
    :ok -> IO.puts("csv saved!")
          get_command(data)
    {:error, reason} -> IO.puts(~s(Could not save file: "#{file_name}"))
                         IO.puts(~s(#{:file.format_error reason}\n))
  end
end

end
