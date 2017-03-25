defmodule Screencast.Web.Router do
  use Screencast.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Screencast.Web do
    pipe_through :api
  end
end
