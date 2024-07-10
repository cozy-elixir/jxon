# JXON

[![CI](https://github.com/cozy-elixir/jxon/actions/workflows/ci.yml/badge.svg)](https://github.com/cozy-elixir/jxon/actions/workflows/ci.yml)
[![Hex.pm](https://img.shields.io/hexpm/v/jxon.svg)](https://hex.pm/packages/jxon)

A wrapper for various JSON implementations.

## Installation

Add `:jxon` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:jxon, <requirement>}
  ]
end
```

## Usage

For more information, see the [documentation](https://hexdocs.pm/jxon).

## Traps

### The order of map keys

As stated in [Erlang/OTP 26.0 Release Note](https://www.erlang.org/news/164#maps):

> Some map operations have been optimized by changing the internal sort order of atom keys. This changes the (undocumented) order of how atom keys in small maps are printed and returned. The new order is unpredictable and may change between different invocations of the Erlang VM.

Because of that, don't rely on the order of map keys.

## Thanks

Inspired by the `json_module` of [jose](https://github.com/potatosalad/erlang-jose).

## License

[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
