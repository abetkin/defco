## Defco


This will be a dependency injection framework. Notes are mostly for myself

```elixir
defmodule Base do

  defco params(%Conn{} = c) do

  end

  defco user(%Params{} = p) do
    1
  end

end


defmodule Mm do

  use Components, from: Base

  defco queryset(%Conn{} = c) do
    c |> Conn.fetch("select * from my_table")
  end


defmodule MyPlug do
  use Components, only: [dispatch: 1]

  def call(conn, opts)queryset(qs)) do
    conn = conn |> dispatch
    conn |> send_resp(200, "done")
  end
end
```