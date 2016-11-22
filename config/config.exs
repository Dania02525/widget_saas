# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :widget_saas, WidgetSaas.Endpoint, 
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "i35n+Zs3wCJfK9zwDKPu/5aSV9UJsDAMkgNPntktiUDZP9Ol7CWqxWhhZXhEkPEX",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: WidgetSaas.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :widget_saas, ecto_repos: [WidgetSaas.Repo]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
