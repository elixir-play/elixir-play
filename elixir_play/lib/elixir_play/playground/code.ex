defmodule ElixirPlay.Playground.Code do
  @doc """
  Is the module responsible to store the code story. It stores the version
  of the code with its source code.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "codes" do
    field(:elixir_version, :string)
    field(:source, :string)

    timestamps()
  end

  @doc false
  def changeset(code, attrs) do
    code
    |> cast(attrs, [:source, :elixir_version])
    |> validate_required([:source, :elixir_version])
  end
end
