defmodule ElixirPlay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      ElixirPlay.Repo,
      # Start the endpoint when the application starts
      ElixirPlayWeb.Endpoint
      # Starts a worker by calling: ElixirPlay.Worker.start_link(arg)
      # {ElixirPlay.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirPlay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirPlayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
