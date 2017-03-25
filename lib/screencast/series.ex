defmodule Screencast.Series do
  use Ecto.Schema

  schema "series" do
    field :title, :string
    has_many :episodes, Screencast.Episode

    timestamps()
  end
end
