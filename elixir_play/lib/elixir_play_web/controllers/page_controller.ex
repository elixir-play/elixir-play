defmodule ElixirPlayWeb.PageController do
  use ElixirPlayWeb, :controller
  alias ElixirPlay.Playground

  def index(conn, _params) do
    versions = Playground.available_versions()
    render(conn, "index.html", versions: versions)
  end

  @doc """
  runs the code that is sent from the page. returns the result of the code that was runned
  """
  def run(conn, %{"code" => code}) do
    result = Playground.run(code)
    render(conn, "result.json", result: result)
  end

  def format(conn, %{"code" => code}) do
    result = Playground.format(code)
    render(conn, "result.json", result: result)
  end
end
