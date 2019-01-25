test_play:
	cd elixir_play && mix test

fetch_dependencies:
	cd elixir_play && mix deps.get

migrate_ci:
	cd elixir_play && MIX_ENV=test mix do ecto.create, ecto.migrate
