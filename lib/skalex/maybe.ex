defmodule SK.Maybe do
  @moduledoc """
    Naive Maybe monad attempt
  """

  @doc """
  Creates a new Maybe
  """
  def from(value), do: {:some, value}

  def some(value), do: from value

  def none(_ \\ nil), do: {:none, nil}

  @doc """
  Map over the maybe, applying the value to the provided callback function,
  or does nothing {:none, nil}
  """
  def map({:none, _}, _callback), do: {:none, nil}
  def map({:some, value}, callback), do: SK.Maybe.from(callback.(value))

  @doc """
  Transforms into a plain value if {:none, nil}, or simply returns the some
  """
  def or_else({:none, _}, callback), do: callback.({:none, nil})
  def or_else({:some, value}, _callback), do: {:some, value}

  @doc """
  Extract the value of the `Maybe`
  """
  def get({:some, value}), do: value
  def get({:none, _}), do: nil
end
