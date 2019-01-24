defmodule ElixirPlay.PlaygroundTest do
  use ExUnit.Case, async: true
  alias ElixirPlay.Playground

  test "runs the code" do
    code = %{"source" => ~s(IO.puts "hey"), "elixir_version" => "local"}

    assert Playground.run(code) == %{output: "hey\n"}
  end

  test "formats the code" do
    code = %{"source" => ~s(IO.puts "hey")}

    assert Playground.format(code) == %{output: ~s|IO.puts("hey")\n|}
  end

  test "fetchs code versions" do
    assert is_list(Playground.available_versions())
  end
end
