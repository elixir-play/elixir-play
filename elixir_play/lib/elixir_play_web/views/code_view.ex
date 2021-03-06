defmodule ElixirPlayWeb.CodeView do
  use ElixirPlayWeb, :view

  def render("result.json", %{result: result}) do
    result
  end

  def render("result.json", %{error: error}) do
    error
  end

  def render("versions.json", %{versions: versions}) do
    %{"versions" => versions}
  end
end
