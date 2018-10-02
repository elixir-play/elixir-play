defmodule ElixirPlay.Playground do
  @moduledoc """
  module for the playground
  """

  @spec run(string) :: map
  def run(code) do
    {output, _exit_status} =
      System.cmd(
        "docker",
        [
          "run",
          "--cpu-period=50000",
          "--cpu-quota=25000",
          "--rm",
          "playground-1.7.3",
          "mix",
          "run",
          "-e",
          code
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
