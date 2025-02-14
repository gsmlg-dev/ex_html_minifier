defmodule HtmlMinifier.MixProject do
  use Mix.Project

  def project do
    [
      app: :html_minifier,
      version: "0.1.0",
      elixir: "~> 1.14",
      compilers: [:rustler] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "An Elixir package that minifies HTML using Rust.",
      package: package(),
      source_url: "https://github.com/gsmlg-dev/ex_html_minifier"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.30"}
    ]
  end

  defp package do
    [
      maintainers: ["Jonathan Gao"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/gsmlg-dev/ex_html_minifier"}
    ]
  end
end
