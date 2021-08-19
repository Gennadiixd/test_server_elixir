defmodule TestServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :test_server,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix run --no-halt" to start app.
  def application do
    [
      extra_applications: [:logger],
      mod: {Server, []},
      env: [cowboy_port: 8080]
    ]
  end

  # Run "mix deps.get" to install dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.1.2"},
      {:plug, "~> 1.3.4"},
      {:poison, "~> 5.0"},
      {:httpoison, "~> 1.8"}
    ]
  end
end
