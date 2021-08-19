defmodule UserRouter do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  def greeting(name), do: Greeting.morning(name)
  def describe(greeting), do: Greeting.good(greeting)

  get "/:name" do
    send_resp(conn, 200, greeting(name) |> describe |> Greeting.day_type)
  end
end
