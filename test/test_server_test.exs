defmodule TestServerTest do
  use ExUnit.Case
  doctest TestServer

  test "greets the world" do
    assert TestServer.hello() == :world
  end
end
