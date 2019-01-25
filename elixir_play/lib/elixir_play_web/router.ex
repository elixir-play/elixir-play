defmodule ElixirPlayWeb.Router do
  use ElixirPlayWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirPlayWeb do
    # Use the default browser stack
    pipe_through :browser

    get "/", PageController, :index
  end

  # json api
  scope "/", ElixirPlayWeb do
    pipe_through :api

    post "/run", CodeController, :run
    post "/format", CodeController, :format
    get "/versions", CodeController, :versions
  end
end
