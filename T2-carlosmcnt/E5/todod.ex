#Aluno: Carlos Mosselman Cabral Neto

defmodule ToDo do

  @moduledoc """
    O programa ToDo ajuda a ver e deletar ToDos, a partir de um arquivo CSV.
  """


  @doc """
    A função start recebe um arquivo .csv que será inicialmente processado.
  """

  def start do
    arquivo = IO.gets("Nome do CSV para ser carregado: ") |> String.trim()
    lerArquivo(arquivo)
      |> parse
      |> comandos
  end

  @doc """
    A função comandos mostra uma lista de comandos que o usuário pode selecionar para
    manipular os ToDos existentes no arquivo.
  """

  def comandos(info) do
    entrada = """
    Selecione a opção desejada:
    a) Mostrar ToDos       b)Deletar ToDo     c) Sair
    """

    comando = IO.gets(entrada)
      |> String.trim()
      |> String.downcase()

    case comando do
      "a"     -> mostrarToDo(info)
      "b"     -> deletarToDo(info)
      "c"     -> "Saindo..."
      _       -> comandos(info)
    end
  end

  @doc """
    A função deletarToDo é responsável por deletar o To Do, com base em uma informação que será
    passada para identificar se o To Do existe no arquivo. Caso exista, ele será retirado e atualizado,
    caso contrário, uma mensagem de que não existe é mostrada.
  """

  def deletarToDo(info) do
    todo = IO.gets("Qual ToDo que vai ser deletado?\n") |> String.trim
    if Map.has_key?(info, todo) do
      IO.puts("OK.")
      new_map = Map.drop(info, [todo])
      IO.puts(~s{"#{todo}" foi deletado.})
      comandos(new_map)
    else
      IO.puts(~s(Não tem ToDo com nome "#{todo}".))
      mostrarToDo(info, false)
      deletarToDo(info)
    end
  end


  @doc """
    A função lerArquivo é responsável por ler o arquivo .csv e formatar para uma melhor organização.
    Caso não consiga, um erro e seu motivo são mostrados.
  """

  def lerArquivo(arquivo) do
      case File.read(arquivo) do
        {:ok, corpo}     ->
          corpo

        {:error, razao}     ->
          IO.puts (~s("Não foi possível abrir o arquivo "#{arquivo}"\n))
          IO.puts (~s("#{:file.format_error(razao)}"\n))
          start()
      end
  end

  @doc """
    A função parse é responsável por separar o programa em linhas, por meio
    de uma função para separar essas linhas de acordo com uma Regex.
  """

  def parse(corpo) do
    [cabecalho | linhas] = String.split(corpo, ~r{(\r\n|\r|\n)})
    titulos = tl(String.split(cabecalho, ","))
    parse_linhas(linhas, titulos)
  end

  @doc """
    A função parse_linhas é responsável por transformar cada uma das linhas
    em uma chave especial de acordo com as regras do .csv
  """

  def parse_linhas(linhas, titulos) do
    Enum.reduce(linhas, %{}, fn linha, built ->
      [nome | campos] = String.split(linha, ",")
      if Enum.count(campos) == Enum.count(titulos) do
        linha_info = Enum.zip(titulos, campos) |> Enum.into(%{})
        Map.merge(built, %{nome => linha_info})
      else
        built
      end
    end)
  end

  @doc """
    A função mostrarToDo responsável por mostrar os ToDos e chamar a função de comandos logo após.
  """

  def mostrarToDo(info, proximo_comando? \\ true) do
    items = Map.keys(info)
    IO.puts("Você tem esses ToDos:\n")
    Enum.each(items, fn item -> IO.puts(item) end)
    IO.puts("\n")
    if proximo_comando? do
      comandos(info)
    end
  end

end
