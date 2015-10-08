defmodule WidgetSaas.Router do
  use WidgetSaas.Web, :router

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

  scope "/", WidgetSaas do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/tenants", TenantController do
      resources "/widgets", WidgetController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", WidgetSaas do
  #   pipe_through :api
  # end
end
