defmodule MinimalTodo do
  @moduledoc """
  Uma ferramenta de linha de comando que provê a funcionalidade de importar listas de tarefas (Todos) de arquivos CSV,
  inserindo-os num map do Elixir e aceitando interação do usuário via linha de comando.
  """

  @doc """
  Início da aplicação. Permite criar ou importar um CSV.
  """
  @spec start() :: nil
  def start do
    input = IO.gets("Criar um novo .csv? SIM/NAO") |> String.trim |> String.upcase
    if input in ["S", "SIM"] do
      criar_todo_inicial() |> ler_comando
    else
      importar_csv()
    end
  end


  @doc """
  Cria um novo todo e insere ele no Map, voltando para o menu em seguida.

  ## Parameters

    - dados: map que contém os Todos.
  """
  @spec novo_todo(map()) :: nil
  def novo_todo(dados) do
    name = ler_nome_de_todo(dados)
    titles = get_campos dados
    fields = Enum.map(titles, fn field -> ler_campo(field) end)
    novo_todo = %{name => Enum.into(fields, %{})}
    IO.puts("Novo Todo \"#{name}\" added.")
    novos_dados = Map.merge(dados, novo_todo)
    ler_comando(novos_dados)
  end


  @doc """
  Coloca mais um header na lista de headers com o nome digitado pelo usuário e
  se chama recursivamente para continuar o processo, ou se o usuário não digitar
  nada, finaliza retornando a lista de headers.

  ## Parameters

    - headers: Lista que contém os headers lidos até agora.
  """
  @spec definir_header(list(String.t())) :: list(String.t())
  def definir_header(headers) do
    case IO.gets("Adicionar campo: ")  |> String.trim do
      "" -> headers
      header -> definir_header([header | headers])
    end
  end

  @doc """
  Entrada para a função definir_header.

  Dá instruções ao usuário de como proceder com a função definir_header/1 e
  chama a definir_header/1 com uma lista vazia, para retornar o resultado de
  definir_header/1.

  """
  @spec definir_headers() :: list(String.t())
  def definir_headers do
    IO.puts "Que campos cada Todo deve ter?\n"
    <> "Insira o nome dos campos um por um e uma linha em branco para finalizar.\n"
    definir_header([])
  end

  @doc """
  Cria e retorna o map que representa a lista de Todos e um todo inicial de
  acordo com a entrada do usuário.
  """
  @spec criar_todo_inicial() :: map()
  def criar_todo_inicial do
    titles = definir_headers()
    name = ler_nome_de_todo(%{})
    fields = Enum.map(titles, &(ler_campo(&1)))
    IO.puts("Novo Todo \"#{name}\" adicionado.")
    %{name => Enum.into(fields, %{})}
  end

  @doc """
  Apaga um todo com o nome especificado pelo usuário.

  ## Parameters

    - dados: map que contém os Todos.

  """
  @spec apagar_todo(map()) :: nil
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

  @doc """
  Lê um campo específico para um todo e retorna um map com a key igual ao nome
  do campo e a informação digitada pelo usuário.

  ## Parameters

    - nome: nome do campo a ser lido.

  """
  @spec ler_campo(String.t()) :: map()
  def ler_campo(nome) do
    campo = IO. gets("#{nome}: ") |> String.trim
    case campo do
      _ -> {nome, campo}
    end
  end

  @doc """
  Menu do usuário para o programa.

  Oferece a interface para executar cada uma das funções do programa.

  Caso o usuário digite um valor inválido, repete o menu recursivamente.

  ## Parameters

    - dados: map que contém os Todos.

  """
  @spec ler_comando(map()) :: nil
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

  @doc """
  Retorna uma lista dos campos dos Todos.

  ## Parameters

    - dados: map que contém os Todos.

  ## Examples

    iex> MinimalTodo.get_campos(%{"Programar" => %{"Quando" => "hoje", "onde" => "casa"}})
    ["quando","onde"]

  """
  @spec get_campos(map()) :: list(String.t())
  def get_campos(dados) do
    dados[hd Map.keys dados] |> Map.keys
  end


  @doc """
  Lê um nome para um novo Todo do usuário e o retorna. Se o Todo já existir,
  solicita outro nome.

  ## Parameters

    - dados: map que contém os Todos.

  """
  @spec ler_nome_de_todo(map()) :: String.t()
  def ler_nome_de_todo(dados) do
    name = IO.gets("Insira o nome do novo Todo: ") |> String.trim
    if Map.has_key?(dados,name) do
      IO.puts("Há um Todo com o mesmo nome na lista!")
      ler_nome_de_todo(dados)
    else
      name
    end
  end

  @doc """
  Solicita o nome do arquivo CSV que o usuário quer importar, invoca a função
  parse/1 para processar os dados no arquivo e invoca o menu com o resultado
  da importação.
  """
  @spec importar_csv() :: nil
  def importar_csv() do
    nome_do_arquivo = IO.gets("Nome do arquivo .csv: ") |> String.trim
    ler_arquivo(nome_do_arquivo)
      |> parse
      |> ler_comando
  end

  @doc """
  Processa o conteúdo do CSV e chama parse_lines para retornar o map com os
  Todos importados.

  ## Parameters

    - body: String que contém o conteúdo de um arquivo CSV.


  ## Examples

    iex> MinimalTodo.parse("nome,quando\nFazer comida,hoje\nIr no banco,amanhã")
    %{"Fazer comida" => %{"nome" => "Fazer comida", "quando" => "hoje"}, "Ir no banco" => %{"nome" => "Ir no banco", "quando" => "amanhã"}}

  """
  @spec parse(String.t()) :: map()
  def parse(body) do
    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header, ",")
    parse_lines(lines, titles)
  end

  @doc """
  Processa o conteúdo do CSV e retorna o map com os Todos importados.

  ## Parameters

    - lines: Lista com Strings de cada linha de dados do CSV.
    - titles: Lista com Strings que contém cada campo do CSV.


  ## Examples

    iex> MinimalTodo.parse_lines(["Fazer comida,hoje","Ir no banco,amanhã"],["nome","quando"])
    %{"Fazer comida" => %{"nome" => "Fazer comida", "quando" => "hoje"}, "Ir no banco" => %{"nome" => "Ir no banco", "quando" => "amanhã"}}

  """
  @spec parse_lines(list(String.t()), list(String.t())) :: map()
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
  Lê o arquivo e retorna seu conteúdo inteiro numa String. Se falhar, imprime o
  erro e retorna para o início do programa.

  ## Parameters

    - nome_do_arquivo: String que contém o nome de um arquivo.


  ## Examples

    iex> MinimalTodo.parse_lines("meuarquivo")
    "Conteúdo que estava dentro do arquivo."

  """
  @spec ler_arquivo(String.t()) :: String.t()
  def ler_arquivo(nome_do_arquivo) do
    case File.read(nome_do_arquivo) do
      {:ok, body} -> body
      {:error, reason} -> IO.puts("Não foi possível abrir o arquivo \"#{nome_do_arquivo}\".")
                          IO.puts ~s("#{:file.format_error reason}"\n)
                          start()
    end
  end

  @doc """
  Salva o conteúdo do map no formato CSV no arquivo cujo nome for especificado
  pelo usuário. Se falhar, imprime o erro e volta para o menu.

  ## Parameters

    - dados: map que contém os Todos.

  """
  @spec ler_nome_de_todo(map()) :: nil
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

  @doc """
  Exibe os todos cadastrados na tela. Caso o parâmetro voltar_para_menu? seja
  especificado falso, retorna para a função que chamou, senão, vai para o menu.

  ## Parameters

    - dados: map que contém os Todos.
    - voltar_para_menu?: boolean opcional que indica se a função deve voltar para
                         o menu ou retornar para quem a invocou.
  ##

  """
  @spec mostrar_todos(map(), boolean()) :: nil
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
