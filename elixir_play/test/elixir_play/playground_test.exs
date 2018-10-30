defmodule ElixirPlay.PlaygroundTest do
  use ExUnit.Case, async: true
  alias ElixirPlay.Playground

  test "runs the code" do
    code = %{"source" => ~s(IO.puts "hey"), "elixir_version" => "local"}

    assert Playground.run(code) == %{output: "hey\n"}
  end
end
