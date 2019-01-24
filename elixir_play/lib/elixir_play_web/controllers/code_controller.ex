defmodule ElixirPlayWeb.CodeController do
  use ElixirPlayWeb, :controller
  alias ElixirPlay.Playground

  @doc """
  runs the code that is sent from the page. returns the result of the code that was runned
  """
  def run(conn, %{"code" => code}) do
    result = Playground.run(code)
    render(conn, "result.json", result: result)
  end

  @doc """
  formats the given code using the latest version of the language
  """
  def format(conn, %{"code" => code}) do
    result = Playground.format(code)
    render(conn, "result.json", result: result)
  end
end
