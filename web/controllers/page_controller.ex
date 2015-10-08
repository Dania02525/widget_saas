defmodule WidgetSaas.PageController do
  use WidgetSaas.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
