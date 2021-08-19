defmodule GitHubRouter do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/:user" do
    user_repos = GitHubReposController.get_repos(user)
    send_resp(%{conn | resp_headers: [{"content-type", "application/json"}]}, 200, user_repos)
  end
end
