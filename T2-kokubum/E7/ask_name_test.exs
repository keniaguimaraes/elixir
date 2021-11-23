# elixir -r ask_name.ex ask_name_test.exs

ExUnit.start()

defmodule AskNameTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "First test that pass" do
    assert capture_io("ERICK", fn -> AskName.ask_name() end) ==
             "What's your name? Hey ERICK, congratulations, you have the same name as me! Nice to meet you, we will definitely be friends!\n"
  end

  test "Second test that pass" do
    assert capture_io("Jonas", fn -> AskName.ask_name() end) ==
             "What's your name? Hello, Jonas! Nice to meet you!\n"
  end

  test "Firt test that doesn't pass" do
    assert capture_io("Jonas", fn -> AskName.ask_name() end) ==
             "What's your name? Hey Jonas, congratulations, you have the same name as me! Nice to meet you, we will definitely be friends!\n"
  end

  test "Second test that doesn't pass" do
    assert capture_io("Erick", fn -> AskName.ask_name() end) ==
             "What's your name? Hello, Erick! Nice to meet you!\n"
  end
end
