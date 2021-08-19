defmodule Greeting do
  def good(time) do
    "good #{time}"
  end

  def morning(name) do
    "morning #{name}"
  end

  def day_type(time) do
    cond do
      String.contains?(time, ["morning"]) -> "morning is definetly good #{time}"
      true -> "What? What? #{time}"
    end
  end
end
