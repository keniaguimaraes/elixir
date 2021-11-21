defmodule TailTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  doctest Tail

  test "print last 2 lines [Passa]" do
    assert capture_io(fn -> Tail.start([number: "2"], ["./test/mockfile.txt"], []) end) == "\nLove you!\n"
  end

  test "print last line [Não passa]" do
    assert capture_io(fn -> Tail.start([number: "2"], ["./test/mockfile.txt"], []) end) == "Love you!\n"
  end
end
