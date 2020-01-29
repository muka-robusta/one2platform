# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :one2platform,
  namespace: One2,
  ecto_repos: [One2.Repo]

# Configures the endpoint
config :one2platform, One2.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1tqhu76JBBguQVmvh7W0dTDJEdXKkerYpplA4hKwvO5Wb78gr4Y482MguAEXmo9x",
  render_errors: [view: One2.ErrorView, accepts: ~w(html json)],
  pubsub: [name: One2.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
