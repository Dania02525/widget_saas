defmodule WidgetSaas.Repo.Migrations.CreateWidgetTypes do
  use Ecto.Migration

  def change do
    create table(:widget_types) do
      add :name, :string

      timestamps
    end

    create index(:widget_types, [:name])

  end
end
