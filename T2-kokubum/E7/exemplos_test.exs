ExUnit.start()

defmodule ExemplosTest do
  use ExUnit.Case

  test "First test that pass" do
    assert Guard.colors_for(1) == ["Green", "Blue", "Pink"]
  end

  test "Second test that pass" do
    assert Guard.colors_for("S") == ["Green", "Blue", "Pink"]
  end

  test "First test that doesn't pass" do
    assert Guard.colors_for("M") == ["Green"]
  end

  test "Second test that doesn't pass" do
    assert Guard.colors_for(3) == ["Green", "Black"]
  end
end
