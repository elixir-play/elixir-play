defmodule ElixirPlay.CodeRunner do
  @moduledoc """
  This module responsible to run the code.

  Run the code against the Runner configurated via the option `:elixir_play, :code_runner`

  The default CodeRunner is ElixirPlay.CodeRunner.Local
  """
  alias ElixirPlay.CodeRunner.{Local}

  @runner Application.get_env(:elixir_play, :code_runner, Local)

  @spec run(String.t(), String.t()) :: %{output: String.t()}
  def run(source, version) do
    @runner.run(source, version)
  end
end
