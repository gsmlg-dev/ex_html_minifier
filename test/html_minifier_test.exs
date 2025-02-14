defmodule HtmlMinifierTest do
  use ExUnit.Case
  # doctest HtmlMinifier

  test "HtmlMinifier.minify" do
    assert HtmlMinifier.minify(~s[<div          ></div>], %HtmlMinifier{}) == ~s[<div></div>]
  end
end
