defmodule ElixirPlay.Repo do
  use Ecto.Repo,
    otp_app: :elixir_play,
    adapter: Ecto.Adapters.Postgres

  @dialyzer {:nowarn_function, rollback: 1}
end
