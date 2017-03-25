defmodule Screencast.GraphQL.Types do
  use Absinthe.Schema.Notation

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
      resolve &Screencast.GraphQL.EpisodeResolver.assoc/2
    end
  end
end
