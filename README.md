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
  use Components

  def call(conn, opts) do
    conn |> get queryset(qs) do
      objects = qs |> Jason.encode!
      conn |> send_resp(200, objects)
    end
  end
end
```