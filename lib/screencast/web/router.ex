defmodule Screencast.Web.Router do
  use Screencast.Web, :router

  forward "/graphql", Absinthe.Plug.GraphiQL, schema: Screencast.GraphQL.Schema
end
