defmodule Server.Router do
  use Plug.Router
  # use Plug.ErrorHandler

  # alias Server.Plug.VerifyRequest

  # plug(Plug.Parsers, parsers: [:urlencoded, :multipart])

  # plug(
  #   VerifyRequest,
  #   fields: ["content", "mimetype"],
  #   paths: ["/upload"]
  # )

  plug(:match)
  plug(:dispatch)

  # get("/", do: send_resp(conn, 200, "Welcome\n"))
  # post("/upload", do: send_resp(conn, 201, "Uploaded\n"))
  # match(_, do: send_resp(conn, 404, "Oops!\n"))

  get "/hello" do
    send_resp(conn, 200, "world")
  end

  forward "/user", to: UserRouter

  forward "/github", to: GitHubRouter

  match _ do
    send_resp(conn, 404, "oops")
  end
end
