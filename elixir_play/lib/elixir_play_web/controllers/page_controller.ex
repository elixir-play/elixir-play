defmodule ElixirPlayWeb.PageController do
  use ElixirPlayWeb, :controller
  alias ElixirPlay.Playground

  def index(conn, _params) do
    render(conn, "index.html", code: default_code(), versions: ["1.7.3", "1.6.6"])
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

  defp default_code do
    """
    defmodule Hello do
      def world, do: "Hello World"
    end

    IO.puts(Hello.world)
    """
  end
end
