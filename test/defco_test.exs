defmodule DefcoTest do
  use ExUnit.Case
  doctest Defco

  test "greets the world" do
    assert Defco.hello() == :world
  end
end
