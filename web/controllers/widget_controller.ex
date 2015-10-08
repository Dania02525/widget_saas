defmodule WidgetSaas.WidgetController do
  use WidgetSaas.Web, :controller

  alias WidgetSaas.Widget

  plug :scrub_params, "widget" when action in [:create, :update]

  def index(conn, %{"tenant_id" => tenant_id}) do

    widgets = Apartmentex.all(Repo, Widget, tenant_id)
    render(conn, "index.html", widgets: widgets, tenant_id: tenant_id)
  end

  def new(conn, %{"tenant_id" => tenant_id}) do
    changeset = Widget.changeset(%Widget{})
    render(conn, "new.html", changeset: changeset, tenant_id: tenant_id)
  end

  def create(conn, %{"widget" => widget_params, "tenant_id" => tenant_id}) do
    changeset = Widget.changeset(%Widget{}, widget_params)

    case Apartmentex.insert(Repo, changeset, tenant_id) do
      {:ok, _widget} ->
        conn
        |> put_flash(:info, "Widget created successfully.")
        |> redirect(to: tenant_widget_path(conn, :index, tenant_id))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset, tenant_id: tenant_id)
    end
  end

  def show(conn, %{"id" => id, "tenant_id" => tenant_id}) do
    widget = Apartmentex.get(Repo, Widget, id, tenant_id)
    render(conn, "show.html", widget: widget, tenant_id: tenant_id)
  end

  def edit(conn, %{"id" => id, "tenant_id" => tenant_id}) do
    widget = Apartmentex.get!(Repo, Widget, id, tenant_id)
    changeset = Widget.changeset(widget)
    render(conn, "edit.html", widget: widget, changeset: changeset, tenant_id: tenant_id)
  end

  def update(conn, %{"id" => id, "widget" => widget_params, "tenant_id" => tenant_id}) do
    widget = Apartmentex.get!(Repo, Widget, id, tenant_id)
    changeset = Widget.changeset(widget, widget_params)

    case Apartmentex.update(Repo, changeset, tenant_id) do
      {:ok, widget} ->
        conn
        |> put_flash(:info, "Widget updated successfully.")
        |> redirect(to: tenant_widget_path(conn, :show, tenant_id, widget))
      {:error, changeset} ->
        render(conn, "edit.html", widget: widget, changeset: changeset, tenant_id: tenant_id)
    end
  end

  def delete(conn, %{"id" => id, "tenant_id" => tenant_id}) do
    widget = Apartmentex.get!(Repo, Widget, id, tenant_id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Apartmentex.delete!(Repo, widget, tenant_id)

    conn
    |> put_flash(:info, "Widget deleted successfully.")
    |> redirect(to: tenant_widget_path(conn, :index, tenant_id))
  end
end
