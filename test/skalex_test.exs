defmodule SKTest do
  use ExUnit.Case
  alias SK.Maybe

  doctest SK

  test "detects invalidity of the token" do
    result = Maybe.from(nil)
      |> Maybe.map(fn val -> %{"base_request" => {:something, val}} end)
      |> Maybe.or_else(fn _ -> {:error, "invalid token"} end)
      |> Maybe.get
    assert {:error, _} = result
  end

  test "detects validity of the token" do
    result = Maybe.from("92adh1lnadsASD!@#asd812SDag")
      |> Maybe.map(fn val -> {:base_request, val} end)
      |> Maybe.or_else(fn _ -> "invalid token" end)
      |> Maybe.get
    assert {:base_request, something} = result
  end
end
