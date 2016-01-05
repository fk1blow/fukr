defmodule SKTest do
  use ExUnit.Case
  alias SK.Maybe

  doctest SK

  test "should return a :none, if i create a Maybe with a nil" do
    res = Maybe.from(nil) |> Maybe.get()
    assert res == :none
  end

  test "should not run the function, if i create a Maybe with a nil" do
    res = Maybe.from(nil) |> Maybe.map(fn _ -> true end)
    assert res == :none
  end

  test "should run `or_else` instead of `map`, if i create a Maybe with a nil" do
    res = Maybe.from(nil)
    |> Maybe.map(fn _ -> true end)
    |> Maybe.or_else(fn val -> val end)
    assert res == :none
  end

  test "should run `map` instead of `or_else`, if i create a Maybe with a value" do
    res = Maybe.from(true)
    |> Maybe.map(fn val -> val end)
    |> Maybe.or_else(fn _ -> false end)
    assert res == {:some, true}
  end

  test "should run the `map` function, if i create a Maybe with a value" do
    res = Maybe.from(true) |> Maybe.map(fn val -> val end)
    assert res == {:some, true}
  end

  test "should run the function and return a %{:val => \"the value\"}" do
    res = Maybe.from(true)
    |> Maybe.map(fn val -> %{:val => val} end)
    |> Maybe.get()
    assert res == %{:val => true}
  end

  test "should run the function and return a {:some, %{:val => \"the value\"}}" do
    res = Maybe.from(true)
    |> Maybe.map(fn val -> %{:val => val} end)
    assert res == {:some, %{:val => true}}
  end
end
