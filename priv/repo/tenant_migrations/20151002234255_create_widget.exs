defmodule WidgetSaas.Repo.Migrations.CreateWidget do
  use Apartmentex.Migration

  def change do
    create table(:widgets) do
      add :name, :string
      add :widget_type_id, references(:widget_types)

      timestamps
    end

    create index(:widgets, [:name])

  end
end
