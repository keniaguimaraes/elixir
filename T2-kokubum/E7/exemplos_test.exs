ExUnit.start()

defmodule ExemplosTest do
  use ExUnit.Case

  test "test that pass" do
    assert Guard.colors_for(1) == ["Green", "Blue", "Pink"]
  end

  test "test that doesn't pass" do
    assert Guard.colors_for("M") == ["Green"]
  end
end
