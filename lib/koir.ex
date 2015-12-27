defmodule SK.Koir do
  alias SK.Maybe

  def metadata(token \\ nil) do
    token
    |> Maybe.from
    |> Maybe.map(fn value -> {:dummy_request, value} end)
    |> Maybe.or_else(fn value -> {:error, "invalid access token"} end)
  end
end
