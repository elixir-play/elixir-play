defmodule ElixirPlayWeb.PageController do
  use ElixirPlayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", code: default_code())
  end

  def run(conn, %{"code" => code}) do
    {output, 0} =
      System.cmd("docker", ["run", "--rm", "playground-1.7.3", "mix", "run", "-e", code])

    render(conn, "result.json", result: %{output: output})
  end

  defp default_code do
    """
    defmodule Hello do
      def world, do: "Hello World"
    end

    defmodule Factorial do
      def fac(0), do: 1
      def fac(n), do: n * fac(n - 1)
    end

    IO.puts(Hello.world)
    IO.puts(Factorial.fac(10))
    """
  end
end
