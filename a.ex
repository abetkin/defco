

defmodule Meta do
  defmacro __using__(_env) do
    quote do
      import Meta
    end
  end

  defmacro pass(v, v2, body) do
    {v2, body} |> IO.inspect
    nil
  end
end


defmodule M do
  use Meta

  def f do
    1 |> pass x do
      IO.puts x
    end
  end
end
