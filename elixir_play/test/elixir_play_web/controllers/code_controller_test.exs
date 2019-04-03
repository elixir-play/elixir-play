defmodule ElixirPlayWeb.CodeControllerTest do
  use ElixirPlayWeb.ConnCase

  @local_version "local-#{System.version()}"

  test "POST /run", %{conn: conn} do
    code = %{"source" => ~s(IO.puts "Hello World"), "elixir_version" => @local_version}
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
      "versions" => [@local_version]
    }

    conn = get(conn, "/versions")
    assert json_response(conn, 200) == response
  end
end
