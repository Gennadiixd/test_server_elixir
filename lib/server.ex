defmodule Server do
  use Application

  def start(_type, _args) do
    port = Application.get_env(:test_server, :cowboy_port)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Server.Router, [], port: port)
    ]

    IO.puts "server about to start on port #{port}"
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
