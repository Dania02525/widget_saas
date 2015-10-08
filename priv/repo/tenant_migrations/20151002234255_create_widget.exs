defmodule WidgetSaas.Repo.Migrations.CreateWidget do
  use Apartmentex.Migration

  def change do
    create table(:widgets) do
      add :name, :string

      timestamps
    end

  end
end
