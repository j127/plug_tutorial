defmodule DinoapiTest do
  use ExUnit.Case
  doctest Dinoapi

  test "greets the world" do
    assert Dinoapi.hello() == :world
  end
end
