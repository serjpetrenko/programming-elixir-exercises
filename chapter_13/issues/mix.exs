defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      escript: escript_config(),
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url:
        "https://github.com/serjpetrenko/programming-elixir-exercises/tree/master/chapter_13/issues"
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
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"},
      {:ex_doc, "~> 0.28.2"},
      {:earmark, "~> 1.4"}
    ]
  end

  def escript_config do
    [
      main_module: Issues.CLI
    ]
  end
end
