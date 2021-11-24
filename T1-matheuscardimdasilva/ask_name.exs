ExUnit.start();
defmodule AskNameTest do
    use ExUnit.Case
    import ExUnit.CaptureIO

    test "nome nao e matheus silva" do
        assert capture_io(fn -> GreetByName.gotResposta("Teste") end) == "Bem-vindo Teste!\n\n"
    end

    test "nome e matheus silva" do
        assert capture_io(fn -> GreetByName.gotResposta("Matheus Silva") end) == "Bem-vindo Matheus Silva!\n\n"
    end
end