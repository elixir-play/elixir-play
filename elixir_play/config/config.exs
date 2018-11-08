# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_play,
  ecto_repos: [ElixirPlay.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :elixir_play, ElixirPlayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "67cNToCcvjyjpEhUBPHcX5Z1Xnerma+S2zEEB6qHyytYg7R5EQeAwXLkbbynnPEC",
  render_errors: [view: ElixirPlayWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirPlay.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
