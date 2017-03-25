defmodule Screencast.GraphQL.SeriesResolver do
  alias Screencast.{
    Series,
    Repo
  }

  def list(_args, _context) do
    {:ok, Repo.all(Series) }
  end

  def create(%{title: title}, _context) do
    {:ok, Repo.insert!(%Series{title: title})}
  end
end
