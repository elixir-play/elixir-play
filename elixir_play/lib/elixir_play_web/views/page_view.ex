defmodule ElixirPlayWeb.PageView do
  use ElixirPlayWeb, :view

  def render("result.json", %{result: result}) do
    result
  end
end
