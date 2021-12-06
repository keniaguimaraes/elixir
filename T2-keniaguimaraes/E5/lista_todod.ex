defmodule MinimalTodo do
  @moduledoc """
   Este modulo provê a funcionalidade de importar uma de listas de (Todos) em CSV, 
   realizando operações como ler, excluir, adicionar e mostrar.
  """
  @doc """
    Função de incio do programa, onde é informado o nome do arquivo .csv que será utilizado.
  """

  def inicio do
    arquivo = IO.gets("Nomed do .csv para carregamento: ") |> String.trim
    read(arquivo)
    |> parse
    |> arquivo
  end
  
  @doc """
    Função que exibie uma interface com a opções do programa e captura a opção escolhida
  """
  def pegar_comando(dado) do
    prompt = """
    Insira a primeira letra do aqruivo que vc quer rodar
    R)ead Todos A)dd a Todo D)elete a Todo L)oad a .csv S)ave a .csv
    """
    comando = IO.gets(prompt)
    |> String.trim
    |> String.downcase

    case comando do
      "r" -> mostrar_todo(dado)
      "d" -> deletar_todo(dado)
      "q" -> "Fui!"
      _ -> pegar_comando(dado)
    end
  end
  
  @doc """
    Função que deleta uma dado do arquivo se eles existir caso contrario avisa que nao existe dado.
  """
  def deletar_todo(dado) do
    todo = IO.gets("deseja deletar qual todo?\n")
    |> String.trim
    if Map.has_key? dado, todo do
      IO.puts "ok"
      mapa_novo = Map.drop(dado, [todo])
      IO.puts ~s("#{todo}"foi deletado.)
      pegar_comando(mapa_novo)
    else
      IO.puts ~s(Não existe todo "#{todo}".)
      mostrar_todo(dado, false)
      deletar_todo(dado)
    end
  end
  @doc """
    Função que exibe os dado do arquivo e chama a função pegar_comando novamente
  """
  def mostrar_todo(dado, proximo_coman? \\ true) do
    items = Map.keys dado
    IO.puts "Você possui os Todos:\n"
    Enum.each items, fn item -> IO.puts item end
    IO.puts "\n"
    if proximo_coman? do
      pegar_comando(dado)
    end
  end
  
  @doc """
    Função responsavel pela leitua doarquivo. Caso haja erro avisa o usuario
  """ 
  def ler(nm_arquivo) do
    case File.read(nm_arquivo) do
      {:ok, body} -> body
      {:error, reason} -> IO.puts ~s(Não é possivel abrir "#{nm_arquivo}" \n)
                          IO.puts ~s("#{:file.format_error reason}"\n)
                          start()
    end
  end
  
  @doc """
    Função separá-lo  o arquivo em linhas. 
  """ 
  def parse(body) do
    [cabeça | linha] = String.split(body, ~r{(\r\n|\r|\n)})
    titulo = tl String.split(cabeça, ",")
    parse_lines(linha, titulo)
  end
  
  @doc """
     A função que transformar cada linha em uma chave: a cada "," é adicionado um campo caso a uantidade de campos da linha for diferente da quantidade totall de linhas, um campo
    vazio é adicionado. 
  """ 	
  def parse_lines(linha, titulo) do
    Enum.reduce(linha, %{}, fn line, built ->
      [nome | campo] = String.split(linha, ",")
      if Enum.count(campo) == Enum.count(titulo) do
        dado_linha = Enum.zip(titulo, campo) |> Enum.into(%{})
        Map.merge(built, %{name => dado_linha})
      else
        built
      end
    end)
  end

end
