defmodule Screencast.Episode do
  use Ecto.Schema

  schema "episodes" do
    field :title, :string
    field :series_id, :id

    timestamps()
  end
end
