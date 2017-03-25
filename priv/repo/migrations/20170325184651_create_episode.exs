defmodule Screencast.Repo.Migrations.CreateScreencast.Episode do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :title, :string
      add :series_id, references(:series, on_delete: :nothing)

      timestamps()
    end

    create index(:episodes, [:series_id])
  end
end
