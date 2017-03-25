defmodule Screencast.GraphQL.Schema do
  use Absinthe.Schema

  alias Screencast.{
    Episode,
    Series,
    Repo
  }

  @desc "A screencast episode. Belongs to a series."
  object :episode do
    field :id, :integer
    field :title, :string
  end

  @desc "An episode series, like LearnPhoenix."
  object :series do
    field :id, :integer
    field :title, :string
    field :episodes, list_of(:episode) do
      resolve fn(args, %{source: series}) ->
        series = Repo.preload(series, :episodes)
        {:ok, series.episodes}
      end
    end
  end

  query do
    @desc "Lists all the series in the system."
    field :series, list_of(:series) do
      resolve fn(_args, _context) ->
        {:ok, Repo.all(Series) }
      end
    end
  end

  mutation do
    @desc "Creates a series with the given title."
    field :create_series, :series do
      arg :title, non_null(:string)

      resolve fn(%{title: title}, _context) ->
        series = Repo.insert! %Series{title: title}
        {:ok, series}
      end
    end

    @desc "Creates an episode for a given series."
    field :create_episode, :episode do
      @desc "The ID of the series this episode belongs to."
      arg :id, non_null(:integer)
      arg :title, non_null(:string)

      resolve fn(%{id: id, title: title}, _context) ->
        episode = Repo.insert! %Episode{series_id: id, title: title}
        {:ok, episode}
      end
    end
  end
end
