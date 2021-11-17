defmodule Todo do

  @doc """
    Função de entrada do programa, onde é passado o nome do arquivo .csv
    que deverá ser processado.
  """

  def Inicio do

      arquivo = IO.gets("Nome do .csv para ser carregado: ") |> String.trim
      leitura(arquivo)
      |> parse
      |> get_comando

  end

  @doc """
    Interface onde é captado o comando do usuário, além de ser responsável por executar
    o comando referido entre as operações listadas.
  """

  def get_comando(dados) do

      entrada = """
      Selecione a opção desejada:\n
      R)ead Todos A)dd a Todo D)elete a Todo L)oad a .csv S)ave a .csv
      """
      comando = IO.gets(entrada)
      |> String.trim
      |> String.downcase

      case comando do

          "r" -> mostra_todos(dados)
          "d" -> delete_todo(dados)
          "q" -> "Good bye!"
          _ -> get_comando(dados)

      end

  end

  @doc """
    A função delete_todo é responsável por deletar um dado do arquivo se a chave for correta.
    Caso contrário, informa ao usuario que o todo não foi encontrado.
  """

  def delete_todo(dados) do

      todo = IO.gets("Que Todo você gostaria de deletar?\n")
      |> String.trim
      if Map.has_key? dados, todo do
          IO.puts "ok"
          new_map = Map.drop(dados, [todo])
          IO.puts ~s("#{todo}" foi deletado.)
          get_comando(new_map)
      else
          IO.puts ~s(Não há nenhum Todo nomeado "#{todo}".)
          mostra_todos(dados, false)
          delete_todo(dados)
      end

  end

  @doc """
    A função leitura é responsável por ler o arquivo, indicando sucesso caso consiga realizar,
    caso esteja bem formatado. Caso não consiga, um erro será informado, indicando insucesso.
  """

  def leitura(arquivo) do

    case File.leitura(arquivo) do

        {:ok, corpo}   -> corpo
        {:erro, razao} -> IO.puts ~s(Não foi possível abrir o arquivo "#{arquivo}" \n)
                          IO.puts ~s("#{:file.format_erro razao}"\n)
                          Inicio()

    end

  end

  @doc """
    A função de parse do arquivo é responsável por separá-lo em linhas. Em seguida,
    chama uma função para separar essas linhas de acordo com uma RegEx.
  """

  def parse(corpo) do

      [cabecalho | linhas] = String.split(corpo, ~r{(\r\n|\r|\n)})
      titulos = tl String.split(cabecalho, ",")
      parse_linhas(linhas, titulos)

  end

  @doc """
    A função de parser das linhas é responsável por transformar cada linha em uma chave
    de acordo com as regras do .csv : a cada "," é adicionado um campo à tupla, caso a
    quantidade de campos da linha for diferente da quantidade de linhas totais, um campo
    vazio será construído.
  """

  def parse_linhas(linhas, titulos) do

      Enum.reduce(linhas, %{}, fn linha, construido ->
      [nome | campos] = String.split(linha, ",")
      if Enum.count(campos) == Enum.count(titulos) do
          linha_dados = Enum.zip(titulos, campos) |> Enum.into(%{})
          Map.merge(construido, %{nome => linha_dados})
      else
        construido
      end
      end)

  end


  @doc """
    Função responsável por mostrar os "todos" e chamar a interface de comando.
  """

  def mostra_todos(dados, next_comando? \\ true) do

      items = Map.keys dados
      IO.puts "Você tem os seguintes Todos:\n"
      Enum.each items, fn item -> IO.puts item end
      IO.puts "\n"
      if next_comando? do
        get_comando(dados)
      end

  end

end
