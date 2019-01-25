defmodule ElixirPlay.Repo.Migrations.CreateCodes do
  use Ecto.Migration

  def change do
    create table(:codes, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:source, :text)
      add(:elixir_version, :string)

      timestamps()
    end
  end
end
