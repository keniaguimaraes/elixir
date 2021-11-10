#Aluno: Carlos Mosselman Cabral Neto
#Programa para criar lista TODO
defmodule ToDo do
  def start do
    arquivo = IO.gets("Nome do CSV para ser carregado: ") |> String.trim()
    lerArquivo(arquivo)
      |> parse
      |> comandos
  end

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

  def deletarToDo(info) do
    todo = IO.gets("Qual ToDo que vai ser deletado?\n") |> String.trim
    if Map.has_key?(info, todo) do
      IO.puts("OK.")
      new_map = Map.drop(info, [todo])
      IO.puts(~s{"#{todo}" foi deletado.})
      comandos(new_map)
    else
      IO.puts(~s(Não tem ToDo com nome "#{todo}"!))
      mostrarToDo(info, false)
      deletarToDo(info)
    end
  end


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

  def parse(corpo) do
    [cabecalho | linhas] = String.split(corpo, ~r{(\r\n|\r|\n)})
    titulos = tl(String.split(cabecalho, ","))
    parse_linhas(linhas, titulos)
  end

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

  def mostrarToDo(info, proximo_comando? \\ true) do
    items = Map.keys(info)
    IO.puts("You have the following Todos:\n")
    Enum.each(items, fn item -> IO.puts(item) end)
    IO.puts("\n")
    if proximo_comando? do
      comandos(info)
    end
  end

end
