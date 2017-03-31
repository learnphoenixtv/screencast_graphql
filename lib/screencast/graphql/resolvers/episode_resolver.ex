defmodule Screencast.GraphQL.EpisodeResolver do
  import Absinthe.Resolution.Helpers
  import Ecto.Query

  alias Screencast.{
    Episode,
    Repo
  }

  def assoc(_args, %{source: series}) do
    batch {__MODULE__, :by_series_id}, series.id, fn results ->
      {:ok, Map.get(results, series.id)}
    end
  end

  def create(%{id: id, title: title}, _context) do
    episode = Repo.insert! %Episode{series_id: id, title: title}
    {:ok, episode}
  end

  def by_series_id(_, ids) do
    Episode
    |> where([s], s.series_id in ^ids)
    |> Repo.all
    |> Enum.group_by(&(&1.series_id))
  end
end
