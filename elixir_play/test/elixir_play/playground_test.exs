defmodule ElixirPlay.PlaygroundTest do
  use ExUnit.Case, async: true
  alias ElixirPlay.Playground
  alias ElixirPlay.Repo
  alias ElixirPlay.Playground.Code

  describe "#run" do
    setup do
      code = %{"source" => ~s(IO.puts "hey"), "elixir_version" => "local"}

      %{result: Playground.run(code)}
    end

    test "returns the correct result", %{result: result} do
      assert result == %{output: "hey\n"}
    end

    test "saves the code that was executed" do
    end
  end

  test "formats the code" do
    code = %{"source" => ~s(IO.puts "hey")}

    assert Playground.format(code) == %{output: ~s|IO.puts("hey")\n|}
  end

  test "fetchs code versions" do
    assert is_list(Playground.available_versions())
  end
end
