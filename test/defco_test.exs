defmodule Config do
  @map %{
    "c" => ["a", "b"],
    "d" => ["c", "a"],
    "e" => ["d", "x"]
  }

  def get_children(node) do
    @map |> Map.get(node, [])
  end
end

defmodule DefcoTest do
  use ExUnit.Case

  test "1" do
    seq =
      [%My.Node{name: "e"}]
      |> My.Tree.process(config: Config)

    assert seq == "a b c d x e" |> String.split()
  end

  # test "2" do
  #   Config.get_children("e")
  #   |> IO.inspect
  # end
end
