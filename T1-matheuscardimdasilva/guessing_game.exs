ExUnit.start();
defmodule GuessingGameTest do
    use ExUnit.Case

    test "metade de 100 e 50" do
        assert GuessingGame.mid(0, 100) == 50
    end

    test "metade de 100 nao e -50" do
        assert GuessingGame.mid(0, 100) == -50
    end
end