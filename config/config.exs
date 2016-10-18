# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :amnesia_phoenix,
  ecto_repos: [AmnesiaPhoenix.Repo]

# Configures the endpoint
config :amnesia_phoenix, AmnesiaPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LHWMfH9ZGqEDIAs5559XJ/IEYYth2Et66/LOMBuSFLhdmNcPGHVxeCtJ4lMzz3RC",
  render_errors: [view: AmnesiaPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AmnesiaPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
