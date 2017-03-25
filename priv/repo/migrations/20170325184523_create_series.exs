defmodule Screencast.Repo.Migrations.CreateScreencast.Series do
  use Ecto.Migration

  def change do
    create table(:series) do
      add :title, :string

      timestamps()
    end

  end
end
