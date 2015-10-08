defmodule WidgetSaas.Repo.Migrations.CreateTenant do
  use Ecto.Migration

  def change do
    create table(:tenants) do
      add :name, :string

      timestamps
    end

  end
end
