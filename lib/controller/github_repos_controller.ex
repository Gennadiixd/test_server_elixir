defmodule GitHubReposController do
  # def get_ids(repos) do
  # end
  # plug(Plug.Parsers,
  #   parsers: [:json],
  #   pass: ["*/*", "application/json", "text/plain"],
  #   json_decoder: Poison
  # )

  #   def process_response_body(body) do
  #   body
  #   |> Poison.decode!
  #   |> Map.take(@expected_fields)
  #   |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  # end
  def get_id(repo) do
    Map.get(repo, "id")
  end

  def get_name(repo) do
    Map.get(repo, "name")
  end

  def get_repos(user) do
    response = HTTPoison.get!("https://api.github.com/users/#{user}/repos")

    response.body
    |> Poison.decode!()
    |> Enum.map(fn repo -> %{get_name(repo) => get_id(repo)} end)
    # |> Enum.map(fn repo -> Tuple.to_list(repo) end)
    |> Poison.encode!()

    # [%{"user" => "1"}]
    # |> Poison.encode!()
  end
end
