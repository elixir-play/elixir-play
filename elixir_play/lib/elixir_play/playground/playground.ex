defmodule ElixirPlay.Playground do
  @moduledoc """
  module that has the logic to handle playground excecution
  """

  alias ElixirPlay.CodeRunner
  require Logger

  @doc """
  runs the given code on a given elixir_version
  """
  @spec run(map()) :: map()
  def run(%{"source" => source, "elixir_version" => elixir_version}) do
    Logger.info("running code (#{elixir_version})\n #{source} \n")
    CodeRunner.run(source, elixir_version)
  end

  @doc """
  formats the given code under the current runtime
  """
  @spec format(map()) :: map
  def format(%{"source" => source}) do
    code_formated = IO.iodata_to_binary([Code.format_string!(source), "\n"])
    %{output: code_formated}
  rescue
    error ->
      %{error: error.description}
  end

  @doc """
  Get the available versions from the current code runner
  """
  @spec available_versions() :: [String.t()]
  def available_versions do
    CodeRunner.available_versions()
  end
end
