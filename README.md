# HtmlMinifier

[![Elixir CI](https://github.com/gsmlg-dev/ex_html_minifier/actions/workflows/elixir_ci.yml/badge.svg)](https://github.com/gsmlg-dev/ex_html_minifier/actions/workflows/elixir_ci.yml)
[![Hex.pm](https://img.shields.io/hexpm/v/html_minifier.svg)](https://hex.pm/packages/html_minifier)
[![Hexdocs.pm](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/html_minifier/)
[![Hex.pm](https://img.shields.io/hexpm/dt/html_minifier.svg)](https://hex.pm/packages/html_minifier)
[![Hex.pm](https://img.shields.io/hexpm/dw/html_minifier.svg)](https://hex.pm/packages/html_minifier)


## Installation

The package can be installed
by adding `html_minifier` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:html_minifier, "~> 0.1"}
  ]
end
```

## Examples

```elixir
iex> HtmlMinifier.minify("<div>      A       </div>", %HtmlMinfier{})
"<div> A </div>"
```

## Config

```elixir
%HtmlMinifier{
  keep_closing_tags: boolean(),
  keep_html_and_head_opening_tags: boolean(),
  keep_spaces_between_attributes: boolean(),
  minify_css: boolean(),
  minify_js: boolean(),
  remove_bangs: boolean(),
  remove_processing_instructions: boolean(),
  do_not_minify_doctype: boolean(),
  ensure_spec_compliant_unquoted_attribute_values: boolean(),
  keep_comments: boolean(),
  keep_input_type_text_attr: boolean(),
  keep_ssi_comments: boolean(),
  preserve_brace_template_syntax: boolean(),
  preserve_chevron_percent_template_syntax: boolean()
}
```
