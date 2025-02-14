defmodule HtmlMinifier.MixProject do
  use Mix.Project

  @source_url "https://github.com/gsmlg-dev/ex_html_minifier.git"
  @version "0.1.1"

  def project do
    [
      app: :html_minifier,
      version: @version,
      elixir: "~> 1.14",
      compilers: Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "An Elixir package that minifies HTML using Rust.",
      package: package(),
      source_url: @source_url
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
      {:rustler, "~> 0.30"},
      {:rustler_precompiled, "~> 0.8"}
    ]
  end

  defp package do
    [
      maintainers: ["Jonathan Gao"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end
end
