defmodule ElixirPlayWeb.PageControllerTest do
  use ElixirPlayWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Elixir Play"
  end

  test "/run", %{conn: conn} do
    code = %{"source" => ~s(IO.puts "Hello World"), "elixir_version" => "0.0.0"}
    conn = post(conn, "/run", code: code)
    assert json_response(conn, 200)["output"] =~ "Hello World"
  end
end
