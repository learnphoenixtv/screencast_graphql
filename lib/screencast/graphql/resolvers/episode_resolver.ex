defmodule Screencast.GraphQL.EpisodeResolver do
  alias Screencast.{
    Episode,
    Repo
  }

  def assoc(_args, %{source: series}) do
    series = Repo.preload(series, :episodes)
    {:ok, series.episodes}
  end

  def create(%{id: id, title: title}, _context) do
    episode = Repo.insert! %Episode{series_id: id, title: title}
    {:ok, episode}
  end
end
