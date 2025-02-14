defmodule HtmlMinifierTest do
  use ExUnit.Case
  # doctest HtmlMinifier

  test "HtmlMinifier.minify" do
    assert HtmlMinifier.minify(~s[<html          ></html>]) == ~s[<html></html>]
  end
end
