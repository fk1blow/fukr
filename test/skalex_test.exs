defmodule SKTest do
  use ExUnit.Case
  alias SK.Maybe

  doctest SK

  test "should return {:some, value}" do
    res = Maybe.from("my value")
    assert res == {:some, "my value"}
  end

  test "should create a some" do
    res = Maybe.some(true)
    assert res == {:some, true}
  end

  test "should create a :none" do
    res = Maybe.none()
    assert res == {:none, nil}
  end

  test "should run the map, for some" do
    res = Maybe.some("something new")
    |> Maybe.map(fn val -> val <> " and stuff" end)
    assert res == {:some, "something new and stuff"}
  end

  test "should not run the map, for none" do
    res = Maybe.none() |> Maybe.map(fn _ -> true end)
    assert res == {:none, nil}
  end

  test "should return the value of some" do
    res = Maybe.some("wooow") |> Maybe.get()
    assert res == "wooow"
  end

  test "should return the value of none" do
    res = Maybe.none() |> Maybe.get()
    assert res == nil
  end
end
