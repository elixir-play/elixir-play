defmodule ElixirPlay.CodeRunner.Local do
  def run(source, _version) do
    {output, _exit_status} = System.cmd("elixir", ["-e", source], stderr_to_stdout: true)

    %{output: output}
  end

  def avaliable_versions do
    ["local-#{System.version}"]
  end
end
