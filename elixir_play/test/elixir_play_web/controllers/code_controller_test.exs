defmodule ElixirPlayWeb.CodeControllerTest do
  use ElixirPlayWeb.ConnCase

  test "POST /run", %{conn: conn} do
    code = %{"source" => ~s(IO.puts "Hello World"), "elixir_version" => "0.0.0"}
    conn = post(conn, "/run", code: code)
    assert json_response(conn, 200)["output"] =~ "Hello World"
  end

  test "POST /format", %{conn: conn} do
    code = %{"source" => ~s(IO.puts "Hello World")}
    conn = post(conn, "/format", code: code)
    assert json_response(conn, 200)["output"] =~ ~s[IO.puts("Hello World")]
  end

  test "GET /versions", %{conn: conn} do
    response = %{
      "versions" => ["local-#{System.version()}"]
    }

    conn = get(conn, "/versions")
    assert json_response(conn, 200) == response
  end
end
