defmodule Tail.MixProject do
  use Mix.Project

  def project do
    [
      app: :tail,
      version: "0.1.0",
      elixir: "~> 1.12",
      escript: [main_module: Tail.CLI],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end


  def application do
    [
      extra_applications: [:logger]
    ]
  end


  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
