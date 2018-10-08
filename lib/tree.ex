


defmodule My.Node do
  defstruct [
    :name,
    :children,
  ]
end

defmodule My.Tree do
  '''
  root -> is_list(l1) -> is_list(l2) -> is_list(l3)
  '''

  alias My.Node, as: Node

  def process(tree, opts) do
    process(tree, [], opts)
  end

  def process([], result, _opts) do
    result |> Enum.reverse()
  end

  def process([%Node{children: nil} = node | rest], result, config: config) do
    children = config.get_children(node.name)
    new_node = %{node | children: children}
    process([new_node | rest], result, config: config)
  end

  def process([%Node{children: []} = node | rest], result, opts)  do
    process(rest, [node.name | result], opts)
  end

  def process([%Node{children: [last | children]} = prev | rest], result, opts) do
    process([
      %Node{name: last}, %Node{prev | children: children} | rest
    ], result, opts)
  end

end

