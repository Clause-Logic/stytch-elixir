defmodule Stytch.MixProject do
  use Mix.Project

  def project do
    [
      app: :stytch,
      version: "0.1.3",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Stytch",
      description: "An Elixir API Client for Stytch",
      source_url: "https://github.com/moomerman/stytch-ex",
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package() do
    [
      files: ~w(lib config mix.exs README* LICENSE*),
      links: %{GitHub: "https://github.com/moomerman/stytch-ex"},
      licenses: ["MIT"]
    ]
  end

  defp docs() do
    [
      extras: ["README.md": [title: "Overview"], LICENSE: [title: "License"]],
      main: "readme"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.3.1"},
      {:ex_doc, "0.29.0", only: :dev, runtime: false}
    ]
  end
end