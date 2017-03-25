defmodule Screencast.GraphQL.Schema do
  use Absinthe.Schema

  import_types Screencast.GraphQL.Types

  query do
    @desc "Lists all the series in the system."
    field :series, list_of(:series) do
      resolve &Screencast.GraphQL.SeriesResolver.list/2
    end
  end

  mutation do
    @desc "Creates a series with the given title."
    field :create_series, :series do
      arg :title, non_null(:string)

      resolve &Screencast.GraphQL.SeriesResolver.create/2
    end

    @desc "Creates an episode for a given series."
    field :create_episode, :episode do
      @desc "The ID of the series this episode belongs to."
      arg :id, non_null(:integer)
      arg :title, non_null(:string)

      resolve &Screencast.GraphQL.EpisodeResolver.create/2
    end
  end
end
