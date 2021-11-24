ExUnit.start()

defmodule AskNameTest do
  use ExUnit.Case

    import ExUnit.CaptureIO

    # testes que passam
    test "Teste que passa 1" do
      assert capture_io(fn -> AskName.printName("Alberto") end) == "Hello world Alberto from Elixir\n"
    end

    test "Teste que passa 2" do
      assert capture_io(fn -> AskName.printName("Maria") end) == "Hello world Maria from Elixir\n"
    end

    # testes que nao passam
    test "Teste que nao passa 1" do
      assert capture_io(fn -> AskName.printName("Maria") end) == "Hello world Alberto from Elixir\n"
    end

    test "Teste que nao passa 2" do
      assert capture_io(fn -> AskName.printName("Alberto") end) == "Hello world Maria from Elixir\n"
    end

  end



#
# elixir -r ask_name.ex ask_nameTest.exs
