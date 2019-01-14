defmodule ElixirPlayWeb.PageView do
  use ElixirPlayWeb, :view
  @dialyzer :no_match

  def render("result.json", %{result: result}) do
    result
  end

  def default_code do
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
