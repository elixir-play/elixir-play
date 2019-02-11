defmodule ElixirPlay.CodeRunner.Docker do
  @moduledoc """
  Code Runner based on docker distributions
  """

  @doc """
  runs the docker code by executing a docker command with a specific
  elixir version
  """
  def run(source, version) do
    {output, _exit_status} =
      System.cmd(
        "docker",
        [
          "run",
          "--rm",
          "--tty",
          "--memory",
          "256m",
          "--memory-swap",
          "320m",
          "--network",
          "none",
          "--cap-drop=ALL",
          "--pids-limit=512",
          "playground-elixir-#{version}",
          "elixir",
          "--name",
          "playground",
          "-S",
          "mix",
          "run",
          "--no-start",
          "-e",
          source
        ],
        stderr_to_stdout: true
      )

    %{output: output}
  end

  def available_versions do
    ~w(1.8.1 1.7.4 1.6.6 1.5.3)
  end
end
