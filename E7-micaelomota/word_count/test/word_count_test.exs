defmodule WordCountTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WordCount

  test "Imprime a quantidade de caracteres [Passa]" do
    assert capture_io(fn -> WordCount.start([chars: nil], ["./test/mockfile.txt"], []) end) == "Characters: 41\n"
  end

  test "Imprime a quantidade de palavras [Não Passa]" do
    assert capture_io(fn -> WordCount.start([chars: nil, words: nil], ["./test/mockfile.txt"], []) end) == "Characters: 41\n"
  end
end
