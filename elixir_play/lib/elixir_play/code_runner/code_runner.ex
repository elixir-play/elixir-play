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
    case version in available_versions() do
      true ->
        @runner.run(source, version)

      false ->
        %{output: "unavailable version #{version}"}
    end
  end

  @spec available_versions() :: [String.t()]
  def available_versions do
    @runner.available_versions()
  end
end
