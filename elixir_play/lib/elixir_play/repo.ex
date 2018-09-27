defmodule ElixirPlay.Repo do
  use Ecto.Repo,
    otp_app: :elixir_play,
    adapter: Ecto.Adapters.Postgres
end
