defmodule ElixirPlayWeb.PageControllerTest do
  use ElixirPlayWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Elixir Play"
  end
end
