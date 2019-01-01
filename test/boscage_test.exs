defmodule BoscageTest do
  use ExUnit.Case
  doctest Boscage

  test "greets the world" do
    assert Boscage.hello() == :world
  end
end
