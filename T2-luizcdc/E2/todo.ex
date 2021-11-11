defmodule MinimalTodo do

  def start do
    input = IO.gets("Criar um novo .csv? SIM/NAO") |> String.trim |> String.upcase
    if input in ["S", "SIM"] do
      criar_todo_inicial() |> ler_comando
    else
      importar_csv()
    end
  end

  def novo_todo(dados) do
    name = ler_nome_de_todo(dados)
    titles = get_campos dados
    fields = Enum.map(titles, fn field -> ler_campo(field) end)
    novo_todo = %{name => Enum.into(fields, %{})}
    IO.puts("Novo Todo \"#{name}\" added.")
    novos_dados = Map.merge(dados, novo_todo)
    ler_comando(novos_dados)
  end

  def definir_header(headers) do
    case IO.gets("Adicionar campo: ")  |> String.trim do
      "" -> headers
      header -> definir_header([header | headers])
    end
  end

  def definir_headers do
    IO.puts "Que campos cada Todo deve ter?\n"
    <> "Insira o nome dos campos um por um e uma linha em branco para finalizar.\n"
    definir_header([])
  end


  def criar_todo_inicial do
    titles = definir_headers()
    name = ler_nome_de_todo(%{})
    fields = Enum.map(titles, &(ler_campo(&1)))
    IO.puts("Novo Todo \"#{name}\" adicionado.")
    %{name => Enum.into(fields, %{})}
  end

  def apagar_todo(dados) do
    todo = IO.gets("Digite o nome do Todo que deseja apagar.\n") |> String.trim
    if Map.has_key? dados, todo do
      IO.puts "ok."
      novo_map = Map.drop(dados, [todo])
      IO.puts("\"#{todo}\" foi deletado.")
      ler_comando(novo_map)
    else
      IO.puts("Não há um Todo com o nome \"#{todo}\" cadastrado atualmente.")
      mostrar_todos(dados, false)
      apagar_todo(dados)
    end
  end

  def ler_campo(nome) do
    campo = IO. gets("#{nome}: ") |> String.trim
    case campo do
      _ -> {nome, campo}
    end
  end

  def ler_comando(dados) do
    opcao = IO.gets("""
    Digite a inicial da opção que quer selecionar:

    L)er Todos   A)dicionar novo Todo   D)eletar um Todo

    C)arregar um .csv    S)alvar um .csv    E)ncerrar o programa
    """)
      |> String.trim
      |> String.upcase

    case opcao do
      "A" -> novo_todo(dados)
      "L" -> mostrar_todos(dados)
      "D" -> apagar_todo(dados)
      "C" -> importar_csv()
      "S" -> salvar_arquivo_csv(dados)
      "E" -> "Encerrando o programa."
      _   -> ler_comando(dados)
    end
  end

  def get_campos(dados) do
    dados[hd Map.keys dados] |> Map.keys
  end

  def ler_nome_de_todo(dados) do
    name = IO.gets("Insira o nome do novo Todo: ") |> String.trim
    if Map.has_key?(dados,name) do
      IO.puts("Há um Todo com o mesmo nome na lista!")
      ler_nome_de_todo(dados)
    else
      name
    end
  end

  def importar_csv() do
    nome_do_arquivo = IO.gets("Nome do arquivo .csv: ") |> String.trim
    ler_arquivo(nome_do_arquivo)
      |> parse
      |> ler_comando
  end

  def parse(body) do
    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header, ",")
    parse_lines(lines, titles)
  end

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

  def ler_arquivo(nome_do_arquivo) do
    case File.read(nome_do_arquivo) do
      {:ok, body} -> body
      {:error, reason} -> IO.puts("Não foi possível abrir o arquivo \"#{nome_do_arquivo}\".")
                          IO.puts ~s("#{:file.format_error reason}"\n)
                          start()
    end
  end

  def salvar_arquivo_csv(dados) do
    nome_do_arquivo = IO.gets("Nome do arquivo .csv de salvamento: ") |> String.trim
    headers = ["Item" | get_campos dados]
    items = Map.keys(dados)
    item_rows = Enum.map(items, fn item -> [item | Map.values(dados[item])] end)
    rows = [headers | item_rows]
    row_strings = Enum.map(rows, fn x -> Enum.join(x, ",") end)
    filedata = Enum.join(row_strings, "\n")
    case File.write(nome_do_arquivo, filedata) do
      :ok ->  IO.puts("Salvamento completo.")
              ler_comando(dados)
      {:error, reason} -> IO.puts("Não foi possível salvar o arquivo \"#{nome_do_arquivo}\"")
                          IO.puts ~s("#{:file.format_error reason}"\n)
                          ler_comando(dados)
    end
  end

  def mostrar_todos(dados, voltar_para_menu? \\ true) do
    items = Map.keys dados
    IO.puts("Você tem os Todos a seguir:\n")
    Enum.each items, fn item -> IO.puts item end
    IO.puts "\n"
    if voltar_para_menu? do
      ler_comando(dados)
    end
  end

end
