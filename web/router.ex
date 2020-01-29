defmodule One2.Router do
  use One2.Web, :router

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

  scope "/", One2 do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", One2 do
  #   pipe_through :api
  # end
end
