defmodule ElixirPlay.Playground do
  @moduledoc """
  module that has the logic to handle playground excecution
  """

  alias ElixirPlay.CodeRunner

  @doc """
  runs the given code on a given elixir_version
  """
  @spec run(map()) :: map()
  def run(%{"source" => source, "elixir_version" => elixir_version}) do
    CodeRunner.run(source, elixir_version)
  end

  @doc """
  formats the given code under the current runtime
  """
  @spec format(String.t()) :: map
  def format(code) do
    code_formated = IO.iodata_to_binary([Code.format_string!(code), "\n"])
    %{output: code_formated}
  rescue
    error ->
      %{output: error.description}
  end
end
