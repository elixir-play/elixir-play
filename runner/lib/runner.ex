defmodule Runner do
  @moduledoc """
  Documentation for Runner.
  """

  def run_code(str) do
    System.cmd("docker", ["run", "--rm", "playground-1.7.3", "mix", "run", "-e", "IO.puts(\"foobar\")"])
  end
end
