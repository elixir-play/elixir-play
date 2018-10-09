defmodule ElixirPlay.Playground do
  @moduledoc """
  module for the playground
  """

  @spec run(string) :: map
  def run(%{"source" => source, "elixir_version" => elixir_version}) do
    {output, _exit_status} =
      System.cmd(
        "docker",
        [
          "run",
          "--rm",
          "--tty",
          "--memory", "256m",
          "--memory-swap", "320m",
          "--network", "none",
          "--cap-drop=ALL",
          "--pids-limit=512",
          "playground-#{elixir_version}",
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

  @spec format(string) :: map
  def format(code) do
    code_formated = IO.iodata_to_binary([Code.format_string!(code), "\n"])
    %{output: code_formated}
  rescue
    error ->
      %{output: error.description}
  end
end
