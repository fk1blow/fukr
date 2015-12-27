# SK

_This is nothing but a playground; view the test if interested!_

...it is a Maybe that contains a value or not. If it doesn't,
it says that is :none, otherwise, it's the actual value.

To build one, you call `Maybe.from("some dumb value)`, which will eventuall wrap the value
inside a tuple - `{:some, value}` - although it may be better as a structure, something as
`%Maybe.Some{value}`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add skalex to your list of dependencies in `mix.exs`:

        def deps do
          [{:skalex, "~> 0.0.1"}]
        end

  2. Ensure skalex is started before your application:

        def application do
          [applications: [:skalex]]
        end
