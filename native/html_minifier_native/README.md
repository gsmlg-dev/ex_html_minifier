# NIF for HtmlMinifier

## To build the NIF module:

- Your NIF will now build along with your project.

## To load the NIF:

```elixir
defmodule HtmlMinifier do
  use Rustler, otp_app: :html_minifier, crate: "html_minifier_native"

  # When your NIF is loaded, it will override this function.
  def mifnify(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
```

## Examples

[This](https://github.com/rusterlium/NifIo) is a complete example of a NIF written in Rust.
